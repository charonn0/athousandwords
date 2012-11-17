#tag Class
Protected Class PictureException
Inherits RuntimeException
	#tag Method, Flags = &h1000
		Sub Constructor(ErrNum As Integer, Info As String = "")
		  ErrorNumber = ErrNum
		  Select Case ErrorNumber
		  Case 0
		    Message = "Not and error." + EndOfLine + Info
		  Case 1
		    Message = "The picture is not valid." + EndOfLine + Info
		  Case 2
		    Message = "The file is not valid." + EndOfLine + Info
		  Else
		    Message = "Unspecified error." + EndOfLine + Info
		  End Select
		End Sub
	#tag EndMethod


	#tag Constant, Name = Error_Invalid_File, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Error_Invalid_Picture, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="ErrorNumber"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="RuntimeException"
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
			Name="Message"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="RuntimeException"
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
	#tag EndViewBehavior
End Class
#tag EndClass
