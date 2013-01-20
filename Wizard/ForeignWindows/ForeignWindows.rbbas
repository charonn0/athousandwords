#tag Module
Protected Module ForeignWindows
	#tag Method, Flags = &h1
		Protected Function FromXY(X As Integer, Y As Integer) As ForeignWindows.ForeignWindow
		  Dim p As POINT
		  p.X = X
		  p.Y = Y
		  Dim hwnd As Integer = WindowFromPoint(p)
		  Return New ForeignWindows.ForeignWindow(hwnd)
		End Function
	#tag EndMethod

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


	#tag Constant, Name = CAPTUREBLT, Type = Double, Dynamic = False, Default = \"&h40000000", Scope = Protected
	#tag EndConstant

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

	#tag Constant, Name = SRCCOPY, Type = Double, Dynamic = False, Default = \"&h00CC0020", Scope = Protected
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
