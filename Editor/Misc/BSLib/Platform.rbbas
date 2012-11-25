#tag Module
Protected Module Platform
	#tag Method, Flags = &h1
		Protected Function CaptureScreen() As Picture
		  //Calls GetPartialScreenShot with a rectangle comprising all of the desktop rectangle. Returns a Picture
		  
		  #If TargetWin32 Then Return GetPartialScreenShot(0, 0, ScreenVirtualWidth, ScreenVirtualHeight)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CaptureWindow(Win As ForeignWindows.ForeignWindow) As Picture
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CaptureWindow1(Win As ForeignWindows.ForeignWindow) As Picture
		  Declare Function GetDC Lib "User32" (HWND As Integer) As Integer
		  Declare Function BitBlt Lib "GDI32" (DCdest As Integer, xDest As Integer, yDest As Integer, nWidth As Integer, nHeight As Integer, _
		  DCdource As Integer, xSource As Integer, ySource As Integer, rasterOp As Integer) As Boolean
		  Declare Function ReleaseDC Lib "User32" (HWND As Integer, DC As Integer) As Integer
		  win.Visible = True
		  Dim l, t, w, h As Integer
		  l = win.Left
		  t = win.Top
		  w = win.Width
		  h = win.height
		  Dim screenCap As New Picture(w, h, 24)
		  Dim WinHDC As Integer = GetDC(Win.Handle)
		  Call BitBlt(screenCap.Graphics.Handle(Graphics.HandleTypeHDC), 0, 0, w, h, WinHDC, 0, 0, SRCCOPY)' Or CAPTUREBLT)
		  Call ReleaseDC(Win.Handle, WinHDC)
		  
		  Return screenCap
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CurrentUser() As String
		  //Returns the username of the account under which the application is running.
		  //On Error, returns an empty string
		  //Do not use this function to determine if the user is the Administrator. Use IsAdmin instead.
		  
		  #If TargetWin32 Then
		    Dim mb As New MemoryBlock(0)
		    Dim nmLen As Integer = mb.Size
		    Call GetUserName(mb, nmLen)
		    mb = New MemoryBlock(nmLen * 2)
		    nmLen = mb.Size
		    If GetUserName(mb, nmLen) Then
		      Return mb.WString(0)
		    Else
		      Return ""
		    End If
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ErrorMessageFromCode(err As Integer) As String
		  //Returns the error message corresponding to a given windows error number. If no message is available, returns the error number as a string.
		  //To get the REAL last error code, you should call LastErrorCode *immediately* to avoid having another function change the last error.
		  
		  #If TargetWin32 Then
		    Declare Function FormatMessageW Lib "Kernel32" (dwFlags As Integer, lpSource As Integer, dwMessageId As Integer, dwLanguageId As Integer, lpBuffer As ptr, _
		    nSize As Integer, Arguments As Integer) As Integer
		    
		    Dim buffer As New MemoryBlock(2048)
		    If FormatMessageW(FORMAT_MESSAGE_FROM_SYSTEM, 0, err, 0 , Buffer, Buffer.Size, 0) <> 0 Then
		      Return Buffer.WString(0)
		    Else
		      Return str(err)
		    End If
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetPartialScreenShot(X As Integer, Y As Integer, width As Integer, height As Integer) As Picture
		  //Returns a Picture of the defined rectangle from current desktop.
		  //Rectangle coordinates are relative to the upper left corner of the user's leftmost screen, in pixels
		  
		  #If TargetWin32 Then
		    Declare Function GetDesktopWindow Lib "User32" () As Integer
		    Declare Function GetDC Lib "User32" (HWND As Integer) As Integer
		    Declare Function BitBlt Lib "GDI32" (DCdest As Integer, xDest As Integer, yDest As Integer, nWidth As Integer, nHeight As Integer, _
		    DCdource As Integer, xSource As Integer, ySource As Integer, rasterOp As Integer) As Boolean
		    Declare Function ReleaseDC Lib "User32" (HWND As Integer, DC As Integer) As Integer
		    
		    Dim screenCap As New Picture(Width, Height, 24)
		    Dim deskHWND As Integer = GetDesktopWindow()
		    Dim deskHDC As Integer = GetDC(deskHWND)
		    Call BitBlt(screenCap.Graphics.Handle(Graphics.HandleTypeHDC), 0, 0, Width, Height, DeskHDC, X, Y, SRCCOPY Or CAPTUREBLT)
		    Call ReleaseDC(DeskHWND, deskHDC)
		    
		    Return screenCap
		  #endif
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function GetSystemMetrics Lib "User32" (nIndex As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function GetUserName Lib "AdvApi32" Alias "GetUserNameW" (buffer As Ptr, ByRef buffSize As Integer) As Boolean
	#tag EndExternalMethod

	#tag Method, Flags = &h1
		Protected Function LastErrorCode() As Integer
		  //Returns the last error for the current process.
		  //Error codes are documented here: http://msdn.microsoft.com/en-us/library/ms681381%28v=VS.85%29.aspx
		  
		  #If TargetWin32 Then
		    Declare Function GetLastError Lib "Kernel32" () As Integer
		    Return GetLastError()
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LeftHandedMouse() As Boolean
		  //Returns True if the user has configured the Right mouse button as the primary
		  //rather than secondary mouse button (i.e. a left-handed user)
		  Return GetSystemMetrics(23) <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ScreenCount() As Integer
		  //Returns the number of screens/monitors used on the current desktop.
		  Return GetSystemMetrics(80)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ScreenHeight() As Integer
		  //Returns the height of the main screen, in pixels
		  Return GetSystemMetrics(1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ScreenVirtualHeight() As Integer
		  //Returns the height of the bounding rectangle around all monitors. On single-screen systems this is identical to ScreenHeight
		  Return GetSystemMetrics(79)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ScreenVirtualWidth() As Integer
		  //Returns the width of the bounding rectangle around all monitors. On single-screen systems this is identical to ScreenWidth
		  Return GetSystemMetrics(78)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ScreenWidth() As Integer
		  //Returns the width of the main screen, in pixels
		  Return GetSystemMetrics(0)
		End Function
	#tag EndMethod


	#tag Constant, Name = PROCESSOR_ARCHITECTURE_AMD64, Type = Double, Dynamic = False, Default = \"9", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PROCESSOR_ARCHITECTURE_IA64, Type = Double, Dynamic = False, Default = \"6", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PROCESSOR_ARCHITECTURE_INTEL, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PROCESSOR_ARCHITECTURE_UNKNOWN, Type = Double, Dynamic = False, Default = \"&hffff", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Win2000, Type = Double, Dynamic = False, Default = \"5.0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Win7, Type = Double, Dynamic = False, Default = \"6.1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Win8, Type = Double, Dynamic = False, Default = \"6.2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WinServer2003, Type = Double, Dynamic = False, Default = \"5.2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WinServer2008, Type = Double, Dynamic = False, Default = \"6.0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WinServer2008r2, Type = Double, Dynamic = False, Default = \"6.1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WinVista, Type = Double, Dynamic = False, Default = \"6.0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WinXP, Type = Double, Dynamic = False, Default = \"5.1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WinXPx64, Type = Double, Dynamic = False, Default = \"5.2", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
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
	#tag EndViewBehavior
End Module
#tag EndModule
