#tag Window
Begin Window WindowIdentifier
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   False
   Composite       =   False
   Frame           =   2
   FullScreen      =   False
   HasBackColor    =   True
   Height          =   3.15e+2
   ImplicitInstance=   False
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   ""
   Visible         =   True
   Width           =   5.02e+2
   Begin Canvas Canvas1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   315
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
      Width           =   502
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Activate()
		  ShapeForm(Background, &cFFFFFF55)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor(ScreenNumber As Integer)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  Dim l, t As Integer
		  
		  l = Screen(ScreenNumber).Left
		  t = Screen(ScreenNumber).Top
		  Background = TextToPicture(Str(ScreenNumber), 200, &c00000000, "System")
		  Canvas1.Backdrop = Background
		  Me.Width = Background.Width
		  Me.Height = Background.Height
		  l = (Screen(ScreenNumber).Width \ 2) - (Me.Width \ 2) + l
		  t = (Screen(ScreenNumber).Height \ 2) - (Me.Height \ 2) + t
		  Me.Left = l
		  Me.Top = t
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShapeForm(pic as Picture, transparentColor as Color)
		  Dim x, x2, y as Integer
		  Dim r1, r2 as Integer
		  Dim i as Integer
		  
		  r1 = CreateRectRgn(0, 0, 0, 0)
		  for y = 0 to pic.height - 1
		    x = 0
		    while x < pic.width
		      if pic.graphics.pixel(x, y) <> transparentColor then
		        for x2 = x to pic.width - 1
		          if pic.graphics.pixel(x2, y) = transparentColor then
		            exit
		          end if
		          r2 = CreateRectRgn(x, y, x2+1, y+1)
		          i = CombineRgn(r1, r1, r2, 2)
		          i = DeleteObject(r2)
		          x = x2
		        next
		      end if
		      x = x + 1
		    wend
		  next
		  i = SetWindowRgn(Handle, r1, true)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Background As Picture
	#tag EndProperty


#tag EndWindowCode

