#tag Class
Protected Class InterlockException
Inherits RuntimeException
	#tag Method, Flags = &h1000
		Sub Constructor(ErrNum As Integer, Info As String = "")
		  ErrorNumber = ErrNum
		  Select Case ErrorNumber
		  Case 0
		    Message = "Not an error." + EndOfLine + Info
		  Case 1
		    Message = "A renderer was already running when asked to run." + EndOfLine + Info
		  Case 2
		    Message = "A duplicate of a singleton thread was created." + EndOfLine + Info
		  Case 3
		    Message = "A lock was requested but was already held." + EndOfLine + Info
		  Else
		    Message = "Unspecified error." + EndOfLine + Info
		  End Select
		End Sub
	#tag EndMethod


	#tag Constant, Name = Error_Duplicate_Thread, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Error_Lock_Held, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Error_None, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Error_Render_Already_Running, Type = Double, Dynamic = False, Default = \"1", Scope = Public
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
