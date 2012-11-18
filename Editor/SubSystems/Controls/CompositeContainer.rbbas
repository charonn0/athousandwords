#tag Class
Protected Class CompositeContainer
Inherits Canvas
	#tag Event
		Sub DoubleClick(X As Integer, Y As Integer)
		  #pragma Unused X
		  #pragma Unused Y
		  If CheckMode(Master_Mode_Display) Then
		    If currentObject > -1 Then
		      ItemQuickSelected(Objects(currentObject).Properties.Value("Key"))
		    End If
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  #pragma Unused action
		  If Not RaiseEvent DropObject(Obj) Then
		    If Obj.FolderItemAvailable Then
		      Do
		        Dim file As FolderItem = Obj.FolderItem
		        Dim no As dragObject
		        Dim key As String = LoadPicFile(File)
		        no = New dragObject(GetFramePicture(key))
		        no.Properties.Value("Key") = key
		        addObject(no)
		      Loop Until Not Obj.NextItem
		    ElseIf Obj.PictureAvailable Then
		      Do
		        Dim p As Picture = Obj.Picture
		        Dim sf As New StackFrame(p)
		        Dim no As dragObject
		        no = New dragObject(GetFramePicture(sf.key))
		        no.Properties.Value("Key") = sf.key
		        addObject(no)
		        Icons.Value(sf.Key) = sf
		      Loop Until Not Obj.NextItem
		    End If
		    Arrange()
		    Invalidate(False)
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If currentObject > -1 Then
		    Select Case Key
		    Case Chr(&h7F)  //Delete
		      If Not DeleteItem(objects(currentObject).Properties.Value("Key")) Then
		        Objects.Remove(currentObject)
		        currentObject = -1
		        Invalidate(False)
		      End If
		    Case Chr(&h0D)
		      ItemQuickSelected(objects(currentObject).Properties.Value("Key"))
		    Else
		      Break
		    End Select
		  End If
		  
		  Return True Or RaiseEvent KeyDown(Key)
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If MagOn Then Return True
		  If CheckMode(Master_Mode_Display) Then
		    //Calculate the clicked tile, if any, and bring it to the top.
		    currentObject = hitpointToObject(x, y)
		    If currentObject > -1 Then
		      bringToFront(currentObject)
		    Else
		      ResetHilights()
		      Call RaiseEvent ItemSelected("")
		    End If
		    Invalidate(False)
		    lastX = X
		    lastY = Y
		    Call RaiseEvent MouseDown(X, Y)
		    Return True
		  Else
		    If MainWindow.DropperMode Then
		      Return RaiseEvent MouseDown(X, Y)  //Eyedropper mode so raise the event to the instance handler
		    End If
		    
		    Dim ret As Boolean
		    If X >= Buffer.Width And X <= Buffer.Width + 5 And Y >= Buffer.Height And Y <= Buffer.Height + 5 Then
		      Resizing = True
		      Return True
		      If IsContextualClick Then
		        Overlay = Nil
		        Invalidate(False)
		        CancelDraw = True
		        If CheckMode(Mode_Drag) Then
		          Mode = Mode_Dragging
		        End If
		        ret = True
		        GoTo Finish
		      End If
		      Invalidate(False)
		    End If
		    
		    Select Case Mode
		    Case Mode_Drag, Mode_Dragging
		      currentObject = hitpointToObject(x, y)
		      If currentObject > -1 Then
		        bringToFront(currentObject)
		      Else
		        ResetHilights()
		      End If
		      Invalidate(False)
		      lastX = X
		      lastY = Y
		    Case Mode_DrawLine, Mode_Draw_Circle, Mode_Draw_Rect, Mode_Draw_Freeform, Mode_Select_Rect, Mode_Draw_Filled_Rect, Mode_Draw_Filled_Circle
		      DragStartX = X
		      DragStartY = Y
		      GoTo Finish  //omg a GoTo
		    Case Mode_Draw_Point
		      AddPoint(X, Y, LineWidth, LineWidth)
		    Case Mode_Fill
		      Fill(X, Y)
		    Case Select_Mode_Wait
		      'Dim p As Picture = SelectionEnd(Select_Mode_To_Buffer)
		      'Dim no As New dragObject(p)
		      'If DragStartX > DragEndX Then
		      'no.x = DragEndX
		      'Else
		      'no.x = DragStartX
		      'End If
		      'If DragStartY > DragEndY Then
		      'no.x = DragEndY
		      'Else
		      'no.x = DragStartY
		      'End If
		      'addObject(no)
		      'Refresh(False)
		      'ret = False
		      'GoTo Finish
		    End Select
		    '
		    Finish:
		    Return ret Or Not RaiseEvent MouseDown(X, Y)
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  If MagOn Then Return
		  If Not CheckMode(Master_Mode_Display) Then
		    If CheckMode(Select_Mode_Wait) Then Return
		    If Not Resizing Then
		      Select Case Mode
		      Case Mode_Dragging
		        If currentObject > -1 Then
		          Static t As Byte
		          Dim objX As Integer = x - lastx
		          Dim objY As Integer = y - lasty
		          lastx = x
		          lasty = y
		          objects(currentObject).x = objects(currentObject).x + objX
		          objects(currentObject).y = objects(currentObject).y + objY
		          
		          If t = 5 Then  //Throttle
		            t = 0
		            Invalidate(False)
		          End If
		          t = t + 1
		        End If
		      Case Mode_DrawLine
		        PreviewLine(X, Y) //NOT USED YET
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
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  If Not CheckMode(Master_Mode_Display) Then
		    If Not MagOn Then
		      drawHelp(X, Y)
		      'Me.mousecursor = MainWindow.CurrentCursor
		      If CheckMode(Select_Mode_Wait) Then Return
		      If X >= Buffer.Width + 1 And X <= Buffer.Width + 3 And Y >= Buffer.Height + 1 And Y <= Buffer.Height + 3 Then
		        'Me.mousecursor = System.Cursors.ArrowNorthwestSoutheast
		        If Resizing Then
		          DragStartX = X
		          DragStartY = Y
		          Invalidate(False)
		        End If
		      Else
		        'Me.mousecursor = MainWindow.CurrentCursor
		      End If
		      CoordChanged(TrueX(X), TrueY(Y))
		      RaiseEvent MouseMove(System.MouseX, System.MouseY)
		    Else
		      Invalidate(False)
		    End If
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  If MagOn Then Return
		  If Not CheckMode(Master_Mode_Display) Then
		    'If Mode = Select_Mode_Wait Then Return
		    Select Case Mode
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
		    Case Mode_Select_Rect
		      DragEndX = Me.MouseX
		      DragEndY = Me.MouseY
		      mMode = Select_Mode_Wait Or MasterMode
		      
		    End Select
		    
		    If Resizing Then
		      SaveUndo(True)
		      'Me.mousecursor = MainWindow.CurrentCursor
		      Resizing = False
		      Dim tmp As Picture = NewBuffer(X, Y, 32)
		      'tmp.Transparent = Me.IsTransparent
		      tmp.Graphics.DrawPicture(Buffer, 0, 0)
		      tmp.Graphics.ForeColor = CurrentColor
		      tmp.Graphics.PenWidth = LineWidth
		      tmp.Graphics.PenHeight = LineWidth
		      Buffer = tmp
		      Refresh(True)
		      Tainted(False)
		    End If
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Me.AcceptFocus = True
		  Reset()
		  If Not CheckMode(Master_Mode_Display) Then
		    SetTitle(FileName)
		  End If
		  Me.AcceptPictureDrop
		  Me.AcceptFileDrop(FileTypes1.AllSupportedImageTypes)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  g.AntiAlias = False
		  If CheckMode(Master_Mode_Display) Then
		    Static lastWidth, lastHeight As Integer
		    If lastWidth <> g.Width Or lastHeight <> g.Height Then  //The Canvas has been resized so we must resize the buffer too.
		      buffer = NewBuffer(g.Width, g.Height, 32)
		    End If
		    Arrange()
		    update(buffer)
		    
		    If Override Then
		      buffer = NewBuffer(g.Width, g.Height, 24)
		      GenerateOverride(buffer.Graphics)
		    End If
		    
		    g.DrawPicture(buffer, 0, 0)
		    lastWidth = g.Width
		    lastHeight = g.Height
		  Else
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
		    tmp.Graphics.FillRect(Buffer.Width, Buffer.Height, 5, 5)  //Resize thumb
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
		  End If
		  
		  
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

	#tag Method, Flags = &h0
		Sub addObject(no As dragObject, Key As String = "")
		  //Adds a new dragObject and positions it somewhere within the Canvas
		  If no.x > Me.Width Or no.y > Me.Height Then
		    no.x = no.x - 200
		    no.y = no.y - 200
		  End If
		  If Key <> "" Then no.Properties.Value("Key") = Key
		  objects.Append(no)
		  'If Not Added(Key) Then
		  Call RaiseEvent Added(Key)
		  'Refresh(False)
		  'End If
		  
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
		Sub Arrange()
		  Dim x As Integer = 10
		  Dim y As Integer = 10
		  Dim widest As Integer
		  For i As Integer = 0 To UBound(Objects)
		    Objects(i).x = x
		    Objects(i).y = y
		    If Objects.Ubound = i Then Continue
		    If Objects(i).Image.height + 10 + Objects(i + 1).Image.height + 10 + y <= Me.Height Then
		      y = y + Objects(i).Image.height + 10
		      If Objects(i).Image.Width > widest Then
		        widest = Objects(i).Image.Width
		      End If
		    Else
		      If Objects(i).Image.Width > widest Then
		        widest = Objects(i).Image.Width
		      End If
		      y = 10
		      x = x + widest + 10
		      widest = 0
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub bringToFront(index As Integer)
		  //Brings the tile at Objects(Index) to the top.
		  
		  If index = -1 Then Return
		  'Dim obj As dragObject = objects(index)
		  ''objects.Remove(index)
		  ''objects.Append(obj)
		  ''currentObject = objects.Ubound
		  App.DoEvents
		  Call ItemSelected(objects(currentObject).Properties.Value("Key"))
		  ResetHilights()
		  Objects(currentObject).Hilight = True
		  Invalidate(False)
		  
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
		Private Sub drawHelp(X As Integer, Y As Integer)
		  #pragma BreakOnExceptions Off
		  CurrentObject = hitpointToObject(X, Y)
		  If CurrentObject > -1 Then
		    If HelpText = Nil Then helptext = NewBuffer(10, 10, 32)
		    Dim s As String
		    s = "Item " + Str(Objects(CurrentObject).Properties.Value("Key") + 1) + " of " + Str(UBound(Objects) + 1)
		    helptext.Graphics.TextFont = "System"
		    helptext.Graphics.TextSize = 11
		    Dim strWidth, strHeight As Integer
		    If Instr(s, EndOfLine) > 0 Then //Multi-line only
		      Dim drvs() As String = s.Split(EndOfLine)
		      Dim requiredHeight, requiredWidth As Integer
		      For z As Integer = 0 To UBound(drvs)
		        Dim drv As String = drvs(z).Trim
		        If drv = "" Then Continue
		        Dim a, b As Integer
		        a = helptext.Graphics.StringWidth(drv)
		        b = helptext.Graphics.StringHeight(drv, a)
		        If requiredWidth < a Then requiredWidth = a
		        requiredHeight = requiredHeight + b
		      Next
		      strWidth = requiredWidth
		      strHeight = requiredHeight
		      helptext = NewBuffer(strWidth + 8, strHeight + 8, 32)
		      helptext.Graphics.ForeColor = &cFFFF80
		      helptext.Graphics.FillRect(0, 0, helptext.Width, helptext.Height)
		      helptext.Graphics.ForeColor = &c000000
		      helptext.Graphics.DrawString(s, 2, 15)
		      Buffer.Graphics.DrawPicture(helptext, X + 10, Y + 10)
		    Else
		      strWidth = helptext.Graphics.StringWidth(s) + 10
		      strHeight = helptext.Graphics.StringHeight(s, strWidth + 5)
		      helptext = NewBuffer(strWidth + 4, strHeight + 4, 32)
		      helptext.Graphics.ForeColor = &cFFFF80
		      helptext.Graphics.FillRect(0, 0, helptext.Width, helptext.Height)
		      helptext.Graphics.ForeColor = &c000000
		      helptext.Graphics.DrawString(s, 2, ((helptext.Height/2) + (strHeight/4)))
		    End If
		    helptext.Graphics.ForeColor = &c363636
		    helptext.Graphics.DrawRect(0, 0, helptext.Width, helptext.Height)
		    Invalidate(False)
		  Else
		    If helptext <> Nil Then
		      helptext = Nil
		      Invalidate(False)
		    End If
		  End If
		Exception err As KeyNotFoundException
		  helptext = Nil
		  Invalidate(False)
		  
		  
		  ''#If DebugBuild Then Debug(CurrentMethodName)
		  'Dim i As Integer = hitpointToObject(X, Y)
		  'If i > -1 Then
		  'If HelpText = Nil Then helptext = NewBuffer(10, 10, 32)
		  'Dim s As String
		  ''s = "Item " + Str(Objects(i).Properties.Value("Index") + 1) + " of " + Str(UBound(Objects) + 1)
		  '
		  'For z As Integer = 0 To Objects(i).Properties.Count - 1
		  'Dim k, v As String
		  'k = Objects(i).Properties.Key(z)
		  'v = Objects(i).Properties.Value(Objects(i).Properties.Key(z)).StringValue
		  's = s + k +": " + v + EndOfLine
		  'Next
		  '
		  'helptext.Graphics.TextFont = "System"
		  'helptext.Graphics.TextSize = 11
		  'Dim strWidth, strHeight As Integer
		  'If Instr(s, EndOfLine) > 0 Then //Multi-line only
		  'Dim drvs() As String = s.Split(EndOfLine)
		  'Dim requiredHeight, requiredWidth As Integer
		  'For z As Integer = 0 To UBound(drvs)
		  'Dim drv As String = drvs(z).Trim
		  '
		  'Dim a, b As Integer
		  'a = helptext.Graphics.StringWidth(drv)
		  'b = helptext.Graphics.StringHeight(drv, a)
		  'If requiredWidth < a Then requiredWidth = a
		  'requiredHeight = requiredHeight + b
		  'Next
		  'strWidth = requiredWidth
		  'strHeight = requiredHeight
		  'helptext = NewBuffer(strWidth + 15, strHeight + 15, 32)
		  'helptext.Graphics.ForeColor = &cFFFF80
		  'helptext.Graphics.FillRect(0, 0, helptext.Width, helptext.Height)
		  'helptext.Graphics.ForeColor = &c000000
		  'helptext.Graphics.DrawString(s, 2, 15)
		  'Buffer.Graphics.DrawPicture(helptext, X + 10, Y + 10)
		  '
		  '
		  '
		  '
		  '
		  'Else
		  '
		  '
		  '
		  '
		  'strWidth = helptext.Graphics.StringWidth(s) + 10
		  'strHeight = helptext.Graphics.StringHeight(s, strWidth + 5)
		  'helptext = NewBuffer(strWidth + 4, strHeight + 4, 32)
		  'helptext.Graphics.ForeColor = &cFFFF80
		  'helptext.Graphics.FillRect(0, 0, helptext.Width, helptext.Height)
		  'helptext.Graphics.ForeColor = &c000000
		  'helptext.Graphics.DrawString(s, 2, ((helptext.Height/2) + (strHeight/4)))
		  'End If
		  'helptext.Graphics.ForeColor = &c363636
		  'helptext.Graphics.DrawRect(0, 0, helptext.Width, helptext.Height)
		  'update()
		  'Else
		  'If helptext <> Nil Then
		  'helptext = Nil
		  'update()
		  'End If
		  'End If
		  'Exception
		  'Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawLine(X As Integer, Y As Integer)
		  
		  If X <= Buffer.Width And X > 0 And Y <= Buffer.Height And Y > 0 Then
		    //NOT USED YET
		    If CancelDraw Then
		      CancelDraw = False
		      Invalidate(False)
		      Return
		    End If
		    SaveUndo()
		    Buffer.Graphics.DrawLine(DragStartX, DragStartY, TrueX(X), TrueY(Y))
		    DragStartX = X
		    DragStartY = Y
		    Taint = True
		    Invalidate(False)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub drawObject(index As Integer, Byref buff As Picture)
		  //Draw the standard (black) border around the tile
		  buff.Graphics.ForeColor = &c000000
		  buff.Graphics.DrawRect(objects(index).x - 1, objects(index).y - 1, objects(index).width + 1, objects(index).height + 1)
		  buff.Graphics.ForeColor = &c808080
		  
		  If Objects(index).Hilight Then
		    buffer.Graphics.ForeColor = &c00FFFF  //bright blue
		    buffer.Graphics.PenWidth = 2
		    buffer.Graphics.PenHeight = 2
		    buffer.Graphics.DrawRect(objects(Index).x - 1, objects(Index).y - 1, objects(Index).width + 4, objects(Index).height + 4)
		  End If
		  
		  //Draw the tile to the buff.
		  buff.Graphics.DrawPicture(objects(index).image, objects(index).x, objects(index).y)
		  
		  Dim strW, strH As Integer
		  Dim nm As String = Objects(index).Properties.Value("Key").Shorten(20)
		  strW = buff.Graphics.StringWidth(nm)
		  strH = buff.Graphics.StringHeight(nm, 9999)
		  Dim p As Picture = NewBuffer(strW, strH, 32)
		  p.Graphics.ForeColor = &cFFFF80
		  p.Graphics.FillRect(0, 0, p.Width, p.Height)
		  p.Graphics.ForeColor = &c000000
		  p.Graphics.DrawString(Objects(index).Properties.Value("Key"), 0, p.Height - 5)
		  p.Transparent = 1
		  buff.Graphics.DrawPicture(p, objects(Index).x +10, objects(Index).y + 10, p.width, p.height, 0, 0, p.Width, p.Height)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub drawObject_Old(index As Integer)
		  //Draw the standard (black) border around the tile
		  buffer.Graphics.ForeColor = &c000000
		  buffer.Graphics.DrawRect(objects(index).x - 1, objects(index).y - 1, objects(index).width + 1, objects(index).height + 1)
		  buffer.Graphics.ForeColor = &c808080
		  
		  If Objects(index).Hilight Then
		    buffer.Graphics.ForeColor = &c00FFFF  //bright blue
		    buffer.Graphics.PenWidth = 2
		    buffer.Graphics.PenHeight = 2
		    buffer.Graphics.DrawRect(objects(Index).x - 1, objects(Index).y - 1, objects(Index).width + 4, objects(Index).height + 4)
		  End If
		  
		  //Draw the tile to the buffer.
		  buffer.Graphics.DrawPicture(objects(index).image, objects(index).x, objects(index).y)
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
		Private Sub GenerateOverride(g As Graphics)
		  g.ForeColor = &ccccccc
		  g.FillRect(0, 0, g.Width, g.Height)
		  g.ForeColor = &c000000
		  g.TextFont = "System"
		  g.TextSize = 35
		  Dim nm As String = OverrideText
		  Dim strWidth, strHeight As Integer
		  strWidth = g.StringWidth(nm)
		  strHeight = g.StringHeight(nm, g.Width)
		  g.DrawString(nm, ((g.Width/2) - (strWidth/2)), ((g.Height/2) + (strHeight/4)))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function hitpointToObject(x As Integer, y As Integer) As Integer
		  //Calculate whether the passed X,Y coordinates correspond to a tile, and return the index of the tile if they do.
		  
		  For i As Integer = objects.Ubound DownTo 0
		    If (objects(i).x < x) And (x < objects(i).x + objects(i).width) And (objects(i).y < y) And (y < objects(i).y + objects(i).height) Then
		      Return i
		    End If
		  Next
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InterestingBugMode(X As Integer, Y As Integer)
		  Overlay.Graphics.DrawLine(DragStartX, DragStartY, X, Y)
		  Overlay.Graphics.PenWidth = 1
		  Overlay.Graphics.PenHeight = 1
		  Overlay.Graphics.ForeColor = &c00FF59
		  Overlay.Graphics.DrawLine(DragStartX - 1, DragStartY - 1, X + 2, Y + 2)
		  Overlay.Graphics.ForeColor = &c00FF59
		  Overlay.Graphics.DrawLine(DragStartX + 1, DragStartY + 1, X - 2, X - 2)
		  DragStartX = X
		  DragStartY = Y
		  Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LocateByKey(Key As String, KeyName As String) As Integer
		  For i As Integer = 0 To UBound(Objects)
		    If Not Objects(i).Properties.HasKey(KeyName) Then Continue
		    If objects(i).Properties.Value(KeyName) = Key Then
		      Return i
		    End If
		  Next
		  Return -1
		End Function
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
		  If FileName <> "Slideshow" Then FileName = "New Picture"
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
		Private Sub PreviewLine(X As Integer, Y As Integer)
		  //NOT USED YET
		  Overlay.Graphics.DrawLine(DragStartX, DragStartY, X, Y)
		  DragStartX = X
		  DragStartY = Y
		  Overlay.Graphics.PenWidth = 1
		  Overlay.Graphics.PenHeight = 1
		  Overlay.Graphics.ForeColor = &c00FF59
		  Overlay.Graphics.DrawLine(X - 1, Y - 1, Width + 2, Height + 2)
		  Overlay.Graphics.ForeColor = &c00FF59
		  Overlay.Graphics.DrawLine(X + 1, Y + 1, Width - 2, Height - 2)
		  Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PreviewOval(X As Integer, Y As Integer, Width As Integer, Height As Integer, Fill As Boolean = False)
		  If Not Fill Then
		    Overlay.Graphics.DrawOval(X, Y, Width, Height)
		  Else
		    Overlay.Graphics.FillOval(X, Y, Width, Height)
		  End If
		  Overlay.Graphics.PenWidth = 1
		  Overlay.Graphics.PenHeight = 1
		  Overlay.Graphics.ForeColor = &c00FF59
		  Overlay.Graphics.DrawOval(X - 1, Y - 1, Width + 2, Height + 2)
		  Overlay.Graphics.ForeColor = &c00FF59
		  If Not Fill Then Overlay.Graphics.DrawOval(X + 1, Y + 1, Width - 2, Height - 2)
		  
		  
		  
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
		  Dim s As Integer = Overlay.Graphics.PenWidth \ 2
		  Overlay.Graphics.PenWidth = 1
		  Overlay.Graphics.PenHeight = 1
		  Overlay.Graphics.ForeColor = &c00FF59
		  Overlay.Graphics.DrawRect(X - s, Y - s, Width + s * 2, Height + s * 2)
		  Overlay.Graphics.ForeColor = &c00FF59
		  If Not Fill Then Overlay.Graphics.DrawRect(X + s, Y + s, Width - s * 2, Height - s * 2)
		  Refresh(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PreviewText(X As Integer, Y As Integer, Width As Integer, Height As Integer, Fill As Boolean = False)
		  If Not Fill Then
		    Overlay.Graphics.DrawOval(X, Y, Width, Height)
		  Else
		    Overlay.Graphics.FillOval(X, Y, Width, Height)
		  End If
		  Overlay.Graphics.PenWidth = 1
		  Overlay.Graphics.PenHeight = 1
		  Overlay.Graphics.ForeColor = &c00FF59
		  Overlay.Graphics.DrawOval(X - 1, Y - 1, Width + 2, Height + 2)
		  Overlay.Graphics.ForeColor = &c00FF59
		  If Not Fill Then Overlay.Graphics.DrawOval(X + 1, Y + 1, Width - 2, Height - 2)
		  
		  
		  
		  Invalidate(False)
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
		  ReDim Objects(-1)
		  Buffer = Nil
		  FullSizeBuffer = Nil
		  Overlay = Nil
		  ReDim RedoSelections(-1)
		  Buffer = NewBuffer(500, 500, 32)
		  buffer.Graphics.TextFont = Font
		  buffer.Graphics.TextSize = FontSize
		  
		  TheMask = Nil
		  Me.Invalidate(False)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetHilights()
		  For i As Integer = 0 To UBound(Objects)
		    Objects(i).Hilight = False
		  Next
		  ClearSelection()
		  Invalidate(False)
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
		    Buffer = Images.Scale(Buffer, sc)
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
		Sub Scroll(X As Integer, Y As Integer)
		  Const scrollAmount = 10
		  
		  If Sign(X) = 1 Then
		    ViewX = (X * scrollAmount) + ViewX
		  ElseIf Sign(x) = -1 Then
		    ViewX = ViewX - (X * scrollAmount)
		  End If
		  
		  If Sign(Y) = -1 Then
		    ViewY = (Y * scrollAmount) + ViewY
		  ElseIf Sign(Y) = 1 Then
		    ViewY = ViewY - (Y * scrollAmount)
		  End If
		  
		  
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

	#tag Method, Flags = &h21
		Private Sub update(ByRef buff As Picture)
		  //Updates the buff and then refreshes the Canvas to get the updated buff painted.
		  
		  //First, draw the background color
		  buff.Graphics.ForeColor = &c808080  //Dark grey
		  buff.Graphics.FillRect(0, 0, buff.Width, buff.Height)
		  
		  For i As Integer = UBound(objects) DownTo 0
		    If Objects(i).image = Nil Then
		      Objects.Remove(i)
		      If currentObject = i Then currentObject = -1
		    End If
		  Next
		  
		  //Now draw all the tiles on top of the background.
		  For i As Integer = 0 To objects.Ubound
		    drawObject(i, buff)
		  Next
		  
		  If HelpText <> Nil Then
		    buff.Graphics.DrawPicture(HelpText, Me.MouseX + 15, Me.MouseY + 15)
		  End If
		  Arrange()
		  'Refresh(False)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Added(Key As String) As Boolean
	#tag EndHook

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
		Event DeleteItem(Key As String) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DropObject(Obj As DragItem) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ItemQuickSelected(Key As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ItemSelected(Key As String) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event KeyDown(Key As String) As Boolean
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
		#tag Note
			This property represents the currently selected tile. -1 means that no tile is selected.
			
			You can pass this property directly to the BringtToFront and DrawObject Functions.
		#tag EndNote
		currentObject As Integer = -1
	#tag EndProperty

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
		Private mFileName As String = "New Picture"
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

	#tag Property, Flags = &h0
		#tag Note
			This array contains all tiles to be shown to the user. Tiles are stored as dragObjects. The dragObject class stores all
			needed information about the tile, including its current X,Y coordinates, width, height, and the picture it represents.
		#tag EndNote
		objects() As dragObject
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

	#tag Property, Flags = &h0
		Override As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		OverrideText As String
	#tag EndProperty

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
		RedoSelections() As DragObject
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


	#tag Constant, Name = Master_Mode_Display, Type = Double, Dynamic = False, Default = \"&b00000000000000000000000000000001", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Master_Mode_Paint, Type = Double, Dynamic = False, Default = \"&b00000000000000000000000000000000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Mode_Drag, Type = Double, Dynamic = False, Default = \"&b00000000000000000000000000000010", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Mode_Dragging, Type = Double, Dynamic = False, Default = \"&b00000000000000000000000000000100", Scope = Public
	#tag EndConstant

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

	#tag Constant, Name = Select_Mode_Wait, Type = Double, Dynamic = False, Default = \"&b00000000000000001000000000000000", Scope = Public
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
			Name="currentObject"
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
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
			Name="Override"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OverrideText"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
