#tag Module
Protected Module Win32
	#tag ExternalMethod, Flags = &h0
		Declare Function BitBlt Lib "GDI32" (DCdest As Integer, xDest As Integer, yDest As Integer, nWidth As Integer, nHeight As Integer, DCdource As Integer, xSource As Integer, ySource As Integer, rasterOp As Integer) As Boolean
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function CaptureScreen() As Picture
		  //Calls GetPartialScreenShot with a rectangle comprising all of the desktop rectangle. Returns a Picture
		  
		  #If TargetWin32 Then Return GetPartialScreenShot(0, 0, ScreenVirtualWidth, ScreenVirtualHeight)
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function CloseHandle Lib "Kernel32" (handle As Integer) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function CreateFile Lib "Kernel32" Alias "CreateFileW" (name As WString, access As Integer, sharemode As Integer, SecAtrribs As Integer, CreateDisp As Integer, flags As Integer, template As Integer) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function CurrentUser() As String
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

	#tag ExternalMethod, Flags = &h0
		Declare Function FindWindow Lib "User32" Alias "FindWindowW" (ClassName As Integer, WindowName As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function FlashWindow Lib "User32" (hwnd As integer, bInvert As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function FormatMessage Lib "Kernel32" Alias "FormatMessageW" (dwFlags As Integer, lpSource As Integer, dwMessageId As Integer, dwLanguageId As Integer, lpBuffer As ptr, nSize As Integer, Arguments As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function GetAncestor Lib "User32" (HWND As Integer, Flags As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function GetCurrentProcessId Lib "Kernel32" () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function GetDC Lib "User32" (HWND As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function GetDesktopWindow Lib "User32" () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function GetLastError Lib "Kernel32" () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function GetLayeredWindowAttributes Lib "User32" (hwnd As Integer, thecolor As Integer, ByRef bAlpha As Integer, flags As Integer) As Boolean
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function GetPartialScreenShot(X As Integer, Y As Integer, width As Integer, height As Integer) As Picture
		  //Returns a Picture of the defined rectangle from current desktop.
		  //Rectangle coordinates are relative to the upper left corner of the user's leftmost screen, in pixels
		  
		  #If TargetWin32 Then
		    Dim screenCap As New Picture(Width, Height, 24)
		    Dim deskHWND As Integer = GetDesktopWindow()
		    Dim deskHDC As Integer = GetDC(deskHWND)
		    Call BitBlt(screenCap.Graphics.Handle(Graphics.HandleTypeHDC), 0, 0, Width, Height, DeskHDC, X, Y, SRCCOPY Or CAPTUREBLT)
		    Call ReleaseDC(DeskHWND, deskHDC)
		    
		    Return screenCap
		  #endif
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function GetSystemMetrics Lib "User32" (Index As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function GetUserName Lib "AdvApi32" Alias "GetUserNameW" (buffer As Ptr, ByRef buffSize As Integer) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function GetVersionEx Lib "Kernel32" Alias "GetVersionExA" (ByRef info As OSVERSIONINFOEX) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function GetWindow Lib "User32" (HWND As Integer, CMD As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function GetWindowInfo Lib "User32" (HWND As Integer, ByRef Info As WINDOWINFO) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function GetWindowLong Lib "User32" Alias "GetWindowLongW" (HWND As Integer, Index As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function GetWindowModuleFileName Lib "User32" (HWND As Integer, Filename As Ptr, MaxChars As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function GetWindowRect Lib "User32" (HWND As Integer, ByRef dimensions As RECT) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function GetWindowText Lib "User32" Alias "GetWindowTextW" (HWND As Integer, Buffer As Ptr, BufferSize As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function GetWindowThreadProcessId Lib "User32" (HWND As Integer, ByRef ProcessID As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function IsWindowVisible Lib "User32" (HWND As Integer) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function LoadImage Lib "User32" (ModuleHandle As Ptr, Path As WString, Type As Integer, cx As Integer, cy As Integer, LoadFrom As Integer) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function LockFile(lockedFile As FolderItem) As Integer
		  //Locks the file for exclusive use. You must call UnlockFile with the integer returned from this function to unlock the file.
		  //A positive return value is returned on success, 0 if lockedFile is Nil, and a negative number on error (a negative return value
		  //is actually the last Win32 error multiplied by -1. So, for example, -5 is ERROR_ACCESS_DENIED.)
		  
		  If lockedFile = Nil Then Return 0
		  
		  Dim fHandle As Integer = CreateFile(lockedFile.AbsolutePath, GENERIC_READ, FILE_SHARE_READ, 0, OPEN_EXISTING, 0, 0)
		  If fHandle > 0 Then
		    If LockFile(fHandle, 0, 0, 1, 0) Then
		      Return fHandle   //You MUST keep this return value if you want to unlock the file later!!!
		    Else
		      Return GetLastError * -1
		    End If
		  Else
		    Return GetLastError * -1
		  End If
		  
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function LockFile Lib "Kernel32" (FileHandle As Integer, dwFileOffsetLow As Integer, dwFileOffsetHigh As Integer, nNumberOfBytesToLockLow As Integer, nNumberOfBytesToLockHigh As Integer) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function OpenProcess Lib "Kernel32" (DesiredAccess As Integer, InheritHandle As Boolean, ProcId As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function PathGetArgs Lib "Shlwapi" Alias "PathGetArgsW" (path As WString) As WString
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function ReleaseDC Lib "User32" (HWND As Integer, DC As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function RpcStringFree Lib "Rpcrt4" Alias "RpcStringFreeA" (Addr As Ptr) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function ScreenVirtualHeight() As Integer
		  //Returns the height of the bounding rectangle around all monitors. On single-screen systems this is identical to ScreenHeight
		  Return GetSystemMetrics(79)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScreenVirtualWidth() As Integer
		  //Returns the width of the bounding rectangle around all monitors. On single-screen systems this is identical to ScreenWidth
		  Return GetSystemMetrics(78)
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function SendMessage Lib "User32" (HWND As Integer, Msg As Integer, wParam As Ptr, lParam As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function SetLayeredWindowAttributes Lib "User32" (hwnd As Integer, thecolor As Integer, bAlpha As integer, alpha As Integer) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function SetWindowLong Lib "User32" Alias "SetWindowLongW" (HWND As Integer, Index As Integer, NewLong As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function SetWindowPos Lib "User32" (HWND As Integer, hWndInstertAfter As Integer, x As Integer, y As Integer, cx As Integer, cy As Integer, flags As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function SetWindowText Lib "User32" Alias "SetWindowTextW" (WND As Integer, Buffer As Ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function ShellExecute Lib "Shell32" Alias "ShellExecuteW" (HWND As Integer, op As WString, file As WString, params As WString, directory As Integer, cmd As Integer) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Sub ShowInExplorer(f As FolderItem)
		  //Shows the file in Windows Explorer
		  
		  Dim param As String = "/select, """ + f.AbsolutePath + """"
		  Call ShellExecute(0, "open", "explorer", param, 0, SW_SHOW)
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function ShowWindow Lib "User32" (HWND As Integer, CmdShow As Integer) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function TerminateProcess Lib "Kernel32" (Handle As Integer, ExitCode As Integer) As Boolean
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function UnlockFile(fHandle As Integer) As Boolean
		  //See the LockFile function
		  
		  Dim ret As Boolean = UnlockFile(fHandle, 0, 0, 1, 0)
		  Call CloseHandle(fHandle)
		  
		  Return ret
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function UnlockFile Lib "Kernel32" (FileHandle As Integer, dwFileOffsetLow As integer, dwFileOffsetHigh As integer, nNumberOfBytesToUnlockLow As integer, nNumberOfBytesToUnlockHigh As integer) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function UuidCreate Lib "Rpcrt4" (Uuid As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function UuidToString Lib "Rpcrt4" Alias "UuidToStringA" (Uuid As Ptr, ByRef p As ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function WindowFromPoint Lib "User32" (XY As POINT) As Integer
	#tag EndExternalMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //Returns the Kernel version of Windows as a Double (MajorVersion.MinorVersion)
			  //For example, Windows 2000 returns 5.0, XP Returns 5.1, Vista Returns 6.0 and Windows 7 returns 6.1
			  //On error, returns 0.0
			  
			  #If TargetWin32 Then
			    Dim info As OSVERSIONINFOEX
			    info.StructSize = Info.Size
			    
			    If GetVersionEx(info) Then
			      Return info.MajorVersion + (info.MinorVersion / 10)
			    Else
			      Return 0.0
			    End If
			  #endif
			End Get
		#tag EndGetter
		KernelVersion As Double
	#tag EndComputedProperty


	#tag Constant, Name = CAPTUREBLT, Type = Double, Dynamic = False, Default = \"&h40000000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FILE_SHARE_READ, Type = Double, Dynamic = False, Default = \"&h00000001", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FORMAT_MESSAGE_FROM_SYSTEM, Type = Double, Dynamic = False, Default = \"&H1000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = GENERIC_READ, Type = Double, Dynamic = False, Default = \"&h80000000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OPEN_EXISTING, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = RPC_S_UUID_LOCAL_ONLY, Type = Double, Dynamic = False, Default = \"1824", Scope = Public
	#tag EndConstant

	#tag Constant, Name = RPC_S_UUID_NO_ADDRESS, Type = Double, Dynamic = False, Default = \"1739", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SRCCOPY, Type = Double, Dynamic = False, Default = \"&h00CC0020", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SW_SHOW, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant


	#tag Structure, Name = OSVERSIONINFOEX, Flags = &h0
		StructSize As UInt32
		  MajorVersion As Integer
		  MinorVersion As Integer
		  BuildNumber As Integer
		  PlatformID As Integer
		  ServicePackName As String*128
		  ServicePackMajor As UInt16
		  ServicePackMinor As UInt16
		  SuiteMask As UInt16
		  ProductType As Byte
		Reserved As Byte
	#tag EndStructure

	#tag Structure, Name = POINT, Flags = &h0
		X As Integer
		Y As Integer
	#tag EndStructure

	#tag Structure, Name = RECT, Flags = &h0
		left As Integer
		  top As Integer
		  right As Integer
		bottom As Integer
	#tag EndStructure

	#tag Structure, Name = WINDOWINFO, Flags = &h0
		cbSize As Integer
		  WindowArea As RECT
		  ClientArea As RECT
		  Style As Integer
		  ExStyle As Integer
		  WindowStatus As Integer
		  cxWindowBorders As Integer
		  cyWindowBorders As Integer
		  Atom As UInt16
		CreatorVersion As UInt16
	#tag EndStructure


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
