#tag Class
Protected Class ForeignWindow
	#tag Method, Flags = &h0
		Sub BringToFront()
		  Call ShowWindow(Me.Handle, SW_SHOWNORMAL)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Capture() As Picture
		  Dim l, t, w, h As Integer
		  l = Me.Left
		  t = Me.Top
		  w = Me.Width
		  h = Me.height
		  Return Platform.GetPartialScreenShot(l, t, w, h)
		  
		  
		  Dim screenCap As New Picture(w, h, 24)
		  Dim WinHDC As Integer = GetDC(Me.Handle)
		  Call BitBlt(screenCap.Graphics.Handle(Graphics.HandleTypeHDC), 0, 0, w, h, WinHDC, 0, 0, SRCCOPY Or CAPTUREBLT)
		  Call ReleaseDC(Me.Handle, WinHDC)
		  
		  Return screenCap
		  
		Exception
		  Return Platform.CaptureScreen()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ChangeWindowStyleEx(flag As Integer, set As Boolean)
		  #if TargetWin32
		    Dim oldFlags As Integer
		    Dim newFlags As Integer
		    Dim styleFlags As Integer
		    
		    Const SWP_NOSIZE = &H1
		    Const SWP_NOMOVE = &H2
		    Const SWP_NOZORDER = &H4
		    Const SWP_FRAMECHANGED = &H20
		    
		    Const GWL_EXSTYLE = -20
		    
		    Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (hwnd As Integer,  _
		    nIndex As Integer) As Integer
		    Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (hwnd As Integer, _
		    nIndex As Integer, dwNewLong As Integer) As Integer
		    Declare Function SetWindowPos Lib "user32" (hwnd As Integer, hWndInstertAfter As Integer, _
		    x As Integer, y As Integer, cx As Integer, cy As Integer, flags As Integer) As Integer
		    
		    oldFlags = GetWindowLong(Handle, GWL_EXSTYLE)
		    
		    if not set then
		      newFlags = BitwiseAnd(oldFlags, Bitwise.OnesComplement(flag))
		    else
		      newFlags = BitwiseOr(oldFlags, flag)
		    end
		    
		    
		    styleFlags = SetWindowLong(Handle, GWL_EXSTYLE, newFlags)
		    styleFlags = SetWindowPos(Handle, 0, 0, 0, 0, 0, SWP_NOMOVE +_
		    SWP_NOSIZE + SWP_NOZORDER + SWP_FRAMECHANGED)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(HWND As Integer)
		  Me.mHandle = HWND
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Identify(FlashCount As Integer = 1)
		  Call FlashWindow(Handle, FlashCount)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Maximized()
		  Call ShowWindow(Me.Handle, SW_MAXIMIZE)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Minimized()
		  Call ShowWindow(Me.Handle, SW_MAXIMIZE)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim a As Integer
			  If GetLayeredWindowAttributes(Me.Handle, 0 , a, LWA_ALPHA) Then
			    Return a / 255.0
			  Else
			    Return 255.0
			  End If
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim oldFlags As Integer = GetWindowLong(Me.Handle, GWL_EXSTYLE)
			  
			  If BitAnd(oldFlags, WS_EX_LAYERED) <> WS_EX_LAYERED Then
			    // The window isn't layered, so make it so
			    Dim newflags As Integer = oldFlags Or WS_EX_LAYERED
			    Call SetWindowLong(Me.Handle, GWL_EXSTYLE, newFlags)
			    Call SetWindowPos(Me.Handle, 0, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE + SWP_NOZORDER + SWP_FRAMECHANGED)
			  end
			  
			  // Now we want to set the transparency of the window.  The values range from 0 (totally
			  // transparent) to 255 (totally opaque).
			  Call SetLayeredWindowAttributes(Handle, 0 , value * 255, LWA_ALPHA)
			  
			End Set
		#tag EndSetter
		Alpha As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim info As WINDOWINFO
			  If GetWindowInfo(Me.Handle, info) Then
			    Return info.cxWindowBorders
			  End If
			End Get
		#tag EndGetter
		BorderSizeX As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim info As WINDOWINFO
			  If GetWindowInfo(Me.Handle, info) Then
			    Return info.cyWindowBorders
			  End If
			End Get
		#tag EndGetter
		BorderSizeY As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #pragma BreakOnExceptions Off
			  'Declare Function GetWindowTextW Lib "user32" ( hWnd As integer, lpString As ptr, cch As integer ) As integer
			  Dim mb As New MemoryBlock(255)
			  Call GetWindowText(Me.Handle, mb, mb.Size)
			  Return mb.WString(0)
			  
			  Exception err As OutOfBoundsException
			    Return ""
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim mb As MemoryBlock = value
			  Call SetWindowText(Me.Handle, mb)
			End Set
		#tag EndSetter
		Caption As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mHandle
			End Get
		#tag EndGetter
		Handle As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim info As WINDOWINFO
			  info.cbSize = info.Size
			  If GetWindowInfo(Me.Handle, info) Then
			    Dim size As RECT = info.WindowArea
			    Return size.bottom - size.top
			  End If
			End Get
		#tag EndGetter
		Height As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim info As WINDOWINFO
			  info.cbSize = info.Size
			  If GetWindowInfo(Me.Handle, info) Then
			    Dim size As RECT = info.WindowArea
			    Return size.left
			  End If
			End Get
		#tag EndGetter
		Left As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mHandle As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return GetWindow(Me.Handle, GW_OWNER)
			End Get
		#tag EndGetter
		Owner As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return GetAncestor(Me.Handle, GA_PARENT)
			End Get
		#tag EndGetter
		Parent As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim info As WINDOWINFO
			  info.cbSize = info.Size
			  If GetWindowInfo(Me.Handle, info) Then
			    Dim size As RECT = info.WindowArea
			    Return size.top
			  End If
			End Get
		#tag EndGetter
		Top As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim info As WINDOWINFO
			  info.cbSize = info.Size
			  If GetWindowInfo(Me.Handle, info) Then
			    Dim size As RECT = info.ClientArea
			    Return size.bottom - size.top + (2 * BorderSizeY)
			  End If
			End Get
		#tag EndGetter
		TrueHeight As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim info As WINDOWINFO
			  info.cbSize = info.Size
			  If GetWindowInfo(Me.Handle, info) Then
			    Dim size As RECT = info.ClientArea
			    Return size.Left - info.cxWindowBorders
			  End If
			End Get
		#tag EndGetter
		TrueLeft As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return GetAncestor(Me.Handle, GA_ROOTOWNER)
			End Get
		#tag EndGetter
		TrueOwner As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return GetAncestor(Me.Handle, GA_ROOT)
			End Get
		#tag EndGetter
		TrueParent As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim info As WINDOWINFO
			  info.cbSize = info.Size
			  If GetWindowInfo(Me.Handle, info) Then
			    Dim size As RECT = info.ClientArea
			    Return size.right + info.cxWindowBorders
			  End If
			End Get
		#tag EndGetter
		TrueRight As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim info As WINDOWINFO
			  info.cbSize = info.Size
			  If GetWindowInfo(Me.Handle, info) Then
			    Dim size As RECT = info.ClientArea
			    Return size.top - BorderSizeY
			  End If
			End Get
		#tag EndGetter
		TrueTop As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim info As WINDOWINFO
			  info.cbSize = info.Size
			  If GetWindowInfo(Me.Handle, info) Then
			    Dim size As RECT = info.ClientArea
			    Return size.Right - size.Left + (2 * BorderSizeX)
			  End If
			End Get
		#tag EndGetter
		TrueWidth As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return IsWindowVisible(Me.Handle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Call ShowWindow(Me.Handle, SW_SHOW)
			  Else
			    Call ShowWindow(Me.Handle, SW_FORCEMINIMIZE)
			  End If
			  
			End Set
		#tag EndSetter
		Visible As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim info As WINDOWINFO
			  info.cbSize = info.Size
			  If GetWindowInfo(Me.Handle, info) Then
			    Dim size As RECT = info.WindowArea
			    Return size.right - size.left
			  End If
			End Get
		#tag EndGetter
		Width As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Alpha"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderSizeX"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderSizeY"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Caption"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Handle"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Group="Behavior"
			Type="Integer"
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
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Owner"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Parent"
			Group="Behavior"
			Type="Integer"
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
		#tag ViewProperty
			Name="TrueHeight"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TrueLeft"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TrueOwner"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TrueParent"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TrueRight"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TrueTop"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TrueWidth"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
