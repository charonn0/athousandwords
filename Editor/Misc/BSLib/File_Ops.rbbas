#tag Module
Protected Module File_Ops
	#tag Method, Flags = &h0
		Function GetDriveFileSystem(Drive As String) As String
		  Declare Function GetVolumeInformationW Lib "Kernel32" (path As WString, nameBuffer As Ptr, namebufferSize As Integer, Serialnumberbuff As Ptr, _
		  maxFilenamelen As Ptr, flags As Ptr, FSName As Ptr, FSNameSize As Integer) As Boolean
		  Dim name As New MemoryBlock(255)
		  Dim FSName As New MemoryBlock(255)
		  Call GetVolumeInformationW(Drive, name, name.Size, Nil, Nil, Nil, FSName, FSName.Size)
		  Return FSName.WString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDriveFreeSize(Drive As String) As UInt64
		  Declare Function GetDiskFreeSpaceExW Lib "Kernel32" (dirname As WString, ByRef freeBytesAvailable As UInt64, ByRef totalbytes As UInt64, _
		  ByRef totalFreeBytes As UInt64) As Boolean
		  
		  Dim drvRoot As String = Left(Drive, 1) + ":\"
		  Dim total, free, x As UInt64
		  Call GetDiskFreeSpaceExW(drvRoot, x, total, free)
		  
		  Return free
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDriveName(Drive As String) As String
		  Declare Function GetVolumeInformationW Lib "Kernel32" (path As WString, nameBuffer As Ptr, namebufferSize As Integer, Serialnumberbuff As Ptr, _
		  maxFilenamelen As Ptr, flags As Ptr, FSName As Ptr, FSNameSize As Integer) As Boolean
		  Dim name As New MemoryBlock(255)
		  Call GetVolumeInformationW(drive, name, name.Size, Nil, Nil, Nil, Nil, 0)
		  Return name.WString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDriveSize(Drive As String) As UInt64
		  Declare Function GetDiskFreeSpaceExW Lib "Kernel32" (dirname As WString, ByRef freeBytesAvailable As UInt64, ByRef totalbytes As UInt64, _
		  ByRef totalFreeBytes As UInt64) As Boolean
		  
		  Dim drvRoot As String = Left(Drive, 1) + ":\"
		  Dim total, free, x As UInt64
		  Call GetDiskFreeSpaceExW(drvRoot, x, total, free)
		  
		  Return total
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDriveType(Drive As String) As Integer
		  Declare Function GetDriveTypeW Lib "Kernel32" (path As WString) As UInt32
		  Return GetDriveTypeW(Drive)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetFileAttributes(f As FolderItem) As Integer
		  Declare Function GetFileAttributesW Lib "Kernel32" (path As WString) As Integer
		  Return GetFileAttributesW(f.AbsolutePath)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetFileInfo()
		  //TODO
		  'Declare Function GetFileInformationByHandleEx Lib "Kernel32" (HWND As Integer, infoClass As Integer, ByRef buffer As FILE_STREAM_INFO, buffSize As Integer) As Boolean
		  'Declare Function CloseHandle Lib "Kernel32"(HWND As Integer) As Boolean
		  'Declare Function CreateFileW Lib "Kernel32"(name As WString, access As Integer, sharemode As Integer, SecAtrribs As Integer, _
		  'CreateDisp As Integer, flags As Integer, template As Integer) As Integer
		  'Declare Function GetLastError Lib "Kernel32" () As Integer
		  '
		  'Const GENERIC_READ = &h80000000
		  'Const OPEN_EXISTING = 3
		  'Const FILE_SHARE_READ = &h00000001
		  'Const FILE_READ_ACCESS = &h0001
		  'Dim f As FolderItem = GetFolderItem("C:\Users\Andrew\Desktop\Work\1010 Rent roll.xlsx")
		  'Dim HWND As Integer = CreateFileW(f.AbsolutePath, GENERIC_READ, FILE_SHARE_READ, 0, OPEN_EXISTING, 0, 0)
		  'If HWND = -1 Then
		  'HWND = GetLastError()
		  'Break
		  'End If
		  'Dim mb As FILE_STREAM_INFO
		  'If GetFileInformationByHandleEx(HWND, 7, mb, mb.Size) Then
		  'Break
		  'Else
		  'Dim x As Integer = GetLastError()
		  'Break
		  'End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetShortName(Extends target As FolderItem) As String
		  //Same thing as FolderItem.ShellPath
		  Declare Function GetShortPathNameW Lib "Kernel32" (longName As WString, shortName As Ptr, buffSize As Integer) As Integer
		  
		  Dim mb As New MemoryBlock(1024)
		  Call GetShortPathNameW(target.AbsolutePath, mb, mb.Size)
		  Return mb.Wstring(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isAccessible(Extends f As FolderItem) As Integer
		  //Returns 0 if the file exists and is Readable
		  //Return 1, 2 or 3 for errors. See the Constants for these errors
		  
		  Declare Function CloseHandle Lib "Kernel32"(HWND As Integer) As Boolean
		  Declare Function CreateFileW Lib "Kernel32"(name As WString, access As Integer, sharemode As Integer, SecAtrribs As Integer, _
		  CreateDisp As Integer, flags As Integer, template As Integer) As Integer
		  
		  Const GENERIC_READ = &h80000000
		  Const OPEN_EXISTING = 3
		  Const FILE_SHARE_READ = &h00000001
		  Const FILE_READ_ACCESS = &h0001
		  
		  Dim HWND As Integer = CreateFileW(f.AbsolutePath, GENERIC_READ, FILE_SHARE_READ, 0, OPEN_EXISTING, 0, 0)
		  If HWND = -1 Then
		    HWND = Platform.LastErrorCode
		    Select Case HWND
		    Case 5
		      Return ACCESS_DENIED
		    Case 2
		      Return FILE_NOT_FOUND
		    Else
		      Return ERROR_OTHER
		    End Select
		    
		  Else
		    Call CloseHandle(HWND)
		    Return ERROR_NO_ERROR
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Launch(extends f as FolderItem, ParamArray args as String)
		  //Same as FolderItem.Launch
		  Declare Sub ShellExecuteW Lib "Shell32"(hwnd as Integer, operation as WString, file as WString, params as WString, _
		  directory as WString, show as Integer)
		  
		  Dim params as String
		  params = Join( args, " " )
		  ShellExecuteW( 0, "open", f.AbsolutePath, params, "", 1 )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LockFile(Extends lockedFile As FolderItem) As Integer
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
		      Return Platform.LastErrorCode * -1
		    End If
		  Else
		    Return Platform.LastErrorCode * -1
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowInExplorer(extends f As FolderItem)
		  //Shows the file in Windows Explorer
		  
		  Dim param As String = "/select, """ + f.AbsolutePath + """"
		  Soft Declare Sub ShellExecuteW Lib "Shell32" (hwnd As Integer, op As WString, file As WString, params As WString, directory As Integer, _
		  cmd As Integer)
		  
		  Const SW_SHOW = 5
		  ShellExecuteW(0, "open", "explorer", param, 0, SW_SHOW)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UnlockFile(fHandle As Integer) As Boolean
		  //See the LockFile function
		  
		  Declare Function myUnlockFile Lib "kernel32" Alias "UnlockFile" (ByVal hFile As integer, ByVal dwFileOffsetLow As integer, ByVal dwFileOffsetHigh As integer, _
		  ByVal nNumberOfBytesToUnlockLow As integer, ByVal nNumberOfBytesToUnlockHigh As integer) As Boolean
		  Declare Function CloseHandle Lib "kernel32" (ByVal hObject As integer) As Integer
		  
		  Dim ret As Boolean = myUnlockFile(fHandle, 0, 0, 1, 0)
		  Call CloseHandle(fHandle)
		  
		  Return ret
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VersionInfo(Extends f As FolderItem) As Dictionary
		  //Returns the VersionInfo headers of a Windows executable in a Dictionary object.
		  //On error, or if the file does not have VersionInfo embedded or does not exist, Returns Nil
		  //Some fields may not be present.
		  
		  If f = Nil Then Return Nil
		  If Not f.Exists Then Return Nil
		  
		  Declare Function GetFileVersionInfoSizeW Lib "Version" (fileName As WString, ignored As Integer) As Integer
		  Declare Function GetFileVersionInfoW Lib "Version" (fileName As WString, ignored As Integer, bufferSize As Integer, buffer As Ptr) As Boolean
		  Declare Function VerQueryValueW Lib "Version" (inBuffer As Ptr, subBlock As WString, outBuffer As Ptr, ByRef outBufferLen As Integer) As Boolean
		  
		  Dim infoSize As Integer = GetFileVersionInfoSizeW(f.AbsolutePath, 0)
		  If infoSize <= 0 Then Return Nil
		  
		  Dim buff As New MemoryBlock(infoSize)
		  If GetFileVersionInfoW(f.AbsolutePath, 0, buff.Size, buff) Then
		    Dim mb As New MemoryBlock(4)
		    Dim retBuffLen As Integer
		    If VerQueryValueW(buff, "\VarFileInfo\Translation", mb, retBuffLen) Then
		      Dim fields() As String = Split("Comments;InternalName;ProductName;CompanyName;LegalCopyright;ProductVersion;FileDescription;LegalTrademarks;PrivateBuild;FileVersion;OriginalFilename;SpecialBuild", ";")
		      Dim j, k As String
		      j = Hex(mb.Ptr(0).Int16Value(0))
		      k = Hex(mb.Ptr(0).Int16Value(2))
		      Dim langCode As String = Left("0000", 4 - Len(j)) + j + Left("0000", 4 - Len(k)) + k
		      Dim ret As New Dictionary
		      For Each datum As String In fields
		        mb = New MemoryBlock(4)
		        If VerQueryValueW(buff, "\StringFileInfo\" + langCode + "\" + datum, mb, retBuffLen) Then
		          ret.Value(datum) = mb.Ptr(0).WString(0)
		        End If
		      Next
		      Return ret
		    Else
		      Return Nil
		    End If
		  Else
		    Return Nil
		  End If
		End Function
	#tag EndMethod


	#tag Constant, Name = ACCESS_DENIED, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ERROR_NO_ERROR, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ERROR_OTHER, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FILE_NOT_FOUND, Type = Double, Dynamic = False, Default = \"2", Scope = Public
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
