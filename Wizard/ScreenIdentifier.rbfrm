#tag Window
Begin Window ScreenIdentifier
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   4
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   400
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
   Title           =   "Window Identifier"
   Visible         =   True
   Width           =   600
   Begin Canvas Canvas1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   False
      Height          =   400
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   600
   End
   Begin Timer Timer1
      Height          =   32
      Index           =   -2147483648
      Left            =   652
      LockedInPosition=   False
      Mode            =   1
      Period          =   3500
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   0
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h1000
		Sub Constructor(Backdrop As Picture)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  For i As Integer = 0 To ScreenCount - 1
		    Dim txtpic As Picture = TextToPicture("Screen " + Str(i), 200, &cFF000000, "System")
		    Dim l, t As Integer
		    l = Screen(i).Left
		    t = Screen(i).Top
		    l = (Screen(i).AvailableWidth \ 2) - (txtpic.Width \ 2) + l
		    t = (Screen(i).AvailableHeight \ 2) - (txtpic.Height \ 2) + t
		    Backdrop.Graphics.DrawPicture(txtpic, l, t)
		  Next
		  Canvas1.Backdrop = Backdrop
		  Self.Width = Backdrop.Width
		  Self.Height = Backdrop.Height
		  Self.Top = 0
		  Self.Left = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IdentifyScreens()
		  Self.ShowModal
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Timer1
	#tag Event
		Sub Action()
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
