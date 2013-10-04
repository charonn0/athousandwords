#tag Module
Protected Module GlobalHelpers
	#tag Method, Flags = &h0
		Function CaptureScreen() As Picture
		  //Calls GetPartialScreenShot with a rectangle comprising all of the desktop rectangle. Returns a Picture
		  
		  #If TargetWin32 Then 
		    Dim ScreenVirtualHeight, ScreenVirtualWidth As Integer
		    ScreenVirtualHeight = Win32.User32.GetSystemMetrics(79)
		    ScreenVirtualWidth = Win32.User32.GetSystemMetrics(78)
		    Return WinLib.GUI.CaptureRect(0, 0, ScreenVirtualWidth, ScreenVirtualHeight)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentUser() As String
		  //Returns the username of the account under which the application is running.
		  //On Error, returns an empty string
		  //Do not use this function to determine if the user is the Administrator. Use IsAdmin instead.
		  
		  #If TargetWin32 Then
		    Dim mb As New MemoryBlock(0)
		    Dim nmLen As Integer = mb.Size
		    Call Win32.AdvApi32.GetUserName(mb, nmLen)
		    mb = New MemoryBlock(nmLen * 2)
		    nmLen = mb.Size
		    If Win32.AdvApi32.GetUserName(mb, nmLen) Then
		      Return mb.WString(0)
		    Else
		      Return ""
		    End If
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IntToColor(extends c as Integer) As Color
		  //From WFS, converts an Integer to a Color
		  
		  Dim mb as new MemoryBlock(4)
		  mb.Long(0) = c
		  Return RGB(mb.Byte(0), mb.Byte(1), mb.Byte(2))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ListWindows(PartialTitle As String = "") As WindowRef()
		  Dim wins() As WindowRef
		  Dim ret as integer
		  ret = Win32.User32.FindWindow(Nil, Nil)
		  Dim hidden() As String = Split("MSCTFIME UI,Default IME,Jump List,Start Menu,Start,Program Manager", ",")
		  while ret > 0
		    Dim pw As New WindowRef(ret)
		    If pw.Text.Trim <> "" And hidden.IndexOf(pw.Text.Trim) <= -1 And pw.Visible Then
		      If PartialTitle.Trim = "" Or InStr(pw.Text, PartialTitle) > 0 Then
		        wins.Append(pw)
		      End If
		    End If
		    ret = Win32.User32.GetWindow(ret, GW_HWNDNEXT)
		  wend
		  Return wins
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadPicFile(f As FolderItem) As String
		  'Debug("Load file: " + f.AbsolutePath)
		  Dim p As Picture
		  'Debug("Reading...")
		  If f.Length > 1048576 Then //1MB
		    Try
		      p = Picture.Open(f)
		    Catch
		      'Debug("Not a picture file!")
		    End Try
		  Else
		    p = Picture.Open(f)
		  End If
		  'Debug("Nothing broke, so it must be a picture file.")
		  Dim sf As New StackFrame(p)
		  sf.Key = f.Name
		  Icons.Value(sf.Key) = sf
		  Return sf.Key
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LockFile(lockedFile As FolderItem) As Integer
		  //Locks the file for exclusive use. You must call UnlockFile with the integer returned from this function to unlock the file.
		  //A positive return value is returned on success, 0 if lockedFile is Nil, and a negative number on error (a negative return value
		  //is actually the last Win32 error multiplied by -1. So, for example, -5 is ERROR_ACCESS_DENIED.)
		  //
		  //Once the file is locked you can pass the integer from this function to the constructor methods of the TextInputStream, TextOutputStream,
		  //and BinaryStream classes:
		  '
		  '    Dim file As FolderItem = GetFolderItem("C:\boot.ini")
		  '    Dim fhandle As Integer = f.LockFile
		  '    Dim tis As TextInputStream = New TextInputStream(fhandle, TextInputStream.HandleTypeWin32Handle
		  '
		  //Just as handy, the Close methods of each Stream class will also release the lock.
		  
		  #If TargetWin32 Then
		    If lockedFile = Nil Then Return 0
		    
		    Dim fHandle As Integer = Win32.Kernel32.CreateFile(lockedFile.AbsolutePath, GENERIC_READ Or GENERIC_WRITE, FILE_SHARE_READ, 0, OPEN_EXISTING, 0, 0)
		    If fHandle > 0 Then
		      If Win32.Kernel32.LockFile(fHandle, 0, 0, 1, 0) Then
		        Return fHandle   //You MUST keep this return value if you want to unlock the file later!!!
		      Else
		        Return WinLib.GetLastError * -1
		      End If
		    Else
		      Return WinLib.GetLastError * -1
		    End If
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NotifyDataLoss(Message As String) As Boolean
		  'Debug("Whoops!")
		  'Static lossWin As New ExpectedExceptions
		  'Dim b As Boolean = lossWin.ShowMe(Message)
		  'MainWindow.Error = True
		  ''Supervisor.Intercede()
		  'Return b
		  Call MsgBox(Message, 16, "Editor Error")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Rotate(Extends Pic As Picture, Degrees As Double, Mask As Picture = Nil) As Picture
		  //Rotates the passed Picture counter-clockwise the number of degrees specified around its center.
		  //Optionally, pass a mask which will also be rotated and then applied to the returned Picture object.
		  
		  Dim px As New PixmapShape(Pic)
		  px.X = (Pic.Width * 0.5) - 2
		  px.Y = (Pic.Height * 0.5) - 2
		  px.Rotation = Degrees / 57.2958 //Degrees to radians
		  Dim p As New Picture(px.SourceWidth, Px.SourceHeight, Pic.Depth)
		  p.Graphics.DrawObject(px)
		  
		  //Rotate and apply the mask if it exists
		  If Mask <> Nil Then p.ApplyMask(Mask.Rotate(Degrees))
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Scale(Source As Picture, Ratio As Double = 1.0) As Picture
		  //Returns a scaled version of the passed Picture object.
		  //A ratio of 1.0 is 100% (no change,) 0.5 is 50% (half size) and so forth.
		  //This function should be cross-platform safe.
		  
		  Dim wRatio, hRatio As Double
		  wRatio = (Ratio * Source.width)
		  hRatio = (Ratio * Source.Height)
		  If wRatio = Source.Width And hRatio = Source.Height Then Return Source
		  Dim photo As New Picture(wRatio, hRatio, Source.Depth)
		  Photo.Graphics.DrawPicture(Source, 0, 0, Photo.Width, Photo.Height, 0, 0, Source.Width, Source.Height)
		  Return photo
		  
		Exception
		  Return Source
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Shorten(Extends data As String, maxLength As Integer = 45) As String
		  //Replaces characters from the middle of a string with a single ellipsis ("...") until data.Len is less than the specified length.
		  //Useful for showing long paths by omitting the middle part of the data, though not limited to this use.
		  
		  If data.Len <= maxLength then
		    Return data
		  Else
		    Dim shortdata, snip As String
		    Dim start As Integer
		    shortdata = data
		    
		    While shortdata.len > maxLength
		      start = shortdata.Len / 3
		      snip = mid(shortdata, start, 5)
		      shortdata = Replace(shortdata, snip, "...")
		    Wend
		    Return shortdata
		  End If
		  
		Exception err
		  If err IsA EndException Or Err IsA ThreadEndException Then Raise Err
		  Return data
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowInExplorer(extends f As FolderItem)
		  //Shows the file in Windows Explorer
		  
		  #If TargetWin32 Then
		    Dim param As String = "/select, """ + f.AbsolutePath + """"
		    Call Win32.Shell32.ShellExecute(0, "open", "explorer", param, "", SW_SHOW)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextToPicture(Text As String, TextSize As Integer, BaseColor As Color, TextFont As String) As Picture
		  Dim lines() As Picture
		  Dim requiredHeight, requiredWidth As Integer
		  Dim tlines() As String = Split(Text, EndOfLine)
		  
		  For i As Integer = 0 To UBound(tlines)
		    Try
		      Dim p As New Picture(250, 250)
		      p.Graphics.TextFont = TextFont
		      p.Graphics.TextSize = TextSize
		      Dim nm As String = tlines(i)
		      Dim strWidth, strHeight As Integer
		      strWidth = p.Graphics.StringWidth(nm) + 5
		      strHeight = p.Graphics.StringHeight(nm, strWidth)
		      p = New Picture(strWidth, strHeight)
		      p.Graphics.ForeColor = BaseColor
		      p.Graphics.TextFont = TextFont
		      p.Graphics.TextSize = TextSize
		      p.Graphics.DrawString(nm, 1, ((p.Height/2) + (strHeight/4)))
		      lines.Append(p)
		      requiredHeight = requiredHeight + p.Height
		      If p.Width > requiredWidth Then requiredWidth = p.Width
		    Catch NilObjectException
		      Continue
		    End Try
		  Next
		  Dim txtBuffer As Picture
		  txtBuffer = New Picture(requiredWidth, requiredHeight)
		  txtBuffer.Graphics.ForeColor = &cFFFFFF55
		  txtBuffer.Graphics.FillRect(0, 0, txtBuffer.Width, txtBuffer.Height)
		  Dim x, y As Integer
		  For i As Integer = 0 To UBound(lines)
		    txtBuffer.Graphics.DrawPicture(lines(i), x, y)
		    y = y + lines(i).Height
		  Next
		  Return txtBuffer
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Tokenize(Input As String) As String()
		  //Returns a String array containing the space-delimited members of the Input string.
		  //Like `Split` but honoring quotes; good for command line arguments and other parsing.
		  //For example, this string:
		  '                     MyApp.exe --foo "C:\My Dir\"
		  //Would become:
		  '                     s(0) = MyApp.exe
		  '                     s(1) = --foo
		  '                     s(2) = "C:\My Dir\"
		  
		  
		  #If TargetWin32 Then
		    Dim ret() As String
		    Dim cmdLine As String = Input
		    While cmdLine.Len > 0
		      Dim tmp As String
		      Dim args As String = Win32.Shlwapi.PathGetArgs(cmdLine)
		      If Len(args) = 0 Then
		        tmp = ReplaceAll(cmdLine.Trim, Chr(34), "")
		        ret.Append(tmp)
		        Exit While
		      Else
		        tmp = Left(cmdLine, cmdLine.Len - args.Len).Trim
		        tmp = ReplaceAll(tmp, Chr(34), "")
		        ret.Append(tmp)
		        cmdLine = args
		      End If
		    Wend
		    Return ret
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function UnlockFile(fHandle As Integer) As Boolean
		  //See the LockFile function
		  #If TargetWin32 Then
		    If Win32.Kernel32.UnlockFile(fHandle, 0, 0, 1, 0) Then
		      Call Win32.Kernel32.CloseHandle(fHandle)
		      Return True
		    End If
		  #endif
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
		Version As String = "1.0"
	#tag EndProperty


	#tag Structure, Name = XYZ, Flags = &h0
		X As Integer
		  Y As Integer
		Z As Integer
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
