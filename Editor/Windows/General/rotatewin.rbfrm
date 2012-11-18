#tag Window
Begin Window rotatewin
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   25
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
   Placement       =   1
   Resizeable      =   False
   Title           =   "Rotate"
   Visible         =   True
   Width           =   1.4e+2
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
      InitialValue    =   "90°\r\n180°\r\n270°"
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
      Left            =   62
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
      Top             =   0
      Underline       =   ""
      Visible         =   True
      Width           =   78
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
	#tag Method, Flags = &h0
		Function ShowPensize(CurrentSize As Integer) As Integer
		  Me.Title = "Set Pen Size"
		  pbRotate.Caption = "Set"
		  For i As Integer = cbAngle.ListCount - 1 DownTo 0
		    cbAngle.RemoveRow(i)
		  Next
		  For i As Integer = 1 To 9
		    cbAngle.AddRow(Str(i))
		  Next
		  cbAngle.ListIndex = CurrentSize - 1
		  TheSize = CurrentSize
		  Me.ShowModal
		  Return TheSize
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShowRotate(key As String) As String
		  Me.Title = "Rotate"
		  pbRotate.Caption = "Rotate"
		  
		  For i As Integer = cbAngle.ListCount - 1 DownTo 0
		    cbAngle.RemoveRow(i)
		  Next
		  For i As Integer = 90 To 270 Step 90
		    cbAngle.AddRow(Str(i) + "°")
		  Next
		  
		  
		  Dim p As Picture = GetFramePicture(key)
		  TheImage = p
		  Me.ShowModal
		  If TheImage <> Nil Then
		    Dim sf As New StackFrame(TheImage)
		    AddStackFrame(sf)
		    Return sf.Key
		  Else
		    Return key
		  End If
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		TheImage As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		TheSize As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events cbAngle
	#tag Event
		Sub Change()
		  TheSize = Me.ListIndex
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbRotate
	#tag Event
		Sub Action()
		  select case cbAngle.Text.Val
		  case 90
		    TheImage = TheImage.Rotate(90.0)
		  case 180
		    TheImage = TheImage.Rotate(180.0)
		  case 270
		    TheImage = TheImage.Rotate(270.0)
		  end select
		  
		  Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  TheImage = Nil
		  Close
		End Sub
	#tag EndEvent
#tag EndEvents
