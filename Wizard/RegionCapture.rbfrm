#tag Window
Begin Window RegionCapture
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   4
   FullScreen      =   True
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
   Title           =   "Region Capture"
   Visible         =   True
   Width           =   600
   Begin Canvas Canvas1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
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
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Asc(key) = &h1b Then 'Cancel
		    Coords.bottom = -1
		    Coords.left = -1
		    Coords.right = -1
		    Coords.top = -1
		    Self.Close
		  End If
		  If Asc(key) = &h0D Or Asc(key) = &h03 Then 'Save
		    Self.Close
		  End If
		End Function
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor(Backdrop As Picture)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  Desktop = Backdrop
		  'Me.Width = Backdrop.Width
		  'Me.Height = Backdrop.Height
		  'Me.Top = 0
		  'Me.Left = 0
		  Overlay = New Picture(Backdrop.Width, Backdrop.Height)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShowModal() As RECT
		  Self.ShowModal
		  Return Coords
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Coords As RECT
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Desktop As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextPic As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Overlay As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private StartX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private StartY As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  If mTextPic = Nil Then
			    mTextPic = TextToPicture("Press enter to save selection" + EndOfLine + "   Press escape to cancel.", 32, &cFF000000, "System")
			  End If
			  
			  Return mTextPic
			End Get
		#tag EndGetter
		Private TextPic As Picture
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics)
		  Dim p As New Picture(g.Width, g.Height)
		  p.Graphics.DrawPicture(Desktop, 0, 0)
		  p.Graphics.DrawPicture(Overlay, 0, 0)
		  
		  p.Graphics.DrawPicture(TextPic, p.Width \ 2 - TextPic.Width \ 2, TextPic.Height)
		  g.DrawPicture(p, 0, 0)
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  StartX = X
		  StartY = Y
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  #pragma DisableBackgroundTasks
		  Dim l, t, w, h As Integer
		  
		  If X < StartX Then
		    l = X
		    w = StartX - X
		  Else
		    l = StartX
		    w = X - StartX
		  End If
		  
		  If Y < StartY Then
		    t = Y
		    h = StartY - Y
		  Else
		    t = StartY
		    h = Y - StartY
		  End If
		  
		  Overlay = New Picture(Me.Width, Me.Height)
		  Overlay.Graphics.ForeColor = &c00FF0000
		  Overlay.Graphics.PenHeight = 2
		  Overlay.Graphics.PenWidth = 2
		  Overlay.Graphics.DrawRect(l, t, w, h)
		  Coords.top = t
		  Coords.left = l
		  Coords.bottom = t + h
		  Coords.right = l + w
		  Me.Refresh(False)
		End Sub
	#tag EndEvent
#tag EndEvents
