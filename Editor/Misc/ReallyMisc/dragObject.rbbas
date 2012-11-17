#tag Class
Protected Class dragObject
	#tag Method, Flags = &h0
		Sub Constructor(p As Picture)
		  //Use this Constructor to create a dragObject from a Picture Object. The new object will be placed
		  //randomly for its initial position.
		  
		  image = Resize(p)
		  width = image.Width
		  height = image.Height
		  
		Exception
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetProperty(PropertyName As String) As Integer
		  Return Properties.Value(PropertyName).IntegerValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetProperty(PropertyName As String) As String
		  Return Properties.Value(PropertyName).StringValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasProperty(PropertyName As String) As Boolean
		  #pragma BreakOnExceptions Off
		  Return Properties.HasKey(PropertyName)
		  
		Exception
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Resize(p As Picture, dbl As Integer = 1) As Picture
		  #pragma BreakOnExceptions Off
		  Dim wRatio As Double
		  
		  If p.Width > p.Height Then
		    wRatio = (1.5 * 100) / p.Width
		  Else
		    wRatio = (1.5 * 100) / p.Height
		  End If
		  wRatio = wRatio * dbl
		  p = Scale(p, wRatio)
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetProperty(PropertyName As String, Assigns Value As Integer)
		  Properties.Value(PropertyName) = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetProperty(PropertyName As String, Assigns Value As String)
		  Properties.Value(PropertyName) = Value
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  'If Hilight Then
			  'Return mheight * DoubleIs
			  'End If
			  return mheight
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mheight = value
			End Set
		#tag EndSetter
		height As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Hilight As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  'If Hilight Then
			  'Return Scale(mimage, DoubleIs)
			  'End If
			  return mimage
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mimage = value
			End Set
		#tag EndSetter
		image As Picture
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mheight As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mimage As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Use this property to store/retrieve arbitrary information about the tile.
			See the MainWindow.Open event for a simple example (storing the file path)
		#tag EndNote
		Private mProperties As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mwidth As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mProperties = Nil Then mProperties = New Dictionary
			  return mProperties
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mProperties = value
			End Set
		#tag EndSetter
		Properties As Dictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  'If Hilight Then
			  'Return mwidth * DoubleIs
			  'End If
			  return mwidth
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mwidth = value
			End Set
		#tag EndSetter
		width As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		x As Integer = 75
	#tag EndProperty

	#tag Property, Flags = &h0
		y As Integer = 75
	#tag EndProperty


	#tag Constant, Name = DoubleIs, Type = Double, Dynamic = False, Default = \"1.5", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="height"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hilight"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="image"
			Group="Behavior"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="width"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="x"
			Group="Behavior"
			InitialValue="75"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="y"
			Group="Behavior"
			InitialValue="75"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
