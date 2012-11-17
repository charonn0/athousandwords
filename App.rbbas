#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Close()
		  For i As Integer = SpecialFolder.Temporary.Child("A Thousand Words").Count DownTo 1
		    SpecialFolder.Temporary.Child("A Thousand Words").Item(i).Delete
		  Next
		  SpecialFolder.Temporary.Child("A Thousand Words").Delete
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  UseGDIPlus = True
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  AutoQuit = True
		  errorHandler.Show
		  If error.Message.Trim = "" Then
		    error.Message = "An exception of type " + Introspection.GetType(error).FullName + " occurred. Call stack:" + EndOfLine
		  End If
		  Dim theStack As String = Join(error.CleanStack, EndOfLine)
		  errorHandler.errorStack.Text = error.Message + EndOfLine + theStack
		  Return True
		End Function
	#tag EndEvent


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
