#tag Module
Protected Module ForeignWindows
	#tag ExternalMethod, Flags = &h1
		Protected Declare Function BitBlt Lib "GDI32" (DCdest As Integer, xDest As Integer, yDest As Integer, nWidth As Integer, nHeight As Integer, DCdource As Integer, xSource As Integer, ySource As Integer, rasterOp As Integer) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function FindWindow Lib "User32" Alias "FindWindowW" (ClassName As Integer, WindowName As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function FlashWindow Lib "User32" (hwnd As integer, bInvert As Integer) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h1
		Protected Function FromXY(X As Integer, Y As Integer) As ForeignWindows.ForeignWindow
		  Dim p As POINT
		  p.X = X
		  p.Y = Y
		  Dim hwnd As Integer = WindowFromPoint(p)
		  Return New ForeignWindows.ForeignWindow(hwnd)
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function GetAncestor Lib "User32" (HWND As Integer, Flags As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function GetDC Lib "User32" (HWND As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function GetLayeredWindowAttributes Lib "User32" (hwnd As Integer, thecolor As Integer, ByRef bAlpha As Integer, flags As Integer) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function GetSystemMetrics Lib "User32" (Index As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function GetWindow Lib "User32" (HWND As Integer, CMD As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function GetWindowInfo Lib "User32" (HWND As Integer, ByRef Info As WINDOWINFO) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function GetWindowLong Lib "User32" Alias "GetWindowLongW" (HWND As Integer, Index As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function GetWindowModuleFileName Lib "User32" Alias "GetWindowModuleFileNameW" (HWND As Integer, Filename As Ptr, MaxChars As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function GetWindowRect Lib "User32" (HWND As Integer, ByRef dimensions As RECT) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function GetWindowText Lib "User32" Alias "GetWindowTextW" (HWND As Integer, Buffer As Ptr, BufferSize As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function GetWindowThreadProcessId Lib "User32" (HWND As Integer, ByRef ProcessID As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function IsWindowVisible Lib "User32" (HWND As Integer) As Boolean
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Function ListWindows() As ForeignWindows.ForeignWindow()
		  Dim wins() As ForeignWindows.ForeignWindow
		  Dim ret as integer
		  ret = FindWindow(0, 0)
		  Dim hidden() As String = Split("MSCTFIME UI,Default IME,Jump List,Start Menu,Start,Program Manager", ",")
		  while ret > 0
		    Dim pw As New ForeignWindows.ForeignWindow(ret)
		    If pw.Caption.Trim <> "" And hidden.IndexOf(pw.Caption.Trim) <= -1 And pw.Visible then
		      wins.Append(pw)
		    End If
		    ret = GetWindow(ret, GW_HWNDNEXT)
		  wend
		  Return wins
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function LoadImage Lib "User32" Alias "LoadImageW" (ModuleHandle As Ptr, Path As WString, Type As Integer, cx As Integer, cy As Integer, LoadFrom As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function ReleaseDC Lib "User32" (HWND As Integer, DC As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function SendMessage Lib "User32" Alias "SendMessageW" (HWND As Integer, Msg As Integer, wParam As Ptr, lParam As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function SetLayeredWindowAttributes Lib "User32" (hwnd As Integer, thecolor As Integer, bAlpha As integer, alpha As Integer) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function SetWindowLong Lib "User32" Alias "SetWindowLongW" (HWND As Integer, Index As Integer, NewLong As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function SetWindowPos Lib "User32" (HWND As Integer, hWndInstertAfter As Integer, x As Integer, y As Integer, cx As Integer, cy As Integer, flags As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function SetWindowText Lib "User32" Alias "SetWindowTextW" (WND As Integer, Buffer As Ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function ShowWindow Lib "User32" (HWND As Integer, CmdShow As Integer) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Declare Function WindowFromPoint Lib "User32" (XY As POINT) As Integer
	#tag EndExternalMethod


	#tag Constant, Name = GA_PARENT, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GA_ROOT, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GA_ROOTOWNER, Type = Double, Dynamic = False, Default = \"3", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GWL_EXSTYLE, Type = Double, Dynamic = False, Default = \"-20", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GW_HWNDNEXT, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GW_OWNER, Type = Double, Dynamic = False, Default = \"4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LR_LOADFROMFILE, Type = Double, Dynamic = False, Default = \"&h00000010", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LWA_ALPHA, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PRF_CLIENT, Type = Double, Dynamic = False, Default = \"&h00000004", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PRF_NONCLIENT, Type = Double, Dynamic = False, Default = \"&h00000002", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SE_PRIVILEGE_ENABLED, Type = Double, Dynamic = False, Default = \"&h00000002", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SE_PRIVILEGE_ENABLED1, Type = Double, Dynamic = False, Default = \"&h00000002", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SE_PROF_SINGLE_PROCESS_NAME, Type = String, Dynamic = False, Default = \"SeProfileSingleProcessPrivilege", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SWP_FRAMECHANGED, Type = Double, Dynamic = False, Default = \"&h20", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SWP_NOMOVE, Type = Double, Dynamic = False, Default = \"&h2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SWP_NOSIZE, Type = Double, Dynamic = False, Default = \"&h1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SWP_NOZORDER, Type = Double, Dynamic = False, Default = \"&h4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SW_FORCEMINIMIZE, Type = Double, Dynamic = False, Default = \"11", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SW_MAXIMIZE, Type = Double, Dynamic = False, Default = \"3", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SW_SHOW, Type = Double, Dynamic = False, Default = \"5", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SW_SHOWMINIMIZED, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SW_SHOWNORMAL, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TOKEN_ADJUST_PRIVILEGES, Type = Double, Dynamic = False, Default = \"&h00000020", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TOKEN_QUERY, Type = Double, Dynamic = False, Default = \"&h00000008", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WM_GETTEXT, Type = Double, Dynamic = False, Default = \"&h000D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WM_PRINT, Type = Double, Dynamic = False, Default = \"&h0317", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WM_SETICON, Type = Double, Dynamic = False, Default = \"&h0080", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WS_EX_LAYERED, Type = Double, Dynamic = False, Default = \"&h80000", Scope = Protected
	#tag EndConstant


	#tag Structure, Name = POINT, Flags = &h1
		X As Integer
		Y As Integer
	#tag EndStructure

	#tag Structure, Name = RECT, Flags = &h1
		left As Integer
		  top As Integer
		  right As Integer
		bottom As Integer
	#tag EndStructure

	#tag Structure, Name = WINDOWINFO, Flags = &h1
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
