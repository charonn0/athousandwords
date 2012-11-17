#tag Window
Begin Window rotatewin
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   66
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
   Resizeable      =   True
   Title           =   "Rotate"
   Visible         =   True
   Width           =   172
   Begin ComboBox cbAngle
      AutoComplete    =   False
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialValue    =   "90\r\n180\r\n270"
      Italic          =   ""
      Left            =   0
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   57
   End
   Begin PushButton pbRotate
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Rotate"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   47
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   32
      Underline       =   ""
      Visible         =   True
      Width           =   78
   End
   Begin CheckBox cbRotateClassic
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Rotate Classic"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   63
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      State           =   1
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      Value           =   True
      Visible         =   True
      Width           =   109
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
      Left            =   205
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
      Top             =   -56
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  If Not FreeImageAvailable Then
		    MsgBox("This feature requires the FreeImage library.")
		    Close
		  End If
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function ShowMe(key As String) As String
		  Dim p As Picture = GetFramePicture(key)
		  TheImage = FreeImage.LoadFromMemory(p.GetData(Picture.FormatPNG, Picture.QualityHigh))
		  Me.ShowModal
		  If RetPic <> Nil Then
		    Dim sf As New StackFrame(RetPic)
		    AddStackFrame(sf)
		    Return sf.Key
		  Else
		    Return key
		  End If
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		RetPic As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		TheImage As FreeImage
	#tag EndProperty


#tag EndWindowCode

#tag Events pbRotate
	#tag Event
		Sub Action()
		  select case cbAngle.Text.Val
		  case 90
		    TheImage = TheImage.Rotate90
		  case 180
		    TheImage = TheImage.Rotate180
		  case 270
		    TheImage = TheImage.Rotate270
		  else
		    if cbRotateClassic.Value then
		      TheImage = TheImage.RotateClassic( cbAngle.Text.Val )
		    else
		      TheImage = TheImage.RotateEx( cbAngle.Text.Val )
		    end if
		  end select
		  
		  RetPic = GetFIPic(TheImage)
		  Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  RetPic = Nil
		  Close
		End Sub
	#tag EndEvent
#tag EndEvents
