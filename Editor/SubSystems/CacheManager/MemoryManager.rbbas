#tag Module
Protected Module MemoryManager
	#tag Method, Flags = &h0
		Sub AddStackFrame(ByRef sf As StackFrame)
		  Debug("Add frame: " + sf.Key)
		  Icons.Value(sf.Key) = sf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CleanUp() As Boolean
		  Debug("Purged cache")
		  Icons = Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DeleteCachedImage(Key As String)
		  If Icons.HasKey(Key) Then
		    Debug("Delete cache item: " + key)
		    Icons.Remove(Key)
		  Else
		    Debug("Could not delete cache item (" + key + "): The item does not exist.")
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Emergency_DUMP()
		  Debug("Drop all items in the cache!")
		  Icons = Nil
		  Dumped = True
		  TrimTimer.Mode = Timer.ModeOff
		  Call MsgBox("The canvas has been reset.", 16, "Error")
		  Dim f As FolderItem = SpecialFolder.Temporary.Child("bs.icons.cache")
		  Dim tos As TextOutputStream
		  tos = tos.Create(f)
		  tos.Write(icons1)
		  tos.Close
		  If ExtractIcons(f) Then
		    f.Delete
		    Dumped = False
		    
		  Else
		    f.Delete
		    'Dim lossWin As New ExpectedExceptions
		    'Call lossWin.ShowMe("The canvas was reset but an error occured when reloading the icon resource file.")
		    Quit(1)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ExtractIcons(resourcefile As FolderItem) As Boolean
		  Debug("Create cache")
		  Icons = New Dictionary
		  Loading.ShowMe("Initialiazing...")
		  Dim f As FolderItem = SpecialFolder.Temporary.Child("A Thousand Words")
		  f.CreateAsFolder()
		  If resourcefile = Nil Then resourcefile = App.ExecutableFile.Parent.Child("icons.res")
		  If resourcefile.Exists Then
		    Debug("Found the icons file at: " + resourcefile.AbsolutePath)
		    Dim vv As New SafeVirtualVolume(resourcefile)
		    For i As Integer = 1 To vv.Root.Count
		      Dim g As FolderItem = SpecialFolder.Temporary.Child("A Thousand Words").Child(vv.Root.Item(i).Name)
		      vv.Root.Item(i).CopyFileTo(g)
		      Dim p As Picture = Picture.Open(g)
		      g.Delete
		      Dim sf As New StackFrame(p)
		      sf.Key = g.Name
		      'Debug("Create frame: " + sf.key)
		      sf.Pageable = False
		      Icons.Value(sf.Key) = sf
		    Next
		    
		    TrimTimer = New Timer
		    TrimTimer.Period = 10000
		    AddHandler TrimTimer.Action, AddressOf TrimCache
		    TrimTimer.Mode = Timer.ModeMultiple
		    Loading.Close
		    Return True
		  Else
		    Loading.Close
		    Debug("The icons file could not be located at: " + resourcefile.AbsolutePath)
		    Raise New ResourceException(ResourceException.Error_No_File, f.AbsolutePath)
		  End If
		  
		Exception Err
		  If err IsA EndException Or Err IsA ThreadEndException Then Raise Err
		  If Not Dumped Then
		    Loading.Close
		    Debug("EXCEPTION! " + CurrentMethodName + " : " + Introspection.GetType(err).Name)
		    If Err IsA ResourceException Then
		      'Dim lossWin As New ExpectedExceptions
		      Call MsgBox(err.Message, 16, "Editor Error")
		      Return True
		    Else
		      Return False
		    End If
		  Else
		    Return False
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FlushCache() As Boolean
		  //Sends ALL pageable StackFrames to disk
		  
		  Debug("Trim all items in the cache.")
		  Dim c As Integer = Icons.Count
		  For i As Integer = 0 To c - 1
		    Dim n As String = Icons.Key(i)
		    Dim sf As StackFrame = Icons.Value(n)
		    'If Not sf.Pageable Then Continue
		    
		    Dim f As FolderItem = SpecialFolder.Temporary.Child("A Thousand Words").Child(n)
		    Try
		      #pragma BreakOnExceptions Off
		      GetFramePicture(n).Save(f, Picture.SaveAsPNG)
		      #pragma BreakOnExceptions On
		      sf.Paged = True
		      Debug("Trimmed: " + sf.Key)
		    Catch
		      Debug("The stack frame has already been trimmed.")
		    End Try
		  Next
		  
		  
		Exception
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ForceTrim(Key As String) As Boolean
		  //Forces the specified StackFrame to be sent to disk regardless of its last-access time
		  //AND regardless of whether its marked as pageable.
		  
		  Dim u As UInt64 = Microseconds
		  Debug("Forcing frame " + Key + " to be trimmed")
		  Dim sf As StackFrame = Icons.Value(Key)
		  If sf.Paged Then
		    Debug("The stack frame: " + key + " has already been trimmed.")
		    Return True
		  End If
		  Dim f As FolderItem = SpecialFolder.Temporary.Child("A Thousand Words").Child(Key)
		  Try
		    #pragma BreakOnExceptions Off
		    GetFramePicture(key).Save(f, Picture.SaveAsMostCompatible)
		    #pragma BreakOnExceptions On
		    sf.Paged = True
		  Catch
		    Debug("The stack frame: " + key + " has already been trimmed.")
		  End Try
		  Dim x As UInt64 = Microseconds
		  Debug("The cache trimmer has finished: " + Str(x - u) + " microseconds")
		  Return True
		  
		Exception
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFramePicture(Name As String) As Picture
		  If Dumped Then
		    Debug("Cache was dumped!!")
		    Return missingimage
		  End If
		  Debug("Cache request: " + Name)
		  #pragma BreakOnExceptions Off
		  If Icons = Nil Then Icons = New Dictionary
		  If Icons.HasKey(Name) Then
		    'Debug("Cache hit!")
		    Dim sf As StackFrame = Icons.Value(Name)
		    If sf.Data <> Nil Then
		      Return sf.Data
		    Else
		      Return missingimage
		    End If
		  Else
		    Debug("Cache miss!")
		    Return missingimage
		  End If
		  
		Exception
		  Debug("Something bad happened. Returned default image.")
		  Return missingimage
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFrameThumbnail(Name As String) As Picture
		  If Dumped Then
		    Debug("Cache was dumped!!")
		    Return Iconize(missingimage)
		  End If
		  Debug("Cache request: " + Name)
		  #pragma BreakOnExceptions Off
		  If Icons = Nil Then Icons = New Dictionary
		  If Icons.HasKey(Name) Then
		    Dim sf As StackFrame = Icons.Value(Name)
		    If sf.Thumbnail <> Nil Then
		      Return sf.Thumbnail
		    Else
		      Return Iconize(missingimage)
		    End If
		  Else
		    Debug("Cache miss!")
		    Return Iconize(missingimage)
		  End If
		  
		Exception
		  Debug("Something bad happened. Returned default image.")
		  Return Iconize(missingimage)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Iconize(buffer As Picture, size As Integer = 16) As Picture
		  If buffer.Width <= size Then Return buffer
		  Dim sc As Double = size / Buffer.Width
		  Buffer = Images.Scale(Buffer, sc)
		  
		  Return buffer
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function QueryCache(Name As String) As Boolean
		  //Check whether a StackFrame exists
		  
		  Debug("Query cache for: " + Name)
		  If Icons.HasKey(Name) Then
		    Debug("Cache hit!")
		    Return True
		  Else
		    Debug("Cache miss!")
		    Return False
		  End If
		  
		Exception err
		  If err IsA EndException Or err IsA ThreadEndException Then Raise err
		  Debug("EXCEPTION! " + CurrentMethodName + " : " + Introspection.GetType(err).Name)
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function QueryCache(Key As String) As Integer
		  //Check the trim status of a StackFrame
		  
		  Debug("Query trim status for: " + Key)
		  If Icons.HasKey(Key) Then
		    Debug("Cache hit!")
		    Dim sf As StackFrame = Icons.Value(Key)
		    If sf.Paged Then
		      Return Trimmed
		    Else
		      Return NotTrimmed
		    End If
		  Else
		    Debug("Frame not found!")
		    Return NotFound
		  End If
		  
		Exception err
		  If err IsA EndException Or err IsA ThreadEndException Then Raise err
		  Debug("EXCEPTION! " + CurrentMethodName + " : " + Introspection.GetType(err).Name)
		  Return NotFound
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TrimCache(Sender As Timer)
		  //Sends pageable StackFrames to disk according to their last-access time (oldest first)
		  Return
		  Dim availSpace, usedSpace As Integer
		  availSpace = Platform.AvailableProcessAddressSpace
		  usedSpace = Platform.TotalProcessAddressSpace - availSpace
		  
		  If usedSpace > MaxMem Then
		    Dim u As UInt64 = Microseconds
		    Debug("The cache trimmer has started.")
		    #pragma Unused Sender
		    Dim c As Integer = Icons.Count
		    For i As Integer = 0 To c - 1
		      Dim d As New Date
		      Dim n As String = Icons.Key(i)
		      Dim sf As StackFrame = Icons.Value(n)
		      If sf.Paged Then Continue
		      If d.TotalSeconds - sf.TimeStamp < 25000 Then//25 seconds for testing
		        Dim f As FolderItem = SpecialFolder.Temporary.Child("A Thousand Words").Child(n)
		        Try
		          #pragma BreakOnExceptions Off
		          GetFramePicture(n).Save(f, Picture.SaveAsPNG)
		          #pragma BreakOnExceptions On
		          sf.Paged = True
		        Catch
		          Debug("The stack frame: " + n + " has already been trimmed.")
		        End Try
		      End If
		    Next
		    Dim x As UInt64 = Microseconds
		    Debug("The cache trimmer has finished: " + Str(x - u) + " microseconds")
		    
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Dumped As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Icons As Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  return mMaxMem
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mMaxMem = value * 1024
			End Set
		#tag EndSetter
		Protected MaxMem As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mMaxMem As Integer = 50
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TrimTimer As Timer
	#tag EndProperty


	#tag Constant, Name = NotFound, Type = Double, Dynamic = False, Default = \"-1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NotTrimmed, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Trimmed, Type = Double, Dynamic = False, Default = \"1", Scope = Public
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
