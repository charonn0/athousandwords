#tag Window
Begin Window ScaleWindow
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   False
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   125
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
   Title           =   "Scale Image - BROKEN!"
   Visible         =   True
   Width           =   321
   Begin Slider widthslider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   14
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   100
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   14
      Value           =   0
      Visible         =   True
      Width           =   192
   End
   Begin Slider heightslider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   14
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   100
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   43
      Value           =   0
      Visible         =   True
      Width           =   192
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   260
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Width"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   11
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   54
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   260
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Height"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   43
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   54
   End
   Begin CheckBox lockratio
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Lock Ratio"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   7
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   75
      Underline       =   ""
      Value           =   True
      Visible         =   True
      Width           =   100
   End
   Begin TextField widthtext
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   16777215
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   218
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   11
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   30
   End
   Begin TextField heighttext
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   16777215
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   218
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   41
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   30
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
      Left            =   74
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   97
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
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   166
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   97
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PopupMenu pmRescale
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Box\r\nBicubic\r\nBilinear\r\nBSpline\r\nCatmulRom\r\nLanczos3"
      Italic          =   ""
      Left            =   366
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   -53
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function ShowMe(Orig As Pair, ByRef lock As Boolean) As Pair
		  Dim x, y As Integer
		  x = Orig.Left
		  y = Orig.Right
		  
		  widthslider.Maximum = x * 2
		  widthslider.Value = x
		  widthtext.Text = Str(x)
		  
		  heightslider.Maximum = y * 2
		  heightslider.Value = y
		  heighttext.Text = Str(y)
		  
		  OldDims = Orig
		  
		  Me.ShowModal
		  lock = Locked
		  Return NewDims
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Locked As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		NewDims As Pair
	#tag EndProperty

	#tag Property, Flags = &h0
		OldDims As Pair
	#tag EndProperty


#tag EndWindowCode

#tag Events widthslider
	#tag Event
		Sub ValueChanged()
		  Dim otherval As Integer = Me.Value * 100 / Me.Maximum
		  Static stoprecursing As Boolean
		  widthtext.Text = Str(Me.Value)
		  If lockratio.Value And Not stoprecursing Then
		    stoprecursing = True
		    heightslider.Value = otherval * heightslider.Maximum / 100
		  Else
		    stoprecursing = False
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events heightslider
	#tag Event
		Sub ValueChanged()
		  Dim otherval As Integer = Me.Value * 100 / Me.Maximum
		  Static stoprecursing As Boolean
		  heighttext.Text = Str(Me.Value)
		  If lockratio.Value And Not stoprecursing Then
		    stoprecursing = True
		    widthslider.Value = otherval * widthslider.Maximum / 100
		  Else
		    stoprecursing = False
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lockratio
	#tag Event
		Sub Action()
		  Locked = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  NewDims = widthslider.Value:heightslider.Value
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  NewDims = OldDims
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pmRescale
	#tag Event
		Sub Change()
		  'select case me.Text
		  'case "Drago"
		  'stToneMap1.Text = "Gamma:"
		  'stToneMap2.Text = "Exposure:"
		  'efToneMap1.Text = "2.2"
		  'efToneMap2.Text = "0"
		  'Case "Reinhard"
		  'stToneMap1.Text = "Intensity:"
		  'stToneMap2.Text = "Contrast:"
		  'efToneMap1.Text = "0"
		  'efToneMap2.Text = "0"
		  '
		  'case "Fattal"
		  'stToneMap1.Text = "Saturation:"
		  'stToneMap2.Text = "Attenuation:"
		  'efToneMap1.Text = "0.5"
		  'efToneMap2.Text = "0.85"
		  'End Select
		  
		End Sub
	#tag EndEvent
#tag EndEvents
