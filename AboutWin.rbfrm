#tag Window
Begin Window AboutWin
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   3
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   1.27e+2
   ImplicitInstance=   True
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
   Placement       =   1
   Resizeable      =   False
   Title           =   "About A Thousand Words"
   Visible         =   True
   Width           =   3.62e+2
   Begin Canvas Canvas1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   125
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   128
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   40
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   132
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      Text            =   "A Thousand Words"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   22
      TextUnit        =   0
      Top             =   0
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   222
   End
   Begin Label VersionText
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
      Left            =   132
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
      Text            =   "Version 0.00"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   35
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   222
   End
   Begin Label CopyRight
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
      Left            =   132
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
      Text            =   "Copyright (c) 2012-13 Andrew Lambert"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   52
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   228
   End
   Begin LinkLabel BSLink
      ActiveColor     =   "&cFF0000"
      AltText         =   "Visit Boredom Software"
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HilightColor    =   "&c00FFFF"
      HoverPeriod     =   250
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   132
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      ResetPeriod     =   1000
      Scope           =   0
      Selectable      =   ""
      TabIndex        =   4
      TabPanelIndex   =   0
      Text            =   "Boredom Software"
      TextAlign       =   0
      TextColor       =   "&c0000FF"
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   71
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   136
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "That's All"
      Default         =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   280
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   103
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics)
		  g.DrawPicture(Paint, 0, 0, g.Width, g.Height, 0, 0, Paint.Width, Paint.Height)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VersionText
	#tag Event
		Sub Open()
		  Me.Text = Replace(Me.Text, "0.00", GlobalHelpers.Version)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BSLink
	#tag Event
		Sub Open()
		  Me.Text = "Boredom Software"
		  '"Copyright " + Chr(169) +
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  ShowURL("http://www.boredomsoft.org/a-thousand-words.bs")
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
