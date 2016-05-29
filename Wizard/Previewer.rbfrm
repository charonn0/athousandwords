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
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   False
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
   Begin Timer Timer1
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   1041
      LockedInPosition=   False
      Mode            =   2
      Period          =   1
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   -11
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h1
		Protected Function Scale(Source As Picture, Ratio As Double = 1.0) As Picture
		  //Returns a scaled version of the passed Picture object.
		  //A ratio of 1.0 is 100% (no change,) 0.5 is 50% (half size) and so forth.
		  //This function should be cross-platform safe.
		  
		  Dim wRatio, hRatio As Double
		  wRatio = (Ratio * Source.width)
		  hRatio = (Ratio * Source.Height)
		  If wRatio = Source.Width And hRatio = Source.Height Then Return Source
		  Dim photo As New Picture(wRatio, hRatio)
		  Photo.Graphics.DrawPicture(Source, 0, 0, Photo.Width, Photo.Height, 0, 0, Source.Width, Source.Height)
		  Return photo
		  
		Exception
		  Return Source
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowModal(p As Picture)
		  TruePic = p
		  If p.Width > Me.Width Or p.Height > Me.Height Then
		    If p.Width > p.Height Then
		      mratio = Me.Width / p.Width
		    Else
		      mratio = Me.Height / p.Height
		    End If
		  End If
		  Self.Width = TruePic.Width * mRatio
		  Self.Height = TruePic.Height * mRatio
		  Me.ShowModal()
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mRatio As Double
	#tag EndProperty

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
		  If Not App.UseGDIPlus Then App.UseGDIPlus = True
		  If g.Width <= 0 Or g.Height <= 0 Then Return
		  mratio = 1.0
		  If g.Width < TruePic.Width Then mratio = g.Width / TruePic.Width
		  If g.Height < TruePic.Height Then mratio = Min(g.Height / TruePic.Height, mratio)
		  Pic = Scale(TruePic, mratio)
		  Dim p As Picture = transparencycheckerboard
		  For i As Integer = 0 To g.Width Step p.Width
		    For j As Integer = 0 To g.Height Step p.Height
		      g.DrawPicture(p, i, j)
		    Next
		  Next
		  g.DrawPicture(Pic, (g.Width - Pic.Width) / 2, (g.Height - Pic.Height) / 2)
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
#tag Events Timer1
	#tag Event
		Sub Action()
		  Self.Title = "Preview - " + Format(mratio * 100, "##0\%")
		End Sub
	#tag EndEvent
#tag EndEvents
