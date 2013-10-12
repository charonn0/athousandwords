#tag Class
Protected Class CompositeContainer
Inherits Canvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If MagOn Then Return True
		  
		  If Me.Mode = Mode_Eyedropper Then
		    Return RaiseEvent MouseDown(X, Y)  //Eyedropper mode so raise the event to the instance handler
		  End If
		  
		  Dim ret As Boolean
		  'Check if we're dragging the resize thumb
		  If X >= Buffer.Width + ViewX And X <= Buffer.Width + ViewX + 5 And Y >= Buffer.Height + ViewY And Y <= Buffer.Height + ViewY + 5 Then
		    Resizing = True
		    Me.MouseCursor = System.Cursors.ArrowNorthwestSoutheast
		    Return True
		    If IsContextualClick Then
		      Overlay = Nil
		      Invalidate(False)
		      CancelDraw = True
		      ret = True
		      GoTo Finish
		    End If
		    Invalidate(False)
		  End If
		  
		  Select Case Mode
		  Case Mode_DrawLine, Mode_Draw_Circle, Mode_Draw_Rect, Mode_Draw_Freeform, Mode_Select_Rect, Mode_Draw_Filled_Rect, Mode_Draw_Filled_Circle
		    DragStartX = X
		    DragStartY = Y
		  Case Mode_Draw_Point
		    AddPoint(X, Y, LineWidth, LineWidth)
		  Case Mode_Fill
		    Fill(X, Y)
		  End Select
		  
		  Finish:
		  Return ret Or Not RaiseEvent MouseDown(X, Y)
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  If MagOn Then Return
		  If Not Resizing Then
		    Select Case Mode
		    Case Mode_DrawLine
		      PreviewLine(DragStartX, DragStartY, X, Y)
		    Case Mode_Draw_Circle
		      PreviewOval(DragStartX, DragStartY, X - DragStartX, Y - DragStartY)
		    Case Mode_Draw_Rect
		      PreviewRect(DragStartX, DragStartY, X - DragStartX, Y - DragStartY)
		    Case Mode_Draw_Filled_Rect
		      PreviewRect(DragStartX, DragStartY, X - DragStartX, Y - DragStartY, True)
		    Case Mode_Draw_Filled_Circle
		      PreviewOval(DragStartX, DragStartY, X - DragStartX, Y - DragStartY, True)
		    Case Mode_Select_Rect
		      'SelectRegion(DragStartX, DragStartY, X - DragStartX, Y - DragStartY)
		    Case Mode_Draw_Freeform
		      PreviewFreePoint(X, Y)
		    End Select
		  Else
		    DragStartX = X
		    DragStartY = Y
		    
		    Invalidate(False)
		  End If
		  CoordChanged(X, Y)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  If Not MagOn Or Not (Window(0) Is Self.Window) Then
		    If X >= Buffer.Width + ViewX And X <= Buffer.Width + ViewX + 5 And Y >= Buffer.Height + ViewY And Y <= Buffer.Height + ViewY + 5 Then
		      Me.mousecursor = System.Cursors.ArrowNorthwestSoutheast
		      If Resizing Then
		        DragStartX = X
		        DragStartY = Y
		        Invalidate(False)
		      End If
		    End If
		    CoordChanged(TrueX(X), TrueY(Y))
		    RaiseEvent MouseMove(System.MouseX, System.MouseY)
		  Else
		    Invalidate(False)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  If MagOn Then Return
		  Select Case Mode
		  Case Mode_DrawLine
		    DrawLine(DragStartX, DragStartY, X, Y)
		  Case Mode_Draw_Circle
		    DrawOval(DragStartX, DragStartY, X - DragStartX, Y - DragStartY)
		  Case Mode_Draw_Rect
		    DrawRect(DragStartX, DragStartY, X - DragStartX, Y - DragStartY)
		  Case Mode_Draw_Filled_Rect
		    DrawRect(DragStartX, DragStartY, X - DragStartX, Y - DragStartY, True)
		  Case Mode_Draw_Filled_Circle
		    DrawOval(DragStartX, DragStartY, X - DragStartX, Y - DragStartY, True)
		  Case Mode_Draw_Freeform
		    AddFreePoint(X, Y)
		  End Select
		  
		  If Resizing Then
		    SaveUndo(True)
		    'Me.mousecursor = MainWindow.CurrentCursor
		    Resizing = False
		    Dim tmp As Picture = NewBuffer(X - ViewX, Y - ViewY, 32)
		    'tmp.Transparent = Me.IsTransparent
		    tmp.Graphics.DrawPicture(Buffer, 0, 0)
		    tmp.Graphics.ForeColor = CurrentColor
		    tmp.Graphics.PenWidth = LineWidth
		    tmp.Graphics.PenHeight = LineWidth
		    Buffer = tmp
		    Refresh(True)
		    Tainted(False)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Me.AcceptFocus = True
		  Reset()
		  SetTitle(FileName)
		  Me.AcceptPictureDrop
		  Me.AcceptFileDrop(FileTypes1.AllSupportedImageTypes)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  g.AntiAlias = False
		  If Me.Taint Then
		    Me.Taint = False
		    Tainted(False)
		  End If
		  Dim tmp As Picture = NewBuffer(g.Width, g.Height, 32)
		  
		  tmp.Graphics.ForeColor = &c808080  //Dark grey
		  tmp.Graphics.FillRect(0, 0, g.Width, g.Height)
		  tmp.Graphics.DrawPicture(Buffer, ViewX, ViewY)
		  
		  tmp.Graphics.DrawPicture(Overlay, 0, 0)
		  tmp.Graphics.ForeColor = &c494949
		  tmp.Graphics.FillRect(Buffer.Width + ViewX, Buffer.Height + ViewY, 5, 5)  //Resize thumb
		  If Mode <> Mode_Draw_Freeform Then Overlay = Nil
		  
		  If Resizing Then
		    tmp.Graphics.ForeColor = &c00FF00
		    tmp.Graphics.PenHeight = 3
		    tmp.Graphics.PenWidth = 3
		    tmp.Graphics.DrawLine(DragStartX + 1, DragStartY + 1, DragStartX + 1, 0)
		    tmp.Graphics.DrawLine(DragStartX + 1, DragStartY + 1, 0, DragStartY + 1)
		  End If
		  
		  tmp.Graphics.ForeColor = CurrentColor
		  tmp.Graphics.PenWidth = LineWidth
		  tmp.Graphics.PenHeight = LineWidth
		  If MagOn Then
		    'Me.mousecursor = System.Cursors.MagnifyLarger
		    Magnify(Me.MouseX, Me.MouseY, MagSize * g.Height \ 1000, MagSize * g.Height \ 1000, tmp)
		  Else
		    'Me.mousecursor = MainWindow.CurrentCursor
		  End If
		  g.DrawPicture(tmp, 0, 0)
		  
		  
		  
		Exception err As OutOfMemoryException
		  MemoryManager.Emergency_DUMP()
		  Buffer = Nil
		  FullSizeBuffer = Nil
		  Overlay = Nil
		  ReDim UnDos(-1)
		  ReDim ReDos(-1)
		  Reset()
		  Static noted As Boolean
		  If Not noted Then
		    Call NotifyDataLoss("An OutOfMemoryException occured when attempting to save an undo point. The oldest undo point could not be deleted to free memory as there are no undo points." + _
		    "Most likely this is due to the size of the current buffer; due to internal limitations, unusually large image files (>10MB) will trigger this" + _
		    "error on every attempt to edit the buffer. There is no workaround at this time.")
		    noted = False
		  End If
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub AddFreePoint(X As Integer, Y As Integer)
		  If CancelDraw Then
		    CancelDraw = False
		    Invalidate(False)
		    Return
		  End If
		  If X <= Buffer.Width And X > 0 And Y <= Buffer.Height And Y > 0 Then
		    SaveUndo()
		    Buffer.Graphics.DrawPicture(Overlay, TrueX(0), TrueY(0))
		    Overlay = Nil
		    Taint = True
		    Invalidate(False)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AddPoint(X As Integer, Y As Integer, Width As Integer, Height As Integer)
		  If X <= Buffer.Width And X > 0 And Y <= Buffer.Height And Y > 0 Then
		    If CancelDraw Then
		      CancelDraw = False
		      Invalidate(False)
		      Return
		    End If
		    SaveUndo()
		    Buffer.Graphics.FillRect(TrueX(X), TrueY(Y), Width, Height)
		    Taint = True
		    Invalidate(False)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckMode(themode As Integer) As Boolean
		  Return BitAnd(Mode, themode) = themode
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  Dim X, Y As Integer
		  X = Me.MouseX
		  Y = Me.MouseY
		  If X <= Buffer.Width And X > 0 And Y <= Buffer.Height And Y > 0 Then
		    SaveUndo()
		    Dim c As Color
		    Dim i As Integer
		    c = CurrentColor
		    i = LineWidth
		    Buffer = NewBuffer(Buffer.Width, Buffer.Height, 32)
		    buffer.Graphics.TextFont = Font
		    buffer.Graphics.TextSize = FontSize
		    TheMask = Buffer.Mask(False)
		    LineWidth = i
		    CurrentColor = c
		    Me.Invalidate(False)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CopyRegion(X As Integer, Y As Integer, Width As Integer, Height As Integer) As Picture
		  Dim p As Picture = NewBuffer(Width, Height, 32)
		  p.Graphics.DrawPicture(Buffer, 0, 0, Buffer.Width, Buffer.Height, X, Y, Buffer.Width, Buffer.Height)
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteRedo(Index As Integer)
		  Redos.Remove(Index)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteUndo(Index As Integer)
		  Undos.Remove(Index)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawLine(X1 As Integer, Y1 As Integer, X2 As Integer, Y2 As Integer)
		  If CancelDraw Then
		    CancelDraw = False
		    Invalidate(False)
		    Return
		  End If
		  SaveUndo()
		  
		  If X2 < 0 Then
		    X2 = Abs(X2)
		    X1 = X1 - X2
		  End If
		  If Y2 < 0 Then
		    Y2 = Abs(Y2)
		    Y1 = Y1 - Y2
		  End If
		  
		  'Buffer.Graphics.PenWidth = 10
		  'Buffer.Graphics.PenHeight = 10
		  'Buffer.Graphics.ForeColor = &c00FF59
		  Buffer.Graphics.DrawLine(X1, Y1, X2, Y2)
		  Taint = True
		  Invalidate(False)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawOval(X As Integer, Y As Integer, Width As Integer, Height As Integer, Fill As Boolean = False)
		  If X <= Buffer.Width And X > 0 And Y <= Buffer.Height And Y > 0 Then
		    If CancelDraw Then
		      CancelDraw = False
		      Invalidate(False)
		      Return
		    End If
		    SaveUndo()
		    If Not Fill Then
		      Buffer.Graphics.DrawOval(TrueX(X), TrueY(Y), Width, Height)
		    Else
		      Buffer.Graphics.FillOval(TrueX(X), TrueY(Y), Width, Height)
		    End If
		    Taint = True
		    Invalidate(False)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawRect(X As Integer, Y As Integer, Width As Integer, Height As Integer, Fill As Boolean = False)
		  If X <= Buffer.Width And X > 0 And Y <= Buffer.Height And Y > 0 Then
		    If CancelDraw Then
		      CancelDraw = False
		      Invalidate(False)
		      Return
		    End If
		    SaveUndo()
		    If Width < 0 Then
		      Width = Abs(Width)
		      X = X - Width
		    End If
		    If Height < 0 Then
		      Height = Abs(Height)
		      Y = Y - Height
		    End If
		    If Not Fill Then
		      Buffer.Graphics.DrawRect(TrueX(X), TrueY(Y), Width, Height)
		    Else
		      Buffer.Graphics.FillRect(TrueX(X), TrueY(Y), Width, Height)
		    End If
		    Taint = True
		    Invalidate(False)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Fill(X As Integer, Y As Integer)
		  
		  If X <= Buffer.Width And X > 0 And Y <= Buffer.Height And Y > 0 Then
		    If CancelDraw Then
		      CancelDraw = False
		      Invalidate(False)
		      Return
		    End If
		    SaveUndo()
		    Buffer.RGBSurface.FloodFill(TrueX(X), TrueY(Y), CurrentColor)
		    Taint = True
		    Invalidate(False)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Magnify(X As Integer, Y As Integer, w As Integer, h As Integer, ByRef tmp As Picture)
		  Dim pw, ph As Integer
		  pw = w / MagLevel
		  If pw <= 1 Then pw = 1
		  ph = h / MagLevel
		  If ph <= 1 Then ph = 1
		  
		  Dim p As Picture = NewBuffer(pw, ph, 32)
		  p.Graphics.DrawPicture(Buffer, 0, 0, Buffer.Width, Buffer.Height, X, Y, Buffer.Width, Buffer.Height)
		  p.Graphics.PenWidth = 1
		  p.Graphics.PenHeight = 1
		  p.Graphics.ForeColor = &c00FF59
		  p.Graphics.DrawRect(0, 0, p.Width, p.Height)
		  tmp.Graphics.DrawPicture(p, X, Y, w, h, 0, 0, p.Width, p.Height)
		  
		  Dim strW, strH As Integer
		  Dim nm As String = "Magnify (" + Str(MagLevel + 0.25) + "x) - Press Escape to cancel"
		  strW = p.Graphics.StringWidth(nm)
		  strH = p.Graphics.StringHeight(nm, 9999)
		  Dim namestr As Picture = NewBuffer(strW, strH, 32)
		  namestr.Graphics.ForeColor = &cFFFF80
		  namestr.Graphics.FillRect(0, 0, namestr.Width, namestr.Height)
		  namestr.Graphics.ForeColor = &c000000
		  namestr.Graphics.DrawString(nm, 0, namestr.Height - 5)
		  tmp.Graphics.DrawPicture(namestr, X + (0.5 * (w - namestr.Width)), Y, namestr.Width, namestr.Height, 0, 0, namestr.Width, namestr.Height)
		  
		  p = GetFramePicture("magnifying_glass.png")
		  tmp.Graphics.DrawPicture(p, tmp.Width - p.Width, tmp.Height - p.Height)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function NewBuffer(W As Integer = 500, h As Integer = 500, d As Integer = 32) As Picture
		  Dim p As New Picture(w, h, d)
		  p.Graphics.TextFont = Font
		  p.Graphics.TextSize = FontSize
		  If buffer <> Nil Then
		    p.Graphics.ForeColor = CurrentColor
		    p.Graphics.PenHeight = Me.LineWidth
		    p.Graphics.PenWidth = Me.LineWidth
		    p.Graphics.AntiAlias = False
		  End If
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Open(f As FolderItem)
		  If f <> Nil Then
		    If RaiseEvent CancelOpen Then Return
		    If f.Exists Then
		      Me.Enabled = False
		      Dim p As Picture = GetFramePicture(LoadPicFile(f))
		      mOverlay = Nil
		      If p <> Nil Then
		        Reset()
		        Buffer = NewBuffer(p.Width, p.Height, 32)
		        Buffer.Graphics.DrawPicture(p, 0, 0)
		        #pragma BreakOnExceptions Off
		        Try
		          TheMask = Buffer.Mask(False)
		        Catch
		          TheMask = Nil
		        End Try
		        #pragma BreakOnExceptions On
		        FileName = f.Name
		        Tainted(True)
		        ReDim Undos(-1)
		        ReDim Redos(-1)
		        Refresh(True)
		        If Buffer.Width > Me.Width Or Buffer.Height > Me.Height Then
		          MustScroll = True
		        Else
		          MustScroll = False
		        End If
		      End If
		      ViewX = 0
		      ViewY = 0
		      Me.Enabled = True
		    Else
		      MsgBox("The picture is invalid.")
		    End If
		  End If
		  
		Exception OutOfMemoryException
		  Reset()
		  Call NotifyDataLoss("An OutOfMemoryException occured when attempting to save an undo point. The oldest undo point could not be deleted to free memory as there are no undo points." + _
		  "Most likely this is due to the size of the current buffer; due to internal limitations, unusually large image files (>10MB) will trigger this" + _
		  "error on every attempt to edit the buffer. There is no workaround at this time.")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Open(p As Picture)
		  If p = Nil Then Return
		  If RaiseEvent CancelOpen Then Return
		  Buffer = p
		  TheMask = p.Mask(False)
		  'If FileName <> "Slideshow" Then FileName = "New Picture"
		  Overlay = Nil
		  Tainted(True)
		  Invalidate(False)
		  If Buffer.Width > Me.Width Or Buffer.Height > Me.Height Then
		    MustScroll = True
		  Else
		    MustScroll = False
		  End If
		  ViewX = 0
		  ViewY = 0
		  ReDim Undos(-1)
		  ReDim Redos(-1)
		  
		Exception OutOfMemoryException
		  Buffer = Nil
		  FullSizeBuffer = Nil
		  Overlay = Nil
		  ReDim UnDos(-1)
		  ReDim ReDos(-1)
		  Reset()
		  Call NotifyDataLoss("An OutOfMemoryException occured when attempting to save an undo point. The oldest undo point could not be deleted to free memory as there are no undo points." + _
		  "Most likely this is due to the size of the current buffer; due to internal limitations, unusually large image files (>10MB) will trigger this" + _
		  "error on every attempt to edit the buffer. There is no workaround at this time.")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PreviewFreePoint(X As Integer, Y As Integer)
		  Overlay.Graphics.DrawLine(DragStartX, DragStartY, X, Y)
		  DragStartX = X
		  DragStartY = Y
		  Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PreviewLine(X1 As Integer, Y1 As Integer, X2 As Integer, Y2 As Integer)
		  If X2 < 0 Then
		    X2 = Abs(X2)
		    X1 = X1 - X2
		  End If
		  If Y2 < 0 Then
		    Y2 = Abs(Y2)
		    Y1 = Y1 - Y2
		  End If
		  
		  'Overlay.Graphics.PenWidth = 1
		  'Overlay.Graphics.PenHeight = 1
		  'Overlay.Graphics.ForeColor = &c00FF59
		  Overlay.Graphics.DrawLine(X1, Y1, X2, Y2)
		  Refresh(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PreviewOval(X As Integer, Y As Integer, Width As Integer, Height As Integer, Fill As Boolean = False)
		  If Not Fill Then
		    Overlay.Graphics.DrawOval(X, Y, Width, Height)
		  Else
		    Overlay.Graphics.FillOval(X, Y, Width, Height)
		  End If
		  
		  Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PreviewRect(X As Integer, Y As Integer, Width As Integer, Height As Integer, Fill As Boolean = False)
		  If Width < 0 Then
		    Width = Abs(Width)
		    X = X - Width
		  End If
		  If Height < 0 Then
		    Height = Abs(Height)
		    Y = Y - Height
		  End If
		  If Not Fill Then
		    Overlay.Graphics.DrawRect(X, Y, Width, Height)
		  Else
		    Overlay.Graphics.FillRect(X, Y, Width, Height)
		  End If
		  
		  Refresh(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReDo() As Boolean
		  If UBound(Redos) > -1 Then
		    SaveUndo()
		    Dim s As String = Redos.Pop
		    Buffer = GetFramePicture(s)
		    MemoryManager.MemoryManager.DeleteCachedImage(s)
		    Overlay = Nil
		    Invalidate(False)
		    Return UBound(Redos) > -1
		  Else
		    Return False
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Replace(NewPic As Picture)
		  SaveUndo(True)
		  Buffer = NewPic
		  Overlay = Nil
		  
		  If Buffer.Width > Me.Width Or Buffer.Height > Me.Height Then
		    MustScroll = True
		  Else
		    MustScroll = False
		  End If
		  ViewX = 0
		  ViewY = 0
		  Refresh(True)
		  Tainted(True)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  For i As Integer = 0 To UBound(UnDos)
		    MemoryManager.DeleteCachedImage(UnDos(i))
		  Next
		  
		  For i As Integer = 0 To UBound(Redos)
		    MemoryManager.DeleteCachedImage(Redos(i))
		  Next
		  ReDim Redos(-1)
		  ReDim Undos(-1)
		  Buffer = Nil
		  FullSizeBuffer = Nil
		  Overlay = Nil
		  Buffer = NewBuffer(500, 500, 32)
		  buffer.Graphics.TextFont = Font
		  buffer.Graphics.TextSize = FontSize
		  
		  TheMask = Nil
		  Me.Invalidate(False)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rotate()
		  SaveUndo()
		  Dim key As String = Undos(Undos.Ubound)
		  Dim rtw As New rotatewin
		  Dim key1 As String = rtw.ShowRotate(Key)
		  DeleteUndo(Undos.Ubound)
		  If Key1 <> Key Then
		    SaveUndo(True)
		    Replace(GetFramePicture(key1))
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save(f As FolderItem, m As Integer)
		  If f <> Nil Then
		    Buffer.Save(f, m)
		    FileName = f.Name
		    BackingFile = f
		    Tainted(True)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SaveRedo()
		  Taint = True
		  Dim p As Picture = NewBuffer(Buffer.Width, Buffer.Height, Buffer.Depth)
		  p.Mask = Buffer.Mask(False)
		  p.Graphics.DrawPicture(Buffer, 0, 0)
		  p.Graphics.ForeColor = CurrentColor
		  p.Graphics.PenWidth = LineWidth
		  p.Graphics.PenHeight = LineWidth
		  Dim sf As New StackFrame(p)
		  Redos.Append(sf.Key)
		  AddStackFrame(sf)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SaveUndo(Force As Boolean = False)
		  Taint = True
		  Dim p As Picture
		  Try
		    Dim X, Y As Integer
		    X = Me.MouseX
		    Y = Me.MouseY
		    If (X <= Buffer.Width And X > 0 And Y <= Buffer.Height And Y > 0) Or Force Then
		      p = NewBuffer(Buffer.Width, Buffer.Height, Buffer.Depth)
		      p.Mask = Buffer.Mask(False)
		      p.Graphics.DrawPicture(Buffer, 0, 0)
		      p.Graphics.ForeColor = CurrentColor
		      p.Graphics.PenWidth = LineWidth
		      p.Graphics.PenHeight = LineWidth
		      Dim sf As New StackFrame(p)
		      Undos.Append(sf.Key)
		      AddStackFrame(sf)
		    End If
		  Catch OutOfMemoryException
		    'Redos.Remove(0)
		    ''Call NotifyDataLoss("An OutOfMemoryException occured when attempting to save an undo point. The oldest undo point was deleted to free memory.")
		    'Catch OutOfBoundsException
		    //Kill everything!!
		    p = Nil
		    MemoryManager.Emergency_DUMP()
		    Buffer = Nil
		    FullSizeBuffer = Nil
		    Overlay = Nil
		    ReDim UnDos(-1)
		    ReDim ReDos(-1)
		    Reset()
		    Static noted As Boolean
		    If Not noted Then
		      Call NotifyDataLoss("An OutOfMemoryException occured when attempting to save an undo point. The oldest undo point could not be deleted to free memory as there are no undo points." + _
		      "Most likely this is due to the size of the current buffer; due to internal limitations, unusually large image files (>10MB) will trigger this" + _
		      "error on every attempt to edit the buffer. There is no workaround at this time.")
		      noted = False
		    End If
		  End Try
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Scale()
		  SaveUndo()
		  Dim sw As New ScaleWindow
		  Dim locked As Boolean
		  Dim newSize As Pair = sw.ShowMe(Buffer.Width:Buffer.Height, locked)
		  
		  
		  If locked Then
		    Dim sc As Double = newSize.Left / Buffer.Width
		    Buffer = Scale(Buffer, sc)
		  Else
		    Dim tmp As Picture = NewBuffer(newSize.Left, newSize.Right, 32)
		    'tmp.Transparent = Me.IsTransparent
		    tmp.Graphics.DrawPicture(Buffer, 0, 0, tmp.Width, tmp.Height, 0, 0, Buffer.Width, Buffer.Height)
		    tmp.Graphics.ForeColor = CurrentColor
		    tmp.Graphics.PenWidth = LineWidth
		    tmp.Graphics.PenHeight = LineWidth
		    Buffer = tmp
		  End If
		  
		  
		  
		  
		  Taint = True
		  Refresh(True)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollX(X As Integer)
		  ViewX = -(X * Me.ActualSize.Left \ 100)
		  
		  
		  'If Y <> -1 Then ViewY = Y + ViewY
		  Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollY(Y As Integer)
		  ViewY = -(Y * Me.ActualSize.Right \ 100)
		  
		  'If Y <> -1 Then ViewY = Y + ViewY
		  Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function TrueX(X As Integer) As Integer
		  //Given the X coordinate relative to the control, returns the X coordinate relative to the buffer
		  Return X - ViewX
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function TrueY(Y As Integer) As Integer
		  //Given the Y coordinate relative to the control, returns the Y coordinate relative to the buffer
		  Return Y - ViewY
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Undo() As Boolean
		  If UBound(Undos) > -1 Then
		    SaveRedo()
		    Dim s As String = Undos.Pop
		    Buffer = GetFramePicture(s)
		    MemoryManager.DeleteCachedImage(s)
		    Overlay = Nil
		    Invalidate(False)
		    Return UBound(Undos) > -1
		  Else
		    Return False
		  End If
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event CancelOpen() As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ClearSelection()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CoordChanged(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDown(X As Integer, Y As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseMove(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SetTitle(NewTitle As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Tainted(NewFile As Boolean)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Buffer.Width:Buffer.Height
			End Get
		#tag EndGetter
		ActualSize As Pair
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		BackingFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			This is our temporary drawing buffer. Perform all drawing on this buffer and then draw the buffer to the Canvas in the Paint event.
		#tag EndNote
		buffer As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		CancelDraw As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Buffer.Graphics.ForeColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Buffer.Graphics.ForeColor = value
			  Overlay.Graphics.ForeColor = value
			End Set
		#tag EndSetter
		CurrentColor As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		DragEndX As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		DragEndY As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		DragStartX As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		DragStartY As Integer = -1
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mFileName
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mFileName = value
			  SetTitle(value)
			End Set
		#tag EndSetter
		FileName As String
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Font As String = "System"
	#tag EndProperty

	#tag Property, Flags = &h0
		FontSize As Integer = 11
	#tag EndProperty

	#tag Property, Flags = &h21
		Private FullSizeBuffer As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private HelpText As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Used in dragging, stores the previous X coordinate
		#tag EndNote
		lastX As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Used in dragging, stores the previous Y coordinate
		#tag EndNote
		lastY As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Buffer.Graphics.PenHeight
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #pragma BreakOnExceptions Off
			  Buffer.Graphics.PenHeight = value
			  Buffer.Graphics.PenWidth = value
			  
			  Overlay.Graphics.PenHeight = value
			  Overlay.Graphics.PenWidth = value
			  
			  Exception
			    Return
			End Set
		#tag EndSetter
		LineWidth As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mMagLevel
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value < 0.25 Then
			    mMagLevel = 0.25
			  Else
			    mMagLevel = value
			  End If
			End Set
		#tag EndSetter
		MagLevel As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mMagSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value < 50 Then value = 50
			  mMagSize = value
			End Set
		#tag EndSetter
		MagSize As Double
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		MasterMode As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFileName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMagLevel As Double = 0.75
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMagSize As Integer = 200
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMode As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mMode
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  DragStartX = -1
			  DragStartY = -1
			  mMode = value Or MasterMode
			End Set
		#tag EndSetter
		Mode As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mOverlay As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTransparent As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		MustScroll As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mOverlay = Nil Then
			    mOverlay = NewBuffer(Buffer.Width, Buffer.Height, 32)
			    mOverlay.Transparent = 1
			    mOverlay.Graphics.ForeColor = CurrentColor
			    mOverlay.Graphics.PenHeight = LineWidth
			    mOverlay.Graphics.PenWidth = LineWidth
			  End If
			  return mOverlay
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mOverlay = value
			End Set
		#tag EndSetter
		Overlay As Picture
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Redos.Ubound > -1
			End Get
		#tag EndGetter
		ReDoable As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Redos() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Resizing As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Scrolling As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Taint As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		TheMask As Picture
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Undos.Ubound > -1
			End Get
		#tag EndGetter
		UnDoable As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Undos() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ViewX As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ViewY As Integer
	#tag EndProperty


	#tag Constant, Name = Mode_DrawLine, Type = Double, Dynamic = False, Default = \"&b00000000000000000000000000001000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Mode_Draw_Circle, Type = Double, Dynamic = False, Default = \"&b00000000000000000000000000010000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Mode_Draw_Filled_Circle, Type = Double, Dynamic = False, Default = \"&b00000000000000000000000000100000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Mode_Draw_Filled_Rect, Type = Double, Dynamic = False, Default = \"&b00000000000000000000000001000000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Mode_Draw_Freeform, Type = Double, Dynamic = False, Default = \"&b00000000000000000000000010000000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Mode_Draw_Point, Type = Double, Dynamic = False, Default = \"&b00000000000000000000000100000000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Mode_Draw_Rect, Type = Double, Dynamic = False, Default = \"&b00000000000000000000001000000000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Mode_Eyedropper, Type = Double, Dynamic = False, Default = \"&b00000000000000010000000000000000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Mode_Fill, Type = Double, Dynamic = False, Default = \"&b00000000000000000000010000000000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Mode_Select_Rect, Type = Double, Dynamic = False, Default = \"&b00000000000000000000100000000000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Select_Mode_Copy, Type = Double, Dynamic = False, Default = \"&b00000000000000000001000000000000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Select_Mode_Cut, Type = Double, Dynamic = False, Default = \"&b00000000000000000010000000000000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Select_Mode_Delete, Type = Double, Dynamic = False, Default = \"&b00000000000000000010000000000000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Select_Mode_To_Buffer, Type = Double, Dynamic = False, Default = \"&b00000000000000000100000000000000", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="buffer"
			Group="Behavior"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CancelDraw"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CurrentColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DragEndX"
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DragEndY"
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DragStartX"
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DragStartY"
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FileName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Font"
			Group="Behavior"
			InitialValue="System"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontSize"
			Group="Behavior"
			InitialValue="11"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="lastX"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="lastY"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineWidth"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MagLevel"
			Group="Behavior"
			InitialValue="2"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MagSize"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MasterMode"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Mode"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MustScroll"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Overlay"
			Group="Behavior"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReDoable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Resizing"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Scrolling"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Taint"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TheMask"
			Group="Behavior"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UnDoable"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ViewX"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ViewY"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
