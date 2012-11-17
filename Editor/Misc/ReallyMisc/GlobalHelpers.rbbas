#tag Module
Protected Module GlobalHelpers
	#tag Method, Flags = &h0
		Function GetFIPic(In_FI As freeImage) As Picture
		  if In_FI = nil then return nil
		  
		  // Since Mod_FreeImage has no elegant way of getting a Picture object from a FreeImage object, we're going to do a hack job
		  dim ftmp As FolderItem = GetTemporaryFolderItem
		  if ftmp <> nil then
		    // JPEG won't write images that have been passed through dither or threshold. We could convert back to 24 or 36 bits, but
		    // it's just as easy to save to BMP instead.
		    'if In_FI.Save( ftmp, FI_Format.JPEG, FI_Flag.JPEG_QUALITYSUPERB ) then
		    if In_FI.Save( ftmp, FI_Format.BMP ) then
		      dim p As Picture = Picture.Open(ftmp)
		      ftmp.Delete
		      'RaiseEvent LeakPreview(p)
		      return p
		    end if
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadPicFile(f As FolderItem) As String
		  Debug("Load file: " + f.AbsolutePath)
		  Dim p As Picture
		  Debug("Reading...")
		  If f.Length > 1048576 Then //1MB
		    Loading.ShowMe("Loading file", f.Name)
		    Try
		      p = Picture.Open(f)
		    Catch
		      Debug("Not a picture file!")
		    End Try
		    Loading.Close
		  Else
		    p = Picture.Open(f)
		  End If
		  Debug("Nothing broke, so it must be a picture file.")
		  Dim sf As New StackFrame(p)
		  sf.Key = f.Name
		  Icons.Value(sf.Key) = sf
		  Return sf.Key
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NotifyDataLoss(Message As String) As Boolean
		  Debug("Whoops!")
		  Static lossWin As New ExpectedExceptions
		  Dim b As Boolean = lossWin.ShowMe(Message)
		  MainWindow.Error = True
		  'Supervisor.Intercede()
		  Return b
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Untitled()
		  'Debug("Palettizer thread running: " + Str(Me.ThreadID))
		  'Dim cols As New Dictionary
		  'For X As Integer = 0 To Pic.Width
		  'For Y As Integer = 0 To Pic.Height
		  'cols.Value(Pic.RGBSurface.Pixel(X, Y)) = 1
		  'Next
		  'Next
		  'Dim col() As Integer
		  '
		  'For Each Key As Variant In cols.Keys
		  'col.Append(Key.IntegerValue)
		  'Next
		  'col.Sort
		  '
		  '
		  'Pic = New Picture(Sqrt(UBound(col)) * 10, Sqrt(UBound(col)) * 10, 32)
		  'For X As Integer = 0 To Pic.Width Step 10
		  'For Y As Integer = 0 To Pic.Height Step 10
		  'If UBound(col) = -1 Then Exit For X
		  'Pic.Graphics.ForeColor = col(0).IntToColor
		  'col.Remove(0)
		  'Pic.Graphics.FillRect(X, Y, 10, 10)
		  'Next
		  'Next
		  '
		  'Dim sf As New StackFrame(Pic)
		  'AddStackFrame(sf)
		  '
		  'Debug("Palettizer thread done: " + Str(Me.ThreadID))
		  'If Finish <> Nil Then Finish.Invoke(sf.Key)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UUID() As String
		  'Debug("Request UUID")
		  dim strUUID As String
		  
		  Const RPC_S_UUID_LOCAL_ONLY = 1824
		  Const RPC_S_UUID_NO_ADDRESS = 1739
		  
		  Declare Function RpcStringFree Lib "Rpcrt4" Alias "RpcStringFreeW" (Addr As Ptr) As Integer
		  Declare Function UuidCreate Lib "Rpcrt4" (Uuid As Ptr) As Integer
		  Declare Function UuidToString Lib "Rpcrt4" Alias "UuidToStringW" (Uuid As Ptr, byref p as ptr) As Integer
		  
		  static mb As new MemoryBlock( 16 * 2)
		  dim status As Integer = UuidCreate( mb ) //can compare to RPC_S_UUID_LOCAL_ONLY and RPC_S_UUID_NO_ADDRESS for more info
		  Call status.IntToColor
		  static ptrUUID As new MemoryBlock( 16 * 2)
		  
		  dim ppAddr As ptr
		  call UuidToString( mb, ppAddr )
		  
		  dim mb2 As MemoryBlock = ppAddr
		  strUUID = mb2.WString(0)
		  
		  call RpcStringFree( ptrUUID )
		  
		  'strUUID = ConvertEncoding(strUUID, Encodings.UTF16)
		  'Debug("Got " + strUUID)
		  Return strUUID
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim func As String
			  #if TargetWin32
			    func = "_FreeImage_GetVersion@0"
			  #else
			    func = "FreeImage_GetVersion"
			  #endif
			  
			  Return System.IsFunctionAvailable( func, "FreeImage" )
			End Get
		#tag EndGetter
		FreeImageAvailable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mHelpTopics = Nil Then
			    HelpTopics = New Dictionary( _
			    "Redo Viewer":"This window displays the contents of the redo stack. Each picture is one frame from the redo stack. You may replace the current canvas with a frame from the redo stack by double-clicking the frame or by clicking it and pressing the Enter key. Press the Escape key or the close button to close the window without replacing the canvas.", _
			    "Undo Viewer":"This window displays the contents of the undo stack. Each picture is one frame from the undo stack. You may replace the current canvas with a frame from the undo stack by double-clicking the frame or by clicking it and pressing the Enter key. Press the Escape key or the close button to close the window without replacing the canvas.", _
			    "Main":"Welcome to Simple Paint, the fiercest competitor in the image-manipulation market since Microsoft Paint 2.0. " + EndOfLine + "The main drawing area is referred to as the 'Canvas' and you may use the mouse to draw lines and shapes on the canvas. The controls at the bottom of the main screen affect the color, pen size, and drawing mode of the Canvas. Available Drawing modes:" + EndOfLine + "Freeform, Rectangle, Oval, Dot, and Flood Fill.", _
			    "Main.Canvas":"This is the main drawing area. You may draw upon it simply by clicking and dragging the mouse.", _
			    "Main.Color Selector":"This is the color selector. Click a color to use it.", _
			    "Main.Current Color":"This is current color of your paint brush", _
			    "Main.Mode Button":"These buttons control the drawing mode. Available Drawing modes:" + EndOfLine + "Freeform, Rectangle, Oval, Dot, and Flood Fill.", _
			    "Main.Mode Button 1":"Draws the outline of a circle or ovalbac", _
			    "Main.Mode Button 2":"These buttons control the drawing mode. Available Drawing modes:" + EndOfLine + "Freeform, Rectangle, Oval, Dot, and Flood Fill.", _
			    "Main.Mode Button 3":"These buttons control the drawing mode. Available Drawing modes:" + EndOfLine + "Freeform, Rectangle, Oval, Dot, and Flood Fill.", _
			    "Main.Mode Button 4":"These buttons control the drawing mode. Available Drawing modes:" + EndOfLine + "Freeform, Rectangle, Oval, Dot, and Flood Fill.", _
			    "Main.Mode Button 5":"These buttons control the drawing mode. Available Drawing modes:" + EndOfLine + "Freeform, Rectangle, Oval, Dot, and Flood Fill.", _
			    "Main.Mode Button 6":"These buttons control the drawing mode. Available Drawing modes:" + EndOfLine + "Freeform, Rectangle, Oval, Dot, and Flood Fill.", _
			    "Main.Mode Button 7":"These buttons control the drawing mode. Available Drawing modes:" + EndOfLine + "Freeform, Rectangle, Oval, Dot, and Flood Fill.", _
			    "Main.Mode Button 8":"These buttons control the drawing mode. Available Drawing modes:" + EndOfLine + "Freeform, Rectangle, Oval, Dot, and Flood Fill.", _
			    "Main.Mode Button 0":"Flood fill: fills a region of the canvas with the currently selected color.", _
			    "Main.Pen Size":"Controls the width and height of the brush, in pixels.", _
			    "Main.Help":"Click a control to see its help text, if any. Press Escape to leave help mode.")
			  End If
			  
			  return mHelpTopics
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mHelpTopics = value
			End Set
		#tag EndSetter
		HelpTopics As Dictionary
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		MagOn As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		MainWindow As PaintWindow
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHelpSelectMode As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHelpTopics As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		SuppressError As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Version As String = """0.05"""
	#tag EndProperty


	#tag Structure, Name = XYZ, Flags = &h0
		X As Integer
		  Y As Integer
		Z As Integer
	#tag EndStructure


	#tag ViewBehavior
		#tag ViewProperty
			Name="FreeImageAvailable"
			Group="Behavior"
			Type="Boolean"
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
			Name="MagOn"
			Group="Behavior"
			Type="Boolean"
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
			Name="SuppressError"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Version"
			Group="Behavior"
			InitialValue="""""0.05"""""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
