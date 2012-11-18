#tag Class
Protected Class ColorPicker
Inherits Canvas
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  Dim col As New MenuItem("System Color Picker")
		  Dim palet As New MenuItem("Set Palette to Picture")
		  base.Append(col)
		  base.Append(palet)
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Select Case hitItem.Text
		  Case "System Color Picker"
		    Dim c As Color = Me.SelectedColor
		    Call SelectColor(c, "Choose a Color")
		    RaiseEvent ColorSelected(c)
		  Case "System Color Picker"
		    SwitchPalette()
		  End Select
		  Return True
		  
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  
		  ColorSelected(System.Pixel(System.MouseX, System.MouseY))
		  Return Not RaiseEvent MouseDown(X, Y)
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  MouseIn = True
		  RaiseEvent MouseEnter
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  MouseIn = False
		  RaiseEvent MouseExit
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Buffer = New Picture(10, 10, 32)
		  'Buffer.Transparent = 1
		  'Dim rand As New Random
		  'For i As Integer = 0 To 255
		  'Me.Colors.Append(RGB(Rand.InRange(0,255), Rand.InRange(0,255), Rand.InRange(0,255)))
		  'Next
		  
		  'Buffer.Graphics.ForeColor = &c000000
		  'Buffer.Graphics.FillRect(0, 0, Buffer.Width, Buffer.Height)
		  'Buffer.Graphics.ForeColor = &c008000
		  'Dim colorwidth As Double = Ceil(Buffer.Width / 255)
		  'For i As Integer = 0 To Buffer.Height Step colorwidth
		  'Buffer.Graphics.DrawLine(0, i * colorwidth, 0, Buffer.Width)
		  'Next
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  Dim tmp As New Picture(g.Width, g.Height, 24)
		  Dim p As Picture = GetFramePicture(BackingImage)
		  tmp.Graphics.DrawPicture(p, 0, 0, g.width, g.Height, 0, 0, p.Width, p.Height)
		  tmp.Graphics.DrawPicture(Buffer, 0, 0)
		  g.DrawPicture(tmp, 0, 0)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub PaletteChangeFinishHandler(Key As String)
		  Loading.Close
		  BackingImage = Key
		  RaiseEvent PaletteChanged(Key)
		  Refresh(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Pixel(X As Integer, Y As Integer) As Color
		  Return Buffer.Graphics.Pixel(X, Y)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPalette(NewPalette As Picture)
		  Dim sf As New StackFrame(NewPalette)
		  'AddStackFrame(sf)
		  BackingImage = sf.Key
		  Refresh(False)
		  RaiseEvent PaletteChanged(sf.key)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SwitchPalette()
		  Dim f As FolderItem = GetOpenFolderItem(FileTypes1.AllSupportedImageTypes)
		  If f <> Nil Then
		    Dim cp As Palette
		    Loading.ShowMe("Creating Palette...", "This may take some time")
		    cp = New Palette(Picture.Open(f), AddressOf PaletteChangeFinishHandler)
		  End If
		  
		  
		Exception
		  Loading.Close
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ColorSelected(NewColor As Color)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDown(X As Integer, Y As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseEnter()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseExit()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PaletteChanged(Key As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SampleChanged(NewSample As Color)
	#tag EndHook


	#tag Note, Name = OldPaint
		
		  'If Buffer.Width <> g.Height Or Buffer.Width <> g.Width Then
		  'Buffer = New Picture(g.Width, g.Height, 32)
		  'End If
		  '
		  'Dim i As Integer
		  'For x as Integer = 0 to Me.Width \ 10
		  'For y as Integer = 0  to Me.Height \ 10
		  'If i > UBound(Colors) Then
		  'Buffer.Graphics.ForeColor = &cFFFFFF
		  'Else
		  'Buffer.Graphics.ForeColor = Colors(i)
		  'End If
		  'Buffer.Graphics.FillRect(x*10, y*10, 10, 10)
		  'i = i + 1
		  'next
		  'Next
		  'g.DrawPicture(Buffer, 0, 0)
		  
		  'Buffer.Graphics.ForeColor = &c000000
		  'Buffer.Graphics.FillRect(0, 0, Buffer.Width, Buffer.Height)
		  'Buffer.Graphics.ForeColor = &c008000
		  'Dim colorwidth As Double = Ceil(Buffer.Width / 255)
		  'For i As Integer = 0 To Buffer.Height Step colorwidth
		  'Buffer.Graphics.DrawLine(0, i * colorwidth, 0, Buffer.Width)
		  'Next
		  '#pragma BreakOnExceptions Off
		  ''g.Transparency = 1
		  ''Dim cc As Integer
		  ''If mPixelPic = Nil Then
		  'Dim gradientEnd As Color = &cFF0000
		  'Dim barColor As Color = &c000FFF
		  'mPixelPic = New Picture(g.Width, g.Height)
		  'Dim ratio, endratio as Double
		  'For i As Integer = 0 To mPixelPic.Width
		  'ratio = ((mPixelPic.Height - i) / mPixelPic.Height)
		  'endratio = (i / mPixelPic.Width)
		  'mPixelPic.Graphics.ForeColor = RGB(gradientEnd.Red * endratio + barColor.Red * ratio, gradientEnd.Green * endratio + barColor.Green * ratio, _
		  'gradientEnd.Blue * endratio + barColor.Blue * ratio)
		  'mPixelPic.Graphics.DrawLine(i, 0, i, mPixelPic.Height)
		  'next
		  ''End If
		  '
	#tag EndNote


	#tag Property, Flags = &h21
		Private BackingImage As String = "Spectrum2.png"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Buffer As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		Colors() As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MouseIn As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPixelPic As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSampleColor As Color
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mSampleColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSampleColor = value
			  Buffer = New Picture(15, 10, 24)
			  Buffer.Graphics.ForeColor = value
			  Buffer.Graphics.FillRect(0, 0, 15, 15)
			  Refresh(False)
			  RaiseEvent SampleChanged(value)
			End Set
		#tag EndSetter
		SampleColor As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		SelectedColor As Color
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Group="Initial State"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SampleColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectedColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
