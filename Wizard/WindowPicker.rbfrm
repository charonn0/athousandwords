#tag Window
Begin Window WindowPicker
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   False
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   2.45e+2
   ImplicitInstance=   False
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   1
   Resizeable      =   False
   Title           =   "Choose a window to capture"
   Visible         =   True
   Width           =   3.46e+2
   Begin Listbox Listbox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   ""
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   ""
      HeadingIndex    =   -1
      Height          =   212
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   346
      _ScrollWidth    =   -1
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "OK"
      Default         =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   223
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   217
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   131
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   217
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton PushButton3
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Identify"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   39
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   217
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Timer Timer1
      Height          =   32
      Index           =   -2147483648
      Left            =   412
      LockedInPosition=   False
      Mode            =   0
      Period          =   3500
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   -25
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function GetScreenNumber() As Integer
		  Me.Mode = Me.Mode_Screen
		  Me.Title = "Choose a screen to capture"
		  Listbox1.DeleteAllRows()
		  For i As Integer = 0 To ScreenCount - 1
		    Listbox1.AddRow("Screen " + Str(i))
		  Next
		  Me.ShowModalWithin(WizWindow)
		  Return SelectedWindow
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetWindowHandle() As Integer
		  Me.Mode = Me.Mode_Window
		  Me.Title = "Choose a window to capture"
		  Listbox1.DeleteAllRows()
		  Dim list() As ForeignWindows.ForeignWindow = ForeignWindows.ListWindows()
		  For i As Integer = 0 To UBound(list)
		    Listbox1.AddRow(list(i).Caption)
		    Listbox1.RowTag(i) = list(i)
		  Next
		  Me.ShowModalWithin(WizWindow)
		  Return SelectedWindow
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Mode As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ScreenWindows() As WindowIdentifier
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SelectedWindow As Integer
	#tag EndProperty


	#tag Constant, Name = Mode_Screen, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Mode_Window, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events Listbox1
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  If Self.Mode = Self.Mode_Window Then
		    If Me.ListIndex = -1 Then Return False
		    base.Append New MenuItem("Identify")
		    base.Append New MenuItem("Restore")
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  If Me.ListIndex > -1 Then
		    Dim pw As ForeignWindows.ForeignWindow = Me.RowTag(Me.ListIndex)
		    Select Case hitItem.Text
		    Case "Restore"
		      pw.BringToFront
		    Case "Identify"
		      pw.Identify(3)
		    End Select
		  End If
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  If Self.Mode = Self.Mode_Window Then
		    Dim win As ForeignWindows.ForeignWindow = Me.RowTag(Me.ListIndex)
		    SelectedWindow = win.Handle
		    'win.BringToFront
		  Else
		    SelectedWindow = Me.ListIndex
		  End If
		Exception
		  SelectedWindow = -1
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  SelectedWindow = -1
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton3
	#tag Event
		Sub Action()
		  If Self.Mode = Self.Mode_Window Then
		    Dim win As New ForeignWindows.ForeignWindow(SelectedWindow)
		    win.Identify(3)
		  Else
		    Dim p As Picture = CaptureScreen()
		    Dim WinID As New WindowIdentifier(p)
		    WinID.IdentifyScreens()
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  For Each wi As WindowIdentifier In ScreenWindows
		    wi.Close
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
