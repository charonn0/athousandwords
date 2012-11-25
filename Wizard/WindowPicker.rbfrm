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
      Left            =   179
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
      Left            =   87
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
		    'Dim alph As New MenuItem("Increase Alpha By 10%")
		    'Dim alph1 As New MenuItem("Decrease Alpha By 10%")
		    'Dim alph2 As New MenuItem("Reset Alpha")
		    'Dim alph3 As New MenuItem("Alpha")
		    'Dim max As New MenuItem("Maximize")
		    'Dim min As New MenuItem("Minimize")
		    'Dim res As New MenuItem("Restore")
		    Dim ID As New MenuItem("Identify")
		    'alph3.Append(alph)
		    'alph3.Append(alph1)
		    'alph3.Append(alph2)
		    'base.Append(alph3)
		    'base.Append(max)
		    'base.Append(min)
		    'base.Append(res)
		    base.Append(ID)
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  If Me.ListIndex > -1 Then
		    If Me.Cell(Me.ListIndex, 0) = "Default IME" Then
		      MsgBox("That's probably not a good idea.")
		      Return False
		    End If
		  End If
		  Dim pw As ForeignWindows.ForeignWindow = Me.RowTag(Me.ListIndex)
		  Select Case hitItem.Text
		  Case "Increase Alpha By 10%"
		    If Me.ListIndex > -1 Then
		      
		      Dim i As Single = pw.alpha
		      i = i - (i * 0.10)
		      pw.alpha = i
		    End If
		  Case "Decrease Alpha By 10%"
		    If Me.ListIndex > -1 Then
		      
		      Dim i As Single = pw.alpha
		      i = i + (i * 0.10)
		      pw.alpha = i
		    End If
		  Case "Reset Alpha"
		    If Me.ListIndex > -1 Then
		      
		      pw.alpha = 1
		    End If
		  Case "Maximize"
		    If Me.ListIndex > -1 Then
		      
		      pw.Maximized
		    End If
		  Case "Minimize"
		    If Me.ListIndex > -1 Then
		      
		      pw.Minimized()
		    End If
		  Case "Restore"
		    If Me.ListIndex > -1 Then
		      
		      'pw.Visible
		    End If
		  Case "Identify"
		    If Me.ListIndex > -1 Then
		      
		      pw.Identify(3)
		    End If
		  End Select
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  If Self.Mode = Self.Mode_Window Then
		    Dim win As ForeignWindows.ForeignWindow = Me.RowTag(Me.ListIndex)
		    SelectedWindow = win.Handle
		    win.BringToFront
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
