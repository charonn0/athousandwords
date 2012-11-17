#tag Class
Protected Class ObjectException
Inherits RuntimeException
	#tag Method, Flags = &h1000
		Sub Constructor(ErrNum As Integer, Info As String = "")
		  ErrorNumber = ErrNum
		  Select Case ErrorNumber
		  Case 0
		    Message = "Not an error." + EndOfLine + Info
		  Case 1
		    Message = "The class specifies a different constructor input type than was provided." + EndOfLine + Info
		  Case 2
		    Message = "An object was referenced which no longer exists." + EndOfLine + Info
		  Case 3
		    Message = "An object which had been sent to disk was deleted before the data was retrieved." + EndOfLine + Info
		  Case 4
		    Message = "An object which has been sent to disk specifies an invalid backing file." + EndOfLine + Info
		  Else
		    Message = "Unspecified error." + EndOfLine + Info
		  End Select
		End Sub
	#tag EndMethod


	#tag Constant, Name = Error_Backing_File_Gone, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Error_Backing_File_Invalid, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Error_Invalid_Constructor, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Error_None, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Error_Stale_Reference, Type = Double, Dynamic = False, Default = \"2", Scope = Public
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
