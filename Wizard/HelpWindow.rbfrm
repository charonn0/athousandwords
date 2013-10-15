#tag Window
Begin Window HelpWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   3
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   2.76e+2
   ImplicitInstance=   True
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
   Resizeable      =   True
   Title           =   "Help"
   Visible         =   True
   Width           =   4.77e+2
   Begin TextArea LongHelp
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   146
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   ""
      Left            =   0
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   65
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   477
   End
   Begin Listbox RecentItems
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
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   64
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Recently viewed help items"
      Italic          =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
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
      Top             =   212
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   477
      _ScrollWidth    =   -1
   End
   Begin Label ShortHelp
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   53
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "No help for that item! "
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   477
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
      Left            =   -52
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
      Top             =   -58
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  Self.Hide
		  Return Not appQuitting
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ShowHelp(Title As String, ShortVersion As String, Longversion As String = "", Remember As Boolean = True)
		  Me.Title = "Help: " + Title
		  Me.ShortHelp.Text = ShortVersion
		  Me.LongHelp.Text = Longversion
		  If Longversion.Trim = "" Then
		    Me.Height = 131
		    LongHelp.Visible = False
		  Else
		    Me.Height = 276
		    LongHelp.Visible = True
		  End If
		  If Remember Then
		    Dim d As New Dictionary
		    d.Value("Title") = Title
		    d.Value("Short") = ShortVersion
		    d.Value("Long") = Longversion
		    RecentItems.AddRow(Title)
		    RecentItems.RowTag(RecentItems.LastIndex) = d
		  End If
		  Me.Show
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowStyledHelp(Title As String, ShortVersion As String, Longversion As StyledText, Remember As Boolean = True)
		  Me.Title = "Help: " + Title
		  Me.ShortHelp.Text = ShortVersion
		  If Longversion = Nil Then
		    Me.Height = 131
		    LongHelp.Visible = False
		  Else
		    Me.LongHelp.StyledText = Longversion
		    Me.Height = 276
		    LongHelp.Visible = True
		  End If
		  If Remember Then
		    Dim d As New Dictionary
		    d.Value("Title") = Title
		    d.Value("Short") = ShortVersion
		    d.Value("Long") = Longversion
		    RecentItems.AddRow(Title)
		    RecentItems.RowTag(RecentItems.LastIndex) = d
		  End If
		  Me.Show
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events RecentItems
	#tag Event
		Sub Change()
		  Dim d As Dictionary = Me.RowTag(Me.ListIndex)
		  If d <> Nil Then
		    Dim t, l, s As String
		    t = d.Value("Title")
		    s = d.Value("Short")
		    l = d.Value("Long")
		    Self.ShowHelp(t, s, l, False)
		  End If
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
