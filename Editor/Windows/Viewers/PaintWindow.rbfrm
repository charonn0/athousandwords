#tag Window
Begin Window PaintWindow
   BackColor       =   65369
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   600
   ImplicitInstance=   False
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1871163391
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   800
   Placement       =   2
   Resizeable      =   True
   Title           =   "1,000 Words"
   Visible         =   True
   Width           =   800
   Begin CompositeContainer PaintTarget1
      AcceptFocus     =   True
      AcceptTabs      =   True
      AutoDeactivate  =   True
      Backdrop        =   ""
      CancelDraw      =   ""
      currentObject   =   -1
      DoubleBuffer    =   False
      DragEndX        =   -1
      DragEndY        =   -1
      DragStartX      =   -1
      DragStartY      =   -1
      Enabled         =   True
      EraseBackground =   True
      Font            =   "System"
      FontSize        =   11
      Height          =   584
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      lastX           =   0
      lastY           =   0
      Left            =   0
      LineWidth       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MagLevel        =   2
      MagSize         =   0
      Mode            =   0
      MustScroll      =   ""
      Override        =   ""
      ReDoable        =   ""
      Resizing        =   ""
      Scope           =   0
      Scrolling       =   ""
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Taint           =   ""
      Top             =   0
      UnDoable        =   ""
      UseFocusRing    =   True
      ViewX           =   0
      ViewY           =   0
      Visible         =   True
      Width           =   784
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Untitled"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   156
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   -54
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Timer capturetimer
      Height          =   32
      Index           =   -2147483648
      Left            =   862
      LockedInPosition=   False
      Mode            =   0
      Period          =   1000
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   49
      Width           =   32
   End
   Begin Timer toolbartimer
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   862
      LockedInPosition=   False
      Mode            =   1
      Period          =   500
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   14
      Width           =   32
   End
   Begin Timer UndoredomenuTimer
      Height          =   32
      Index           =   -2147483648
      Left            =   862
      LockedInPosition=   False
      Mode            =   2
      Period          =   200
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   -20
      Width           =   32
   End
   Begin ScrollBar UpDown
      AcceptFocus     =   true
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   584
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   784
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Maximum         =   100
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Value           =   0
      Visible         =   True
      Width           =   16
   End
   Begin ScrollBar LeftRight
      AcceptFocus     =   true
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Maximum         =   100
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   584
      Value           =   0
      Visible         =   True
      Width           =   800
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  #pragma Unused appQuitting
		  If Tainted Then
		    Select Case MsgBox("Would you like to save your changes?", 51 + 256, "Save Changes?")
		    Case 6  //Yes
		      RetPic = PaintTarget1.buffer
		      Me.Error = True
		      Return False
		    Case 7  //No
		      Me.Error = True
		      RetPic = Nil
		      Return False
		    Case 2  //Cancel
		      Return True
		    End Select
		    
		  Else
		    Error = True
		  End If
		  Return False
		End Function
	#tag EndEvent

	#tag Event
		Sub Close()
		  Call MemoryManager.CleanUp
		  TheToolsWin.Close
		  WizWindow.Visible = True
		End Sub
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  //File Menu
		  Self.MenuBar.Item(0).Item(0).Icon = GetFrameThumbnail("save-document.png")  //Save
		  Self.MenuBar.Item(0).Item(1).Icon = GetFrameThumbnail("quitIcon.png")  //Exit
		  
		  //Edit Menu
		  Self.MenuBar.Item(1).Item(0).Icon = GetFrameThumbnail("Undo.png")  //Undo
		  Self.MenuBar.Item(1).Item(1).Icon = GetFrameThumbnail("Redo.png")  //Redo
		  Self.MenuBar.Item(1).Item(2).Icon = GetFrameThumbnail("edit-clear.png")  //Clear
		  Self.MenuBar.Item(1).Item(3).Icon = GetFrameThumbnail("rotate.png")  //Rotate
		  
		  //Tools Menu
		  Self.MenuBar.Item(2).Item(0).Icon = GetFrameThumbnail("image_resize.png")  //scale
		  Self.MenuBar.Item(2).Item(1).Icon = GetFrameThumbnail("magnifying_glass.png")  //magnifyer
		  Self.MenuBar.Item(2).Item(2).Icon = GetFrameThumbnail("camera.png")  //Capture
		  Self.MenuBar.Item(2).Item(3).Icon = GetFrameThumbnail("palette.png")  //Change Color
		  Self.MenuBar.Item(2).Item(4).Icon = GetFrameThumbnail("changesize.png")  //Change pen size
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  MainWindow = Me
		  PaintTarget1.Mode = CompositeContainer.Mode_Draw_Freeform Or CompositeContainer.Master_Mode_Paint
		  Dim f As FolderItem = SpecialFolder.Temporary.Child("bs.icons.cache")
		  Dim tos As TextOutputStream
		  tos = tos.Create(f)
		  tos.Write(icons1)
		  tos.Close
		  Call MemoryManager.ExtractIcons(f) 'Then
		  'Static lossWin As New ExpectedExceptions
		  'Call lossWin.ShowMe("The icons.res file is corrupt. While this error is 'non-fatal' it will make using this program rather difficult.")
		  'End If
		  f.Delete
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function ChangeColor() As Boolean Handles ChangeColor.Action
			Dim c As Color
			If SelectColor(c, "New Drawing Color") Then
			PaintTarget1.CurrentColor = c
			End If
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ChangePen() As Boolean Handles ChangePen.Action
			Dim rot As New rotatewin
			PaintTarget1.LineWidth = rot.ShowPensize(PaintTarget1.LineWidth)
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function clearTool() As Boolean Handles clearTool.Action
			PaintTarget1.Clear
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function discard() As Boolean Handles discard.Action
			RetPic = Nil
			Self.Close
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function MagMenu() As Boolean Handles MagMenu.Action
			MagOn = True
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function MakeTrans() As Boolean Handles MakeTrans.Action
			'Self.Visible = False
			OldY = Self.Top
			Self.Top = Self.Top * -10000
			TheToolsWin.Top = TheToolsWin.Top * -10000
			
			capturetimer.Mode = Timer.ModeSingle
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function RedoMenu() As Boolean Handles RedoMenu.Action
			If PaintTarget1.ReDo() Then
			PaintTarget1.Taint = False
			If PaintTarget1.FileName .Trim <> "" Then
			Self.Title = "Your Screen Capture - " + PaintTarget1.FileName + " *"
			Else
			Self.Title = "Your Screen Capture"
			End If
			TheToolsWin.LineSize.ListIndex = PaintTarget1.LineWidth
			End If
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function RotateMenu() As Boolean Handles RotateMenu.Action
			PaintTarget1.Rotate()
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function savereturn() As Boolean Handles savereturn.Action
			WizWindow.FinalPic = PaintTarget1.buffer
			Tainted = False
			Self.Close
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ScaleMenu() As Boolean Handles ScaleMenu.Action
			PaintTarget1.Scale
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function UndoItem() As Boolean Handles UndoItem.Action
			If Not PaintTarget1.UnDo() Then
			PaintTarget1.Taint = False
			If PaintTarget1.FileName .Trim <> "" Then
			Self.Title = "Your Screen Capture - " + PaintTarget1.FileName + " *"
			Else
			Self.Title = "Your Screen Capture"
			End If
			
			End If
			TheToolsWin.LineSize.ListIndex = PaintTarget1.LineWidth
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Sub DrawTransparentBG()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadPic(p As Picture) As Picture
		  Dim pp As New Picture(p.Width, p.Height, p.Depth)
		  pp.Graphics.DrawPicture(p, 0, 0)
		  PaintTarget1.Open(pp)
		  Me.ShowModal
		  Return RetPic
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private CurrentCursor As MouseCursor
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentMode As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mDrawingMouse = Nil Then mDrawingMouse = New MouseCursor(GetFrameThumbnail("crosshairs.png"), 7, 7)
			  return mDrawingMouse
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDrawingMouse = value
			End Set
		#tag EndSetter
		DrawingMouse As MouseCursor
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		DropperMode As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mDropperMouse = Nil Then mDropperMouse = New MouseCursor(GetFrameThumbnail("Eyedropper-icon.png"), 1, 13)
			  return mDropperMouse
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDropperMouse = value
			End Set
		#tag EndSetter
		DropperMouse As MouseCursor
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Error As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mFloodMouse = Nil Then mFloodMouse = New MouseCursor(GetFrameThumbnail("floodfill.png"), 1, 13)
			  return mFloodMouse
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mFloodMouse = value
			End Set
		#tag EndSetter
		FloodMouse As MouseCursor
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCurrentColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDrawingMouse As MouseCursor
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDropperMouse As MouseCursor
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFloodMouse As MouseCursor
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected OldY As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		RetPic As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ScrollableX As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ScrollableY As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Slides() As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		Tainted As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		TheToolsWin As ToolsWin
	#tag EndProperty


#tag EndWindowCode

#tag Events PaintTarget1
	#tag Event
		Sub Tainted(NewFile As Boolean)
		  If NewFile Then
		    Self.Title = "Your Screen Capture"
		    Tainted = False
		  Else
		    Self.Title = "Your Screen Capture (modified)"
		    Tainted = True
		  End If
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub SetTitle(NewTitle As String)
		  If NewTitle.Trim <> "" Then NewTitle = " - " + NewTitle
		  Self.Title = "Your Screen Capture" + NewTitle.Trim
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  If DropperMode Then
		    DropperMode = False
		    Self.MouseCursor = CurrentCursor
		    PaintTarget1.CurrentColor = System.Pixel(System.MouseX, System.MouseY)
		    TheToolsWin.ModeButton(7).value = False
		  End If
		  
		End Function
	#tag EndEvent
	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  If ScrollableY Then UpDown.Value = UpDown.Value + deltaY
		  If ScrollableX Then LeftRight.Value = LeftRight.Value + deltaX
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  #pragma Unused X
		  #pragma Unused Y
		  If DropperMode Then
		    Self.CurrentCursor = DropperMouse
		  Else
		    Select Case PaintTarget1.Mode
		    Case PaintTarget1.Mode_DrawLine, PaintTarget1.Mode_Draw_Circle, PaintTarget1.Mode_Draw_Rect, PaintTarget1.Mode_Draw_Freeform, _
		      PaintTarget1.Mode_Select_Rect, PaintTarget1.Mode_Draw_Filled_Rect, PaintTarget1.Mode_Draw_Filled_Circle
		      Self.CurrentCursor = DrawingMouse
		    Case PaintTarget1.Mode_Draw_Point
		      Self.CurrentCursor = System.Cursors.StandardPointer
		    Case PaintTarget1.Mode_Fill
		      Self.CurrentCursor = FloodMouse
		    Else
		      Self.CurrentCursor = System.Cursors.StandardPointer
		    End Select
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  If MagOn Then MagOn = False
		  PaintTarget1.Refresh(False)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events capturetimer
	#tag Event
		Sub Action()
		  Dim l, t, w, h As Integer
		  l = PaintTarget1.Left + Self.Left
		  t = OldY
		  w = PaintTarget1.Width
		  h = PaintTarget1.Height
		  
		  Dim p As Picture = Win32.GetPartialScreenShot(l, t, w, h)
		  PaintTarget1.Open(p)
		  PaintTarget1.Taint = True
		  Self.Top = OldY
		  TheToolsWin.Top = Self.Top + 190
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events toolbartimer
	#tag Event
		Sub Action()
		  If TheToolsWin = Nil Then
		    TheToolsWin = New ToolsWin
		  End If
		  TheToolsWin.ShowWithin(Self)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UndoredomenuTimer
	#tag Event
		Sub Action()
		  Self.MenuBar.Item(1).Item(0).Enabled = UBound(PaintTarget1.Undos) > -1
		  Self.MenuBar.Item(1).Item(1).Enabled = UBound(PaintTarget1.Redos) > -1
		  If PaintTarget1.Buffer.Width > PaintTarget1.Width Then
		    'LeftRight.Top = Self.Height - LeftRight.Height
		    'PaintTarget1.Height = LeftRight.Top - 1
		    LeftRight.Maximum = 110
		    ScrollableX = True
		  Else
		    'LeftRight.Top = Self.Height + (LeftRight.Height * 2)
		    'PaintTarget1.Height = Self.Height
		    ScrollableX = False
		  End If
		  
		  LeftRight.Enabled = ScrollableX
		  UpDown.Enabled = ScrollableY
		  
		  If PaintTarget1.buffer.Height > PaintTarget1.Height Then
		    'UpDown.Left = Self.Width - UpDown.Width
		    'PaintTarget1.Width = Self.Width - UpDown.Width - 1
		    UpDown.Maximum = 110
		    ScrollableY = True
		  Else
		    'UpDown.Left = Self.Width + (UpDown.Height * 2)
		    'PaintTarget1.Width = Self.Width
		    ScrollableY = False
		  End If
		  If CurrentCursor = Nil Then CurrentCursor = System.Cursors.StandardPointer
		  PaintTarget1.MouseCursor = CurrentCursor
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UpDown
	#tag Event
		Sub ValueChanged()
		  PaintTarget1.ScrollY(Me.Value \ 2)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LeftRight
	#tag Event
		Sub ValueChanged()
		  PaintTarget1.ScrollX(Me.Value \ 2)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
