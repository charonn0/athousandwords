#tag Window
Begin Window wEditor
   BackColor       =   16777215
   Backdrop        =   ""
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   755
   ImplicitInstance=   False
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "FreeImage Editor"
   Visible         =   True
   Width           =   1003
   Begin ImageViewer ivInput
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   500
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   20
      UseFocusRing    =   True
      Visible         =   True
      Width           =   500
   End
   Begin ImageViewer ivOutput
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   500
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   503
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   20
      UseFocusRing    =   True
      Visible         =   True
      Width           =   500
   End
   Begin Label StaticText1
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
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Input Preview:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin Label StaticText2
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
      Left            =   903
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Output Preview:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
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
      Left            =   504
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   51
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   734
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
      Left            =   418
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   52
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   734
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin LinkLabel Label1
      ActiveColor     =   16711680
      AltText         =   "Pretty awesome, actually"
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Draggable       =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      HilightColor    =   65535
      HoverPeriod     =   250
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      ResetPeriod     =   1000
      Scope           =   0
      Selectable      =   False
      TabIndex        =   53
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "This window stolen from Dingostick.com"
      TextAlign       =   0
      TextColor       =   255
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   734
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   331
   End
   Begin LinkLabel Label11
      ActiveColor     =   16711680
      AltText         =   "I had this library on my computer the whole time and didn't realize"
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Draggable       =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      HilightColor    =   65535
      HoverPeriod     =   250
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   672
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      ResetPeriod     =   1000
      Scope           =   0
      Selectable      =   False
      TabIndex        =   54
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   2
      TextColor       =   255
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   734
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   331
   End
   Begin PushButton pbScale
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Scale"
      Default         =   ""
      Enabled         =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   1711
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   55
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   -21
      Underline       =   ""
      Visible         =   False
      Width           =   52
   End
   Begin PopupMenu pmRescale
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Box\r\nBicubic\r\nBilinear\r\nBSpline\r\nCatmulRom\r\nLanczos3"
      Italic          =   ""
      Left            =   1630
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   56
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   -21
      Underline       =   ""
      Visible         =   False
      Width           =   80
   End
   Begin Label StaticText8
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   1546
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   57
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Rescale:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   -21
      Transparent     =   False
      Underline       =   ""
      Visible         =   False
      Width           =   82
   End
   Begin TextField efHeight
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
      Enabled         =   False
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   1429
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   58
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   -23
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   False
      Width           =   80
   End
   Begin TextField efWidth
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
      InitialParent   =   ""
      Italic          =   ""
      Left            =   620
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   59
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   -102
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin Label stHeight
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   1335
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   60
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Height:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   -21
      Transparent     =   False
      Underline       =   ""
      Visible         =   False
      Width           =   82
   End
   Begin Label stWidth
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
      Left            =   526
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   61
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Width:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   -100
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   82
   End
   Begin PushButton pbLoadMask
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Load Mask..."
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   829
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   62
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   535
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PopupMenu pmDither
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   448
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   63
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   630
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Label StaticText6
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
      Left            =   361
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   64
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Dither:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   631
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   82
   End
   Begin Label stThreshold
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
      Left            =   609
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   65
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Threshold:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   543
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   82
   End
   Begin Slider sThreshold
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   703
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Maximum         =   255
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   66
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   548
      Value           =   0
      Visible         =   True
      Width           =   100
   End
   Begin Label stAdjustCurve
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
      Left            =   358
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   67
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Adjust Curve:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   663
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   82
   End
   Begin PopupMenu pmCurveChannel
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   448
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   68
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   662
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton pbFlipHorizontal
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Flip Horizontal"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   2
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   69
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   590
      Underline       =   ""
      Visible         =   True
      Width           =   82
   End
   Begin PushButton pbFlipVertical
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Flip Vertical"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   94
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   70
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   590
      Underline       =   ""
      Visible         =   True
      Width           =   82
   End
   Begin PushButton pbGreyscale
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Grayscale"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   188
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   71
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   590
      Underline       =   ""
      Visible         =   True
      Width           =   82
   End
   Begin PushButton pbInvert
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Invert"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   2
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   72
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   624
      Underline       =   ""
      Visible         =   True
      Width           =   67
   End
   Begin PushButton pb4Bit
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "4-Bit"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   81
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   73
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   624
      Underline       =   ""
      Visible         =   True
      Width           =   56
   End
   Begin PushButton pb8Bit
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "8-Bit"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   149
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   74
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   624
      Underline       =   ""
      Visible         =   True
      Width           =   56
   End
   Begin PushButton pb16Bit555
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "16-Bit (555)"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   81
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   75
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   658
      Underline       =   ""
      Visible         =   True
      Width           =   82
   End
   Begin PushButton pb16Bit565
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "16-Bit (565)"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   175
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   76
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   658
      Underline       =   ""
      Visible         =   True
      Width           =   82
   End
   Begin PushButton pbQuantize
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Quantize"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   2
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   77
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   658
      Underline       =   ""
      Visible         =   True
      Width           =   67
   End
   Begin TextField efToneMap2
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
      InitialParent   =   ""
      Italic          =   ""
      Left            =   458
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   78
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   595
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin Label stToneMap2
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
      Left            =   364
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   79
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Exposure:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   597
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   82
   End
   Begin Label stToneMap1
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
      Left            =   364
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   80
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Gamma:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   571
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   82
   End
   Begin TextField efToneMap1
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
      InitialParent   =   ""
      Italic          =   ""
      Left            =   458
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   81
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   2.2
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   569
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin PushButton pbToneMap
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Map"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   503
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   82
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   543
      Underline       =   ""
      Visible         =   True
      Width           =   52
   End
   Begin PopupMenu pmToneMapping
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Drago\r\nReinhard\r\nFattal"
      Italic          =   ""
      Left            =   411
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   83
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   543
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Label StaticText7
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
      Left            =   317
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   84
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Tone Mapping:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   543
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   82
   End
   Begin Label StaticText9
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
      Left            =   2
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   85
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Swap Colors:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   544
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   74
   End
   Begin TextField efSwapColorA
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
      HelpTag         =   "Click on a section in the input preview to use GetPixel"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   94
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   86
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "&c000000"
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   544
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   59
   End
   Begin TextField efSwapColorB
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
      HelpTag         =   "Shift-click on a section in the input preview to use GetPixel"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   162
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   87
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "&cFFFFFF"
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   544
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   59
   End
   Begin PushButton pbSwap
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Swap"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   233
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   88
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   543
      Underline       =   ""
      Visible         =   True
      Width           =   37
   End
   Begin CheckBox cbAdjustTogether
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Lock"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   807
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      State           =   0
      TabIndex        =   89
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   569
      Underline       =   ""
      Value           =   False
      Visible         =   1
      Width           =   62
   End
   Begin CheckBox cbInvert
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Invert"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   807
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      State           =   0
      TabIndex        =   90
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   593
      Underline       =   ""
      Value           =   False
      Visible         =   1
      Width           =   62
   End
   Begin Label StaticText3
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
      Left            =   609
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   91
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Brightness:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   570
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   82
   End
   Begin Label StaticText4
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
      Left            =   609
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   92
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Contrast:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   594
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   82
   End
   Begin Label StaticText5
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
      Left            =   609
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   93
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Gamma:"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   619
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   82
   End
   Begin TextField efGamma
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
      HelpTag         =   "0 < gamma < 1 darkens the image; 1 leaves the image alone; and >1 lightens the image"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   693
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   94
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   618
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   80
   End
   Begin Slider sContrast
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   703
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Maximum         =   100
      Minimum         =   -100
      PageStep        =   20
      Scope           =   0
      TabIndex        =   95
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   597
      Value           =   0
      Visible         =   True
      Width           =   100
   End
   Begin Slider sBrightness
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   703
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Maximum         =   100
      Minimum         =   -100
      PageStep        =   20
      Scope           =   0
      TabIndex        =   96
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   573
      Value           =   0
      Visible         =   True
      Width           =   100
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub Constructor(FI As freeImage)
		  // Calling the overridden superclass constructor.
		  Super.Window
		  
		  
		  me.mImage = FI
		  ivInput.Image = FI
		  
		  efWidth.Text = str( fi.Width )
		  efHeight.Text = str( fi.Height )
		  
		  
		  me.mRand = new Random
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetPreview(In_FI As freeImage) As Picture
		  if In_FI = nil then return nil
		  
		  // Since Mod_FreeImage has no elegant way of getting a Picture object from a FreeImage object, we're going to do a hack job
		  dim ftmp As FolderItem = GetTemporaryFolderItem
		  if ftmp <> nil then
		    // JPEG won't write images that have been passed through dither or threshold. We could convert back to 24 or 36 bits, but
		    // it's just as easy to save to BMP instead.
		    'if In_FI.Save( ftmp, FI_Format.JPEG, FI_Flag.JPEG_QUALITYSUPERB ) then
		    if In_FI.Save( ftmp, FI_Format.BMP ) then
		      dim p As Picture = Picture.Open(ftmp)
		      ftmp.Delete
		      return p
		    end if
		    
		  end if
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mImage As freeImage
	#tag EndProperty

	#tag Property, Flags = &h0
		mRand As Random
	#tag EndProperty

	#tag Property, Flags = &h0
		RetImg As Picture
	#tag EndProperty


#tag EndWindowCode

#tag Events ivInput
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  dim c As Color = ivInput.Image.PixelRGB( x, y )
		  
		  if Keyboard.ShiftKey then
		    efSwapColorB.Text = CStr( c )
		  else
		    efSwapColorA.Text = CStr( c )
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ivOutput
	#tag Event
		Sub LeakPreview(p As Picture)
		  RetImg = p
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  If RetImg <> Nil Then
		    Self.Visible = False
		    MainWindow.PaintTarget1.Replace(RetImg)
		  End If
		  Close
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Label1
	#tag Event
		Sub Action()
		  ShowURL("http://www.dingostick.com/node.php?id=8")
		End Sub
	#tag EndEvent
	#tag Event
		Sub CreateDragItem(ByRef Obj As DragItem)
		  obj.Text = "http://www.dingostick.com/node.php?id=8"
		  obj.FolderItem = CreateURLShortCut("http://www.dingostick.com/node.php?id=8", "Dingostick FreeImage Wrapper")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Label11
	#tag Event
		Sub Open()
		  Dim fiver As String = Mod_FreeImage.Version
		  If fiver <> "" Then
		    Me.Text = "Powered by FreeImage " + fiver
		  Else
		    Me.Text = "FreeImage is not available."
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  ShowURL("http://freeimage.sourceforge.net/")
		End Sub
	#tag EndEvent
	#tag Event
		Sub CreateDragItem(ByRef Obj As DragItem)
		  obj.Text = "http://freeimage.sourceforge.net/"
		  obj.FolderItem = CreateURLShortCut("http://freeimage.sourceforge.net/", "FreeImage Project")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbScale
	#tag Event
		Sub Action()
		  dim w as integer = efWidth.Text.Val
		  dim h as integer = efHeight.Text.Val
		  
		  
		  Select Case pmRescale.Text
		  Case "Box"
		    ivOutput.Image = ivInput.Image.Rescale( w, h, FI_FilterMethod.Box )
		  Case "Bicubic"
		    ivOutput.Image = ivInput.Image.Rescale( w, h, FI_FilterMethod.Bicubic )
		  Case "Bilinear"
		    ivOutput.Image = ivInput.Image.Rescale( w, h, FI_FilterMethod.Bilinear )
		  Case "BSpline"
		    ivOutput.Image = ivInput.Image.Rescale( w, h, FI_FilterMethod.BSpline )
		  Case "CatmulRom"
		    ivOutput.Image = ivInput.Image.Rescale( w, h, FI_FilterMethod.CatmullRom )
		  Case "Lanczos3"
		    ivOutput.Image = ivInput.Image.Rescale( w, h, FI_FilterMethod.Lanczos3 )
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pmRescale
	#tag Event
		Sub Change()
		  select case me.Text
		  case "Drago"
		    stToneMap1.Text = "Gamma:"
		    stToneMap2.Text = "Exposure:"
		    efToneMap1.Text = "2.2"
		    efToneMap2.Text = "0"
		  Case "Reinhard"
		    stToneMap1.Text = "Intensity:"
		    stToneMap2.Text = "Contrast:"
		    efToneMap1.Text = "0"
		    efToneMap2.Text = "0"
		    
		  case "Fattal"
		    stToneMap1.Text = "Saturation:"
		    stToneMap2.Text = "Attenuation:"
		    efToneMap1.Text = "0.5"
		    efToneMap2.Text = "0.85"
		  End Select
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbLoadMask
	#tag Event
		Sub Action()
		  dim f As FolderItem = GetOpenFolderItem( "" )
		  if f  <> nil then
		    dim fi As FreeImage = FreeImage.Load( f )
		    if fi <> nil then
		      ivOutput.Image = ivInput.Image.SetMask( fi )
		      
		    end if
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pmDither
	#tag Event
		Sub Open()
		  me.AddRow( "Floyd_Steinberg" )
		  me.RowTag( me.ListCount-1 ) = FI_DitherAlgorithm.Floyd_Steinberg
		  me.AddRow( "Bayer4X4" )
		  me.RowTag( me.ListCount-1 ) = FI_DitherAlgorithm.Bayer4x4
		  me.AddRow( "Bayer8X8" )
		  me.RowTag( me.ListCount-1 ) = FI_DitherAlgorithm.Bayer8x8
		  me.AddRow( "Cluster6X6" )
		  me.RowTag( me.ListCount-1 ) = FI_DitherAlgorithm.Cluster6x6
		  me.AddRow( "Cluster8X8" )
		  me.RowTag( me.ListCount-1 ) = FI_DitherAlgorithm.Cluster8x8
		  me.AddRow( "Cluster16X16" )
		  me.RowTag( me.ListCount-1 ) = FI_DitherAlgorithm.Cluster16x16
		  me.AddRow( "Bayer16X16" )
		  me.RowTag( me.ListCount-1 ) = FI_DitherAlgorithm.Bayer16x16
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  if me.ListIndex <> -1 then
		    ivOutput.Image = ivInput.Image.Dither( me.RowTag( me.ListIndex ) )
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events sThreshold
	#tag Event
		Sub ValueChanged()
		  ivOutput.Image = ivInput.Image.Threshold( me.Value )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pmCurveChannel
	#tag Event
		Sub Open()
		  me.AddRow( "RGB" )
		  me.RowTag( me.ListCount-1 ) = FI_ColorChannel.RGB
		  me.AddRow( "Red" )
		  me.RowTag( me.ListCount-1 ) = FI_ColorChannel.RED
		  me.AddRow( "Green" )
		  me.RowTag( me.ListCount-1 ) = FI_ColorChannel.GREEN
		  me.AddRow( "Blue" )
		  me.RowTag( me.ListCount-1 ) = FI_ColorChannel.BLUE
		  me.AddRow( "Alpha" )
		  me.RowTag( me.ListCount-1 ) = FI_ColorChannel.ALPHA
		  me.AddRow( "Black" )
		  me.RowTag( me.ListCount-1 ) = FI_ColorChannel.BLACK
		  me.AddRow( "Real" )
		  me.RowTag( me.ListCount-1 ) = FI_ColorChannel.REAL
		  me.AddRow( "Imag" )
		  me.RowTag( me.ListCount-1 ) = FI_ColorChannel.IMAG
		  me.AddRow( "Mag" )
		  me.RowTag( me.ListCount-1 ) = FI_ColorChannel.MAG
		  me.AddRow( "Phase" )
		  me.RowTag( me.ListCount-1 ) = FI_ColorChannel.PHASE
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  if pmCurveChannel.ListIndex <> -1 then
		    dim chan As FI_ColorChannel = pmCurveChannel.RowTag( pmCurveChannel.ListIndex )
		    dim lut As new MemoryBlock( 256 )
		    
		    
		    // This is an arbitrary mapping
		    for i as integer = 0 to 255
		      if i < 128 then
		        lut.Byte( i ) = 64+log(i)
		      else
		        lut.Byte( i ) = 128+log(128-i)
		      end if
		    next
		    
		    ivOutput.Image = ivInput.Image.AdjustCurve( chan, lut )
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbFlipHorizontal
	#tag Event
		Sub Action()
		  ivOutput.Image = ivInput.Image.FlipHorizontal
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbFlipVertical
	#tag Event
		Sub Action()
		  ivOutput.Image = ivInput.Image.FlipVertical
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbGreyscale
	#tag Event
		Sub Action()
		  ivOutput.Image = ivInput.Image.Greyscale
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbInvert
	#tag Event
		Sub Action()
		  ivOutput.Image = ivInput.Image.Invert
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pb4Bit
	#tag Event
		Sub Action()
		  ivOutput.Image = ivInput.Image.ConvertTo4Bits
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pb8Bit
	#tag Event
		Sub Action()
		  ivOutput.Image = ivInput.Image.ConvertTo8Bits
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pb16Bit555
	#tag Event
		Sub Action()
		  ivOutput.Image = ivInput.Image.ConvertTo16Bits555
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pb16Bit565
	#tag Event
		Sub Action()
		  ivOutput.Image = ivInput.Image.ConvertTo16Bits565
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbQuantize
	#tag Event
		Sub Action()
		  ivOutput.Image = ivInput.Image.ColorQuantize( FI_QuantizeAlgorithm.XiaolinWu )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbToneMap
	#tag Event
		Sub Action()
		  dim param1 As Double = efToneMap1.Text.Val
		  dim param2 As Double = efToneMap2.Text.Val
		  
		  select case pmToneMapping.Text
		  case "Drago"
		    ivOutput.Image = ivInput.Image.ToneMapping_Drago( param1, param2 )
		  case "Reinhard"
		    ivOutput.Image = ivInput.Image.ToneMapping_Reinhard( param1, param2 )
		  case "Fattal"
		    ivOutput.Image = ivInput.Image.ToneMapping_Fattal( param1, param2 )
		  end select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pmToneMapping
	#tag Event
		Sub Change()
		  select case me.Text
		  case "Drago"
		    stToneMap1.Text = "Gamma:"
		    stToneMap2.Text = "Exposure:"
		    efToneMap1.Text = "2.2"
		    efToneMap2.Text = "0"
		  Case "Reinhard"
		    stToneMap1.Text = "Intensity:"
		    stToneMap2.Text = "Contrast:"
		    efToneMap1.Text = "0"
		    efToneMap2.Text = "0"
		    
		  case "Fattal"
		    stToneMap1.Text = "Saturation:"
		    stToneMap2.Text = "Attenuation:"
		    efToneMap1.Text = "0.5"
		    efToneMap2.Text = "0.85"
		  End Select
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbSwap
	#tag Event
		Sub Action()
		  dim va As Variant = efSwapColorA.Text
		  dim vb As Variant = efSwapColorB.Text
		  
		  dim ca As Color = va.ColorValue
		  dim cb As Color = vb.ColorValue
		  
		  ivOutput.Image = ivInput.Image.SwapColors( ca, cb, true )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cbAdjustTogether
	#tag Event
		Sub Action()
		  cbInvert.Enabled = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events efGamma
	#tag Event
		Sub TextChange()
		  if cbAdjustTogether.Value then
		    ivOutput.Image = ivInput.Image.AdjustColors( sBrightness.Value, sContrast.Value, efGamma.Text.Val, cbInvert.Value )
		  else
		    ivOutput.Image = ivInput.Image.AdjustGamma( me.Text.Val )
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events sContrast
	#tag Event
		Sub ValueChanged()
		  if cbAdjustTogether.Value then
		    ivOutput.Image = ivInput.Image.AdjustColors( sBrightness.Value, sContrast.Value, efGamma.Text.Val, cbInvert.Value )
		  else
		    ivOutput.Image = ivInput.Image.AdjustContrast( me.Value )
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events sBrightness
	#tag Event
		Sub ValueChanged()
		  if cbAdjustTogether.Value then
		    ivOutput.Image = ivInput.Image.AdjustColors( sBrightness.Value, sContrast.Value, efGamma.Text.Val, cbInvert.Value )
		  else
		    ivOutput.Image = ivInput.Image.AdjustBrightness( me.Value )
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
