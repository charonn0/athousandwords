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
      Height          =   600
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
      Width           =   800
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
      Left            =   1088
      LockedInPosition=   False
      Mode            =   0
      Period          =   1000
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   552
      Width           =   32
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
		  WizWindow.Visible = True
		End Sub
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  //File Menu
		  'Self.MenuBar.Item(0).Item(0).Icon = GetFrameThumbnail("document-new.png")  //New
		  'Self.MenuBar.Item(0).Item(1).Icon = GetFrameThumbnail("folder_open_document.png")  //Open
		  'Self.MenuBar.Item(0).Item(2).Icon = GetFrameThumbnail("save-document.png")  //Save
		  'Self.MenuBar.Item(0).Item(3).Icon = GetFrameThumbnail("quitIcon.png")  //Exit
		  
		  //Edit Menu
		  Self.MenuBar.Item(1).Item(0).Icon = GetFrameThumbnail("Undo.png")  //Undo
		  Self.MenuBar.Item(1).Item(1).Icon = GetFrameThumbnail("Redo.png")  //Redo
		  Self.MenuBar.Item(1).Item(2).Icon = GetFrameThumbnail("edit-clear.png")  //Clear
		  
		  //Tools Menu
		  Self.MenuBar.Item(2).Item(0).Icon = GetFrameThumbnail("image_resize.png")  //scale
		  Self.MenuBar.Item(2).Item(1).Icon = GetFrameThumbnail("magnifying_glass.png")  //magnifyer
		  
		  
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
		  If Not MemoryManager.ExtractIcons(f) Then
		    Static lossWin As New ExpectedExceptions
		    Call lossWin.ShowMe("The icons.res file is corrupt. While this error is 'non-fatal' it will make using this program rather difficult.")
		  End If
		  f.Delete
		  
		  
		  If TheToolsWin = Nil Then
		    TheToolsWin = New ToolsWin
		  End If
		  TheToolsWin.Show
		End Sub
	#tag EndEvent


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
			
			capturetimer.Mode = Timer.ModeSingle
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function RedoMeni() As Boolean Handles RedoMeni.Action
			If PaintTarget1.ReDo() Then
			PaintTarget1.Taint = False
			Self.Title = "Your Screen Capture - " + PaintTarget1.FileName + " *"
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
			Self.Title = "Your Screen Capture - " + PaintTarget1.FileName
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


	#tag Property, Flags = &h0
		CurrentCursor As MouseCursor
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentMode As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		DropperMode As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Error As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected OldY As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		RetPic As Picture
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
		  Self.Title = "Your Screen Capture - " + NewTitle
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
		  
		  Dim p As Picture = Platform.GetPartialScreenShot(l, t, w, h)
		  PaintTarget1.Open(p)
		  Self.Top = OldY
		End Sub
	#tag EndEvent
#tag EndEvents
