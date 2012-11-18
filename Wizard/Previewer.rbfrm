#tag Window
Begin Window Previewer
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   3
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   599
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
   Resizeable      =   True
   Title           =   "Preview"
   Visible         =   True
   Width           =   988
   Begin Canvas Canvas1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   599
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
      Width           =   988
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Untitled"
      Default         =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   371
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
      Top             =   -51
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Resized()
		  If Pic.Width <> Me.Width Or Pic.Height <> Me.Height Then
		    Dim ratio As Double
		    If TruePic.Width > TruePic.Height Then
		      If TruePic.Width < Me.Width Then
		        ratio = Truepic.Width / Me.Width
		      Else
		        ratio = Me.Width / Truepic.Width
		      End If
		    Else
		      If TruePic.Height < Me.Height Then
		        ratio = Truepic.Height / Me.Height
		      Else
		        ratio = Me.Height / Truepic.Height
		      End If
		    End If
		    
		    pic = Scale(TruePic, ratio)
		    Canvas1.Invalidate(True)
		  End If
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ShowModal(p As Picture)
		  TruePic = New Picture(p.Width, p.Height, p.Depth)
		  TruePic.Graphics.DrawPicture(p, 0, 0)
		  If p.Width > Me.Width Or p.Height > Me.Height Then
		    Pic = Scale(p, 0.5)
		    Self.Width = Pic.Width
		    Self.Height = Pic.Height
		  Else
		    Pic = p
		  End If
		  Me.ShowModal()
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Pic As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		TruePic As Picture
	#tag EndProperty


#tag EndWindowCode

#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics)
		  If Pic <> Nil Then
		    g.DrawPicture(Pic, 0, 0)
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
