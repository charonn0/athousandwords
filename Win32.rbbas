#tag Module
Protected Module Win32
	#tag Method, Flags = &h1
		Protected Function CaptureScreen() As Picture
		  //Calls GetPartialScreenShot with a rectangle comprising all of the desktop rectangle. Returns a Picture
		  
		  #If TargetWin32 Then Return GetPartialScreenShot(0, 0, ScreenVirtualWidth, ScreenVirtualHeight)
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

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function FormatMessage Lib "Kernel32" Alias "FormatMessageW" (dwFlags As Integer, lpSource As Integer, dwMessageId As Integer, dwLanguageId As Integer, lpBuffer As ptr, nSize As Integer, Arguments As Integer) As Integer
	#tag EndExternalMethod

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
		Protected Function LockFile(lockedFile As FolderItem) As Integer
		  //Locks the file for exclusive use. You must call UnlockFile with the integer returned from this function to unlock the file.
		  //A positive return value is returned on success, 0 if lockedFile is Nil, and a negative number on error (a negative return value
		  //is actually the last Win32 error multiplied by -1. So, for example, -5 is ERROR_ACCESS_DENIED.)
		  
		  Declare Function CloseHandle Lib "Kernel32"(HWND As Integer) As Boolean
		  Declare Function CreateFileW Lib "Kernel32"(name As WString, access As Integer, sharemode As Integer, SecAtrribs As Integer, _
		  CreateDisp As Integer, flags As Integer, template As Integer) As Integer
		  Declare Function MyLockFile Lib "kernel32" Alias "LockFile" (hFile As integer, dwFileOffsetLow As integer, dwFileOffsetHigh As integer, _
		  nNumberOfBytesToLockLow As integer, nNumberOfBytesToLockHigh As integer) As Boolean
		  
		  Const GENERIC_READ = &h80000000
		  Const OPEN_EXISTING = 3
		  Const FILE_SHARE_READ = &h00000001
		  
		  If lockedFile = Nil Then Return 0
		  
		  Dim fHandle As Integer = CreateFileW(lockedFile.AbsolutePath, GENERIC_READ, FILE_SHARE_READ, 0, OPEN_EXISTING, 0, 0)
		  If fHandle > 0 Then
		    If myLockFile(fHandle, 0, 0, 1, 0) Then
		      Return fHandle   //You MUST keep this return value if you want to unlock the file later!!!
		    Else
		      Return LastErrorCode * -1
		    End If
		  Else
		    Return LastErrorCode * -1
		  End If
		  
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
		Protected Sub ShowInExplorer(f As FolderItem)
		  //Shows the file in Windows Explorer
		  
		  Dim param As String = "/select, """ + f.AbsolutePath + """"
		  Soft Declare Sub ShellExecuteW Lib "Shell32" (hwnd As Integer, op As WString, file As WString, params As WString, directory As Integer, _
		  cmd As Integer)
		  
		  Const SW_SHOW = 5
		  ShellExecuteW(0, "open", "explorer", param, 0, SW_SHOW)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function UnlockFile(fHandle As Integer) As Boolean
		  //See the LockFile function
		  
		  Declare Function myUnlockFile Lib "kernel32" Alias "UnlockFile" (ByVal hFile As integer, ByVal dwFileOffsetLow As integer, ByVal dwFileOffsetHigh As integer, _
		  ByVal nNumberOfBytesToUnlockLow As integer, ByVal nNumberOfBytesToUnlockHigh As integer) As Boolean
		  Declare Function CloseHandle Lib "kernel32" (ByVal hObject As integer) As Integer
		  
		  Dim ret As Boolean = myUnlockFile(fHandle, 0, 0, 1, 0)
		  Call CloseHandle(fHandle)
		  
		  Return ret
		End Function
	#tag EndMethod


	#tag Constant, Name = CAPTUREBLT, Type = Double, Dynamic = False, Default = \"&h40000000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FORMAT_MESSAGE_FROM_SYSTEM, Type = Double, Dynamic = False, Default = \"&H1000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SRCCOPY, Type = Double, Dynamic = False, Default = \"&h00CC0020", Scope = Public
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
