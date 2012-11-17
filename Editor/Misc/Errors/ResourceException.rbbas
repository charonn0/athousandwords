#tag Class
Protected Class ResourceException
Inherits RuntimeException
	#tag Method, Flags = &h1000
		Sub Constructor(ErrNum As Integer, Info As String = "")
		  ErrorNumber = ErrNum
		  Select Case ErrorNumber
		  Case Error_None
		    Message = "Not an error." + EndOfLine + Info
		  Case Error_Corrupt_Resource_File
		    Message = "The specified resource file is corrupt." + EndOfLine + Info
		  Case Error_Cannot_Write
		    Message = "The specified resource file could not be written to." + EndOfLine + Info
		  Case Error_Cannot_Read
		    Message = "The specified resource file could not be read." + EndOfLine + Info
		  Case Error_IO_Exception
		    Message = "A required file was not accessible." + EndOfLine + Info
		  Case Error_No_File
		    Message = "The specified resource file was not found." + EndOfLine + Info
		  Else
		    Message = "Unspecified error." + EndOfLine + Info
		  End Select
		End Sub
	#tag EndMethod


	#tag Constant, Name = Error_Cannot_Read, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Error_Cannot_Write, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Error_Corrupt_Resource_File, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Error_IO_Exception, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Error_None, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Error_No_File, Type = Double, Dynamic = False, Default = \"5", Scope = Public
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
