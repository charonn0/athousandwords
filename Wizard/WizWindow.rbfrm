#tag Window
Begin Window WizWindow
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   161
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
   Placement       =   2
   Resizeable      =   False
   Title           =   "A Thousand Words"
   Visible         =   True
   Width           =   626
   Begin PagePanel PagePanel1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   159
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   5
      Panels          =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      Top             =   0
      Value           =   4
      Visible         =   True
      Width           =   626
      Begin Label Label1
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   109
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   ""
         Left            =   141
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   1
         Text            =   "This wizard will step you through the process of taking still image of your screen which you can give to others.\r\n\r\nTo proceed, click next."
         TextAlign       =   0
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   7
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   465
      End
      Begin Label Label2
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   109
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   ""
         Left            =   141
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   2
         Text            =   "Please take any steps needed to bring the error or offending software application into view on your screen. When you are ready for the screen to be captured, click next.\r\n\r\nFor more options, click Options."
         TextAlign       =   0
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   7
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   465
      End
      Begin PushButton P1Next
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "&Next ->"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   ""
         Left            =   524
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   131
         Underline       =   ""
         Visible         =   True
         Width           =   80
      End
      Begin PushButton P2Next
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "&Next ->"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   ""
         Left            =   524
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   131
         Underline       =   ""
         Visible         =   True
         Width           =   80
      End
      Begin Label Label3
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   112
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   ""
         Left            =   141
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   4
         TabPanelIndex   =   3
         Text            =   "A screen capture was successfully created. Click the Preview button to see the capture or click the Edit button to open it in an editor. \r\n\r\nUse the editor to block out any information you don't want to share with others or to hilight the issue(s) you want to address.\r\n\r\nWhen you're ready to share the capture, click next."
         TextAlign       =   0
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   7
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   479
      End
      Begin PushButton P2Preview
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "&Preview"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   ""
         Left            =   439
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   131
         Underline       =   ""
         Visible         =   True
         Width           =   80
      End
      Begin PushButton P2Edit
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "&Edit"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   ""
         Left            =   353
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   131
         Underline       =   ""
         Visible         =   True
         Width           =   80
      End
      Begin PushButton P0Next
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "&Next ->"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   ""
         Left            =   524
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   131
         Underline       =   ""
         Visible         =   True
         Width           =   80
      End
      Begin PushButton P3Finish
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "&Finish"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   ""
         Left            =   524
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   131
         Underline       =   ""
         Visible         =   True
         Width           =   80
      End
      Begin Label Label4
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   92
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   ""
         Left            =   141
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   4
         TabPanelIndex   =   4
         Text            =   "Finished! A copy of your screen capture has been saved to your computer. \r\n\r\nClick the Finish button to close this wizard.\r\n"
         TextAlign       =   0
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   6
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   477
      End
      Begin Canvas Canvas3
         AcceptFocus     =   ""
         AcceptTabs      =   ""
         AutoDeactivate  =   True
         Backdrop        =   925700095
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   128
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Left            =   7
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   7
         UseFocusRing    =   True
         Visible         =   True
         Width           =   128
      End
      Begin Canvas Canvas4
         AcceptFocus     =   ""
         AcceptTabs      =   ""
         AutoDeactivate  =   True
         Backdrop        =   925700095
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   128
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Left            =   7
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   7
         UseFocusRing    =   True
         Visible         =   True
         Width           =   128
      End
      Begin Canvas Canvas5
         AcceptFocus     =   ""
         AcceptTabs      =   ""
         AutoDeactivate  =   True
         Backdrop        =   925700095
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   128
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Left            =   7
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   3
         TabStop         =   True
         Top             =   7
         UseFocusRing    =   True
         Visible         =   True
         Width           =   128
      End
      Begin Canvas Canvas6
         AcceptFocus     =   ""
         AcceptTabs      =   ""
         AutoDeactivate  =   True
         Backdrop        =   925700095
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   128
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Left            =   7
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   4
         TabStop         =   True
         Top             =   7
         UseFocusRing    =   True
         Visible         =   True
         Width           =   128
      End
      Begin LinkLabel SavedToLink
         ActiveColor     =   16711680
         AltText         =   "Open file location"
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HilightColor    =   65535
         HoverPeriod     =   250
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   ""
         Left            =   204
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         ResetPeriod     =   1000
         Scope           =   0
         Selectable      =   ""
         TabIndex        =   6
         TabPanelIndex   =   4
         Text            =   "Saved to : "
         TextAlign       =   0
         TextColor       =   255
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   82
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   414
      End
      Begin PushButton P3StartOver
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "&Start Over"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   ""
         Left            =   439
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   131
         Underline       =   ""
         Visible         =   True
         Width           =   80
      End
      Begin PushButton P2StartOver
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "&Start Over"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   ""
         Left            =   268
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   131
         Underline       =   ""
         Visible         =   True
         Width           =   80
      End
      Begin PushButton P0Crash
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Crash"
         Default         =   ""
         Enabled         =   False
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   ""
         Left            =   439
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   131
         Underline       =   ""
         Visible         =   False
         Width           =   80
      End
      Begin PushButton P4StartOver
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "&Start Over"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   ""
         Left            =   439
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   5
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   131
         Underline       =   ""
         Visible         =   True
         Width           =   80
      End
      Begin PushButton P4Continue
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "&Continue"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   ""
         Left            =   524
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   5
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   131
         Underline       =   ""
         Visible         =   True
         Width           =   80
      End
      Begin PushButton P1Advanced
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "&Options"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   ""
         Left            =   439
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   131
         Underline       =   ""
         Visible         =   True
         Width           =   80
      End
      Begin Canvas Canvas7
         AcceptFocus     =   ""
         AcceptTabs      =   ""
         AutoDeactivate  =   True
         Backdrop        =   925700095
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   128
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Left            =   7
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   5
         TabStop         =   True
         Top             =   7
         UseFocusRing    =   True
         Visible         =   True
         Width           =   128
      End
      Begin Label Label5
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   ""
         Left            =   147
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   9
         TabPanelIndex   =   4
         Text            =   "Saved To:"
         TextAlign       =   2
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   82
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   52
      End
      Begin LinkLabel Label6
         ActiveColor     =   "&cFF0000"
         AltText         =   ""
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         HilightColor    =   &h00000000
         HoverPeriod     =   250
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   446
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         ResetPeriod     =   1000
         Scope           =   0
         Selectable      =   False
         TabIndex        =   10
         TabPanelIndex   =   4
         Text            =   "A Thousand Words 0.00"
         TextAlign       =   1
         TextColor       =   &h00C0C0C0
         TextFont        =   "System"
         TextSize        =   10
         TextUnit        =   0
         Top             =   111
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   159
      End
      Begin PopupMenu PicType
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         InitialValue    =   "Save As JPEG\r\nSave As PNG\r\nSave As BMP"
         Italic          =   ""
         Left            =   159
         ListIndex       =   0
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   5
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   14
         Underline       =   ""
         Visible         =   True
         Width           =   121
      End
      Begin PopupMenu SelectType
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         InitialValue    =   "Capture everything\r\nOnly capture a specific window...\r\nOnly capture a specific screen...\r\nSelect a region manually..."
         Italic          =   ""
         Left            =   304
         ListIndex       =   0
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   5
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   14
         Underline       =   ""
         Visible         =   True
         Width           =   169
      End
      Begin GroupBox GroupBox2
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Save As"
         Enabled         =   True
         Height          =   81
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   ""
         Left            =   159
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   5
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   46
         Underline       =   ""
         Visible         =   True
         Width           =   453
         Begin Label Label8
            AutoDeactivate  =   True
            Bold            =   ""
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GroupBox2"
            Italic          =   ""
            Left            =   171
            LockBottom      =   ""
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   ""
            LockTop         =   True
            Multiline       =   ""
            Scope           =   0
            Selectable      =   False
            TabIndex        =   3
            TabPanelIndex   =   5
            Text            =   "Name:"
            TextAlign       =   2
            TextColor       =   &h000000
            TextFont        =   "System"
            TextSize        =   0
            TextUnit        =   0
            Top             =   89
            Transparent     =   False
            Underline       =   ""
            Visible         =   True
            Width           =   72
         End
         Begin LinkLabel NameHelp
            ActiveColor     =   "&cFF0000"
            AltText         =   "Help with naming"
            AutoDeactivate  =   True
            Bold            =   True
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HilightColor    =   "&c00FFFF"
            HoverPeriod     =   250
            Index           =   -2147483648
            InitialParent   =   "GroupBox2"
            Italic          =   ""
            Left            =   586
            LockBottom      =   ""
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   ""
            LockTop         =   True
            Multiline       =   False
            ResetPeriod     =   1000
            Scope           =   0
            Selectable      =   ""
            TabIndex        =   4
            TabPanelIndex   =   5
            Text            =   "?"
            TextAlign       =   1
            TextColor       =   "&c0000FF"
            TextFont        =   "System"
            TextSize        =   0
            TextUnit        =   0
            Top             =   88
            Transparent     =   True
            Underline       =   ""
            Visible         =   True
            Width           =   12
         End
         Begin TextField NamePattern
            AcceptTabs      =   ""
            Alignment       =   0
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   False
            BackColor       =   &hFFFFFF
            Bold            =   ""
            Border          =   True
            CueText         =   "%u_%t"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Format          =   ""
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GroupBox2"
            Italic          =   ""
            Left            =   248
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
            TabIndex        =   1
            TabPanelIndex   =   5
            TabStop         =   True
            Text            =   ""
            TextColor       =   &h000000
            TextFont        =   "System"
            TextSize        =   0
            TextUnit        =   0
            Top             =   88
            Underline       =   ""
            UseFocusRing    =   True
            Visible         =   True
            Width           =   335
         End
         Begin LinkLabel SavePath
            ActiveColor     =   "&cFF0000"
            AltText         =   "Click to change"
            AutoDeactivate  =   True
            Bold            =   ""
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HilightColor    =   "&c00FFFF"
            HoverPeriod     =   250
            Index           =   -2147483648
            InitialParent   =   "GroupBox2"
            Italic          =   ""
            Left            =   248
            LockBottom      =   ""
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   ""
            LockTop         =   True
            Multiline       =   ""
            ResetPeriod     =   1000
            Scope           =   0
            Selectable      =   ""
            TabIndex        =   0
            TabPanelIndex   =   5
            Text            =   "Untitled"
            TextAlign       =   0
            TextColor       =   "&c0000FF"
            TextFont        =   "System"
            TextSize        =   0
            TextUnit        =   0
            Top             =   66
            Transparent     =   True
            Underline       =   ""
            Visible         =   True
            Width           =   358
         End
         Begin Label Label7
            AutoDeactivate  =   True
            Bold            =   ""
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GroupBox2"
            Italic          =   ""
            Left            =   171
            LockBottom      =   ""
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   ""
            LockTop         =   True
            Multiline       =   ""
            Scope           =   0
            Selectable      =   False
            TabIndex        =   2
            TabPanelIndex   =   5
            Text            =   "Location:"
            TextAlign       =   2
            TextColor       =   &h000000
            TextFont        =   "System"
            TextSize        =   0
            TextUnit        =   0
            Top             =   66
            Transparent     =   False
            Underline       =   ""
            Visible         =   True
            Width           =   72
         End
         Begin Timer NameExpansionTimer
            Height          =   32
            Index           =   -2147483648
            InitialParent   =   "GroupBox2"
            Left            =   531
            LockedInPosition=   False
            Mode            =   2
            Period          =   250
            Scope           =   0
            TabPanelIndex   =   5
            Top             =   77
            Width           =   32
         End
      End
      Begin LinkLabel TypeHelp
         ActiveColor     =   "&cFF0000"
         AltText         =   "Help with Save As"
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HilightColor    =   "&c00FFFF"
         HoverPeriod     =   250
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   ""
         Left            =   279
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   False
         ResetPeriod     =   1000
         Scope           =   0
         Selectable      =   ""
         TabIndex        =   7
         TabPanelIndex   =   5
         Text            =   "?"
         TextAlign       =   1
         TextColor       =   "&c0000FF"
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   14
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   12
      End
      Begin LinkLabel CaptureHelp
         ActiveColor     =   "&cFF0000"
         AltText         =   "Help with capture types"
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HilightColor    =   "&c00FFFF"
         HoverPeriod     =   250
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   ""
         Left            =   473
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   False
         ResetPeriod     =   1000
         Scope           =   0
         Selectable      =   ""
         TabIndex        =   8
         TabPanelIndex   =   5
         Text            =   "?"
         TextAlign       =   1
         TextColor       =   "&c0000FF"
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   14
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   12
      End
      Begin PopupMenu DelayPeriod
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         InitialValue    =   "No Delay\r\n5 Second Delay\r\n10 Second Delay"
         Italic          =   ""
         Left            =   497
         ListIndex       =   0
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   5
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   14
         Underline       =   ""
         Visible         =   True
         Width           =   121
      End
   End
   Begin Timer CaptureTimer
      Height          =   32
      Index           =   -2147483648
      Left            =   720
      LockedInPosition=   False
      Mode            =   0
      Period          =   250
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   -14
      Width           =   32
   End
   Begin CheckBox ScreenSelect
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "All"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   3
      InitialParent   =   ""
      Italic          =   ""
      Left            =   546
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   -113
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   59
   End
   Begin CheckBox ScreenSelect
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "All"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   4
      InitialParent   =   ""
      Italic          =   ""
      Left            =   546
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   -91
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   59
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  If MsgBox("Do you want to quit?", 36, "Please confirm") <> 6 Then Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub Close()
		  Quit()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Try
		    #pragma BreakOnExceptions Off
		    Dim r As New RegistryItem("HKEY_CURRENT_USER\Software\Boredomsoft", False)
		    #pragma BreakOnExceptions Default
		    r = r.Child("ATW")
		    mSaveToFolder = GetFolderItem(r.Value("SaveTo"), FolderItem.PathTypeAbsolute)
		  Catch
		    mSaveToFolder = Nil
		  Finally
		    SavePath.Text = SaveToFolder.AbsolutePath
		  End Try
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Capture()
		  If CaptureTimer.Period > 250 Then
		    If MsgBox("The wizard will disappear until after the delay period has elapsed.", 65, "Capture Delay") = 2 Then Return
		  End If
		  OldY = Self.Top
		  Self.Top = Self.Top * -10000
		  
		  CaptureTimer.Mode = Timer.ModeSingle
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetSaveName() As String
		  Dim s As String
		  If NamePattern.Text.Trim = "" Then
		    s = GlobalHelpers.ExpandPattern(NamePattern.CueText)
		  Else
		    s = GlobalHelpers.ExpandPattern(NamePattern.Text)
		  End If
		  Dim ext As String
		  Select Case PicType.Text
		  Case "Save As JPEG"
		    ext = ".jpg"
		  Case "Save As PNG"
		    ext = ".png"
		  Case "Save As BMP"
		    ext = ".bmp"
		  End Select
		  Return s + ext
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SavePic(p As Picture) As FolderItem
		  Dim ext As String
		  Select Case SaveType
		  Case Picture.SaveAsJPEG
		    ext = ".jpg"
		  Case Picture.SaveAsPNG
		    ext = ".png"
		  Case Picture.SaveAsWindowsBMP
		    ext = ".bmp"
		  End Select
		  Dim filename As String = GetSaveName
		  If filename.Trim <> "" Then
		    Dim f As FolderItem = SpecialFolder.Temporary.Child(filename)
		    p.Save(f, SaveType, Picture.QualityHigh)
		    App.DoEvents(500)
		    Return f
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetType(Type As Integer)
		  RevertType = Type
		  TypeTimer = New Timer
		  TypeTimer.Period = 1
		  AddHandler TypeTimer.Action, WeakAddressOf Me.SetTypeHandler
		  TypeTimer.Mode = Timer.ModeSingle
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetTypeHandler(Sender As Timer)
		  #pragma Unused Sender
		  SelectType.ListIndex = RevertType
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private CaptureReference As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CaptureRegion As RECT
	#tag EndProperty

	#tag Property, Flags = &h0
		FinalFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		FinalPic As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSaveToFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		OldY As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RevertType As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mSaveToFolder = Nil Then
			    mSaveToFolder = SpecialFolder.Desktop
			  End If
			  
			  If Not mSaveToFolder.Exists Then
			    mSaveToFolder = SpecialFolder.Desktop
			  End If
			  
			  If Not mSaveToFolder.Directory Then
			    mSaveToFolder = SpecialFolder.Desktop
			  End If
			  return mSaveToFolder
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSaveToFolder = value
			End Set
		#tag EndSetter
		SaveToFolder As FolderItem
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		SaveType As Integer = 151
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TheCaptureType As CaptureType
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TypeTimer As Timer
	#tag EndProperty


	#tag Constant, Name = CaptureHelpBig, Type = String, Dynamic = False, Default = \"You can choose to capture your entire screen\x2C only a certain window as it appears on screen\x2C or only the contents of a particular screen if you have more than one screen installed. You can also select a region with your mouse.", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CaptureHelpSmall, Type = String, Dynamic = False, Default = \"You can choose between several different capture types", Scope = Public
	#tag EndConstant

	#tag Constant, Name = PatternHelpBig, Type = String, Dynamic = False, Default = \"Currently available patterns:\r\r%d\r   This pattern inserts the current date\r\r%t \r   This pattern inserts the current time\r\r%u \r   This pattern inserts your Windows username", Scope = Public
	#tag EndConstant

	#tag Constant, Name = PatternHelpSmall, Type = String, Dynamic = False, Default = \"You can enter a name for each capture\x2C or you can use special patterns that insert special information like the date and time of the capture.", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeHelpSmall, Type = String, Dynamic = False, Default = \"There are several commonly used formats for saving image files. If you know you need a particular file type\x2C change this setting.", Scope = Public
	#tag EndConstant


	#tag Enum, Name = CaptureType, Type = Integer, Flags = &h0
		All
		  SpecificWindow
		  SpecificScreen
		Region
	#tag EndEnum


#tag EndWindowCode

#tag Events P1Next
	#tag Event
		Sub Action()
		  Capture()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events P2Next
	#tag Event
		Sub Action()
		  FinalFolder = SavePic(FinalPic)
		  FinalFolder.MoveFileTo(SaveToFolder)
		  FinalFolder = SaveToFolder.Child(FinalFolder.Name)
		  PagePanel1.Value = PagePanel1.Value + 1
		  SavedToLink.Text = FinalFolder.AbsolutePath
		  Self.Title = "A Thousand Words -  Step 3 of 3"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events P2Preview
	#tag Event
		Sub Action()
		  Previewer.ShowModal(FinalPic)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events P2Edit
	#tag Event
		Sub Action()
		  Dim editor As New PaintWindow
		  'editor.Show
		  Self.Visible = False
		  Dim newpic As Picture = editor.LoadPic(FinalPic)
		  If newpic <> Nil Then
		    FinalPic = newpic
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events P0Next
	#tag Event
		Sub Action()
		  PagePanel1.Value = PagePanel1.Value + 1
		  Self.Title = "A Thousand Words -  Step 1 of 3"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events P3Finish
	#tag Event
		Sub Action()
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SavedToLink
	#tag Event
		Sub Action()
		  FinalFolder.ShowInExplorer
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events P3StartOver
	#tag Event
		Sub Action()
		  PagePanel1.Value = 0
		  Self.Title = "A Thousand Words"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events P2StartOver
	#tag Event
		Sub Action()
		  PagePanel1.Value = 0
		  Self.Title = "A Thousand Words"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events P0Crash
	#tag Event
		Sub Action()
		  #pragma BreakOnExceptions Off
		  Raise New RuntimeException
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  #If DebugBuild Then
		    Me.Enabled = True
		    Me.Visible = True
		  #endif
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events P4StartOver
	#tag Event
		Sub Action()
		  Select Case MsgBox("Would you like to reset all options to their defaults?", 3 + 32, "Advanced Options")
		  Case 2 ' Cancel
		    Return
		  Case 6 ' Yes
		    SaveToFolder = Nil
		    PicType.ListIndex = 0
		    DelayPeriod.ListIndex = 0
		    TheCaptureType = CaptureType.All
		    SavePath.Text = SaveToFolder.AbsolutePath
		  Case 7 ' No
		    
		  End Select
		  PagePanel1.Value = 0
		  Self.Title = "A Thousand Words"
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events P4Continue
	#tag Event
		Sub Action()
		  'If SavePath.HasText Then
		  'SaveToFolder = GetFolderItem(SavePath.Text)
		  'ElseIf SaveToFolder <> Nil And Not SaveToFolder.Exists Then
		  'SaveToFolder = Nil
		  'End If
		  PagePanel1.Value = 1
		  Self.Title = "A Thousand Words -  Step 1 of 3"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events P1Advanced
	#tag Event
		Sub Action()
		  PagePanel1.Value = 4
		  Self.Title = "A Thousand Words - Advanced Options"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Label6
	#tag Event
		Sub Open()
		  Me.Text = Replace(Me.Text, "0.00", GlobalHelpers.Version)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  AboutWin.ShowModal
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PicType
	#tag Event
		Sub Change()
		  Select Case Me.Text
		  Case "Save As JPEG"
		    SaveType = Picture.SaveAsJPEG
		  Case "Save As PNG"
		    SaveType = Picture.SaveAsPNG
		  Case "Save As BMP"
		    SaveType = Picture.SaveAsWindowsBMP
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SelectType
	#tag Event
		Sub Change()
		  Select Case Me.Text
		  Case "Capture everything"
		    TheCaptureType = CaptureType.All
		  Case "Only capture a specific window..."
		    TheCaptureType = CaptureType.SpecificWindow
		    Dim picker As New WindowPicker
		    CaptureReference = Picker.GetWindowHandle()
		    If CaptureReference <= 0 Then
		      SetType(0)
		    End If
		    
		  Case "Only capture a specific screen..."
		    TheCaptureType = CaptureType.SpecificScreen
		    Dim picker As New WindowPicker
		    CaptureReference = Picker.GetScreenNumber()
		    If CaptureReference < 0 Then
		      SetType(0)
		    End If
		    
		  Case "Select a region manually..."
		    OldY = Self.Top
		    Self.Top = Self.Top * -10000
		    Dim p As Picture = CaptureScreen()
		    Dim capwin As New RegionCapture(p)
		    CaptureRegion = capwin.ShowModal(CaptureRegion)
		    If CaptureRegion.bottom = -1 And CaptureRegion.left = -1 And CaptureRegion.right = -1 And CaptureRegion.top = -1 Then
		      SetType(0)
		    Else
		      TheCaptureType = CaptureType.Region
		    End If
		    
		    Self.Top = OldY
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NameHelp
	#tag Event
		Sub Action()
		  HelpWindow.ShowHelp("Names and name patterns", PatternHelpSmall, PatternHelpBig)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SavePath
	#tag Event
		Sub Action()
		  'SaveToFolder.OpenInExplorer
		  Dim f As FolderItem = SelectFolder()
		  If f <> Nil Then
		    SaveToFolder = f
		    SavePath.Text = f.AbsolutePath
		    If MsgBox("Save this folder as the default save folder?", 4+32, "Change default folder") = 6 Then
		      Dim r As New RegistryItem("HKEY_CURRENT_USER\Software\Boredomsoft\ATW", True)
		      r.Value("SaveTo") = f.AbsolutePath
		    End If
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NameExpansionTimer
	#tag Event
		Sub Action()
		  Try
		    Dim s As String
		    If NamePattern.Text.Trim = "" Then
		      s = GlobalHelpers.ExpandPattern(NamePattern.CueText)
		    Else
		      s = GlobalHelpers.ExpandPattern(NamePattern.Text)
		    End If
		    Dim ext As String
		    Select Case PicType.Text
		    Case "Save As JPEG"
		      ext = ".jpg"
		    Case "Save As PNG"
		      ext = ".png"
		    Case "Save As BMP"
		      ext = ".bmp"
		    End Select
		    
		    SavePath.Text = SaveToFolder.AbsolutePath + s + ext
		  Catch
		    SavePath.Text = SaveToFolder.AbsolutePath
		  End Try
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TypeHelp
	#tag Event
		Sub Action()
		  HelpWindow.ShowHelp("File types", TypeHelpSmall)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CaptureHelp
	#tag Event
		Sub Action()
		  HelpWindow.ShowHelp("Capture types", CaptureHelpSmall, CaptureHelpBig)
		  'Dim s As New StyledText
		  's.RTFData = capuretypeshelp
		  'HelpWindow.ShowStyledHelp("Capture types", CaptureHelpSmall, s)
		  ''CaptureHelpBig)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DelayPeriod
	#tag Event
		Sub Change()
		  Select Case Me.Text
		  Case "No Delay"
		    CaptureTimer.Period = 250
		  Case "5 Second Delay"
		    CaptureTimer.Period = 5250
		  Case "10 Second Delay"
		    CaptureTimer.Period = 10250
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CaptureTimer
	#tag Event
		Sub Action()
		  Select Case TheCaptureType
		  Case CaptureType.All
		    FinalPic = CaptureScreen
		    
		  Case CaptureType.SpecificScreen
		    FinalPic = WinLib.GUI.CaptureRect(Screen(CaptureReference).Left, Screen(CaptureReference).Top, Screen(CaptureReference).Width, Screen(CaptureReference).Height)
		    
		  Case CaptureType.Region
		    FinalPic = WinLib.GUI.CaptureRect(CaptureRegion.left, CaptureRegion.Top, CaptureRegion.right - CaptureRegion.left, CaptureRegion.bottom - CaptureRegion.top)
		    
		  Else
		    Dim win As New WindowRef(CaptureReference)
		    FinalPic = win.Capture()
		  End Select
		  
		  Self.Top = OldY
		  PagePanel1.Value = PagePanel1.Value + 1
		  Self.Title = "A Thousand Words -  Step 2 of 3"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ScreenSelect
	#tag Event
		Sub Open(index as Integer)
		  Me.Caption = "Screen " + Str(index + 1)
		  Me.Value = index <= ScreenCount - 1
		  Me.Enabled = index <= ScreenCount - 1
		  
		End Sub
	#tag EndEvent
#tag EndEvents
