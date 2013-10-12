#tag Module
Protected Module Oleacc
	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function GetProcessHandleFromHwnd Lib "Oleacc" (HWND As Integer) As Integer
	#tag EndExternalMethod


End Module
#tag EndModule
