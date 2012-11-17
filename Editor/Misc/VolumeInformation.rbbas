#tag Class
Protected Class VolumeInformation
	#tag Method, Flags = &h0
		Sub Constructor(s As String)
		  Type = GetDriveType(s)
		  Select Case Me.Type
		  Case Fixed
		    Filesystem = GetDriveFileSystem(s)
		    FreeBytes = GetDriveFreeSize(s)
		    Totalbytes = GetDriveSize(s)
		    Mounted = True
		    Name = GetDriveName(s)
		    Path = s
		  Case CDROM
		    If GetDriveFileSystem(s) <> "" Then
		      Filesystem = GetDriveFileSystem(s)
		      FreeBytes = GetDriveFreeSize(s)
		      Totalbytes = GetDriveSize(s)
		      Mounted = True
		      Name = GetDriveName(s)
		      Path = s
		    Else
		      Filesystem = "None"//"(No Disk)"
		      FreeBytes = 0
		      Totalbytes = 0
		      Mounted = False
		      Name = "(Optical Drive)"
		      Path = s
		    End If
		  Case Removable
		    If GetDriveFileSystem(s) <> "" Then
		      If DriveType(s) = BusUSB Then
		        Filesystem = GetDriveFileSystem(s)
		        FreeBytes = GetDriveFreeSize(s)
		        Totalbytes = GetDriveSize(s)
		        Mounted = True
		        Name = GetDriveName(s)
		        Name = Name + "(USB)"
		        Path = s
		        
		      Else
		        Filesystem = GetDriveFileSystem(s)
		        FreeBytes = GetDriveFreeSize(s)
		        Totalbytes = GetDriveSize(s)
		        Mounted = True
		        Name = GetDriveName(s)
		        Path = s
		      End If
		    Else
		      Filesystem = "None"//"(No Disk)"
		      FreeBytes = 0
		      Totalbytes = 0
		      Mounted = False
		      Name = "(Card Reader)"
		      Path = s
		    End If
		    
		  Case Network
		    Filesystem = "SMB"
		    FreeBytes = 0
		    Totalbytes = 0
		    Mounted = True
		    Name = "Network Volume"
		    Path = s
		    
		  Case NotMounted
		    Filesystem = "No Disk"
		    FreeBytes = 0
		    Totalbytes = 0
		    Mounted = False
		    Name = "No Disk"
		    Path = s
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DriveType(target As String) As Integer
		  //Returns an Integer corresponding to one of the Bus* constants (e.g. BusATA or BusUSB)
		  
		  Declare Function CreateFileW Lib "Kernel32"(name As WString, access As Integer, sharemode As Integer, SecAtrribs As Integer, CreateDisp As Integer, _
		  flags As Integer, template As Integer) As Integer
		  Declare Function DeviceIoControl Lib "kernel32"(hDevice As Integer, dwIoControlCode As Integer, lpInBuffer As Ptr, _
		  nInBufferSize As Integer, lpOutBuffer As Ptr, nOutBufferSize As Integer, lpBytesReturned As Ptr, lpOverlapped As Integer) As Integer
		  
		  Const GENERIC_READ = &h80000000
		  Const FILE_SHARE_READ = &h00000001
		  Const FILE_SHARE_WRITE = &h2
		  Const OPEN_EXISTING = 3
		  Const FILE_DEVICE_MASS_STORAGE = &h0000002d
		  Dim IO_CODE As Integer = Platform.CTL_CODE(FILE_DEVICE_MASS_STORAGE, &h0500, 0, 0)
		  
		  Dim drvRoot As String = "\\.\" + Left(target, 2)
		  
		  Dim drvHWND As Integer = CreateFileW(drvRoot, GENERIC_READ, FILE_SHARE_READ Or FILE_SHARE_WRITE, 0, OPEN_EXISTING, 0, 0)
		  Dim mb As New MemoryBlock(34)
		  Dim bRet As New MemoryBlock(4)
		  
		  If DeviceIoControl(drvHWND, IO_CODE, mb, mb.Size, mb, mb.Size, bRet, 0) <> 0 Then
		    Return mb.Byte(28)
		  Else
		    Return BusUnknown
		  End If
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Filesystem As String
	#tag EndProperty

	#tag Property, Flags = &h0
		FreeBytes As UInt64
	#tag EndProperty

	#tag Property, Flags = &h0
		Icon As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		Mounted As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Path As String
	#tag EndProperty

	#tag Property, Flags = &h0
		PercentFull As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		Totalbytes As UInt64
	#tag EndProperty

	#tag Property, Flags = &h0
		Type As Integer
	#tag EndProperty


	#tag Constant, Name = CDROM, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Fixed, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Network, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NotMounted, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Removable, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Filesystem"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Icon"
			Group="Behavior"
			Type="Picture"
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
			Name="Mounted"
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
			Name="Path"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PercentFull"
			Group="Behavior"
			Type="Double"
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
			Name="Type"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
