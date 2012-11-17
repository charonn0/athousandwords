#tag Class
Protected Class SafeVirtualVolume
	#tag Method, Flags = &h0
		Sub Close()
		  mroot = Nil
		  BackingFile = Nil
		  Tmp = Nil
		  VirtVolume = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  BackingFile = SpecialFolder.Temporary.Child("A Thousand Words").Child(UUID)
		  tmp = SpecialFolder.Temporary.Child("A Thousand Words").Child(UUID)
		  
		  VirtVolume = tmp.CreateVirtualVolume
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(f As FolderItem)
		  BackingFile = f
		  tmp = SpecialFolder.Temporary.Child(UUID)
		  Dim bsIN As BinaryStream
		  bsIN = bsIN.Open(BackingFile)
		  
		  Dim bsOUT As BinaryStream
		  bsOUT = bsOUT.Create(tmp)
		  
		  bsOUT.Write(bsIN.Read(bsIN.Length - 16))
		  Dim Hash As String = bsIN.Read(16)
		  bsIN.Close
		  bsOUT.Close
		  
		  If Not Verify(Hash) Then 
		    Raise New ResourceException(ResourceException.Error_Corrupt_Resource_File, f.AbsolutePath)
		  Else
		    VirtVolume = tmp.OpenAsVirtualVolume
		  End If
		  
		Exception err
		  
		  If err IsA EndException Or err IsA ThreadEndException Or err IsA ResourceException Then Raise err
		  
		  If err IsA IOException Then
		    Raise New ResourceException(ResourceException.Error_IO_Exception, CurrentMethodName)
		  Else
		    Raise New ResourceException(-1, "Error type: " + CurrentMethodName + "->" + Introspection.GetType(err).Name)
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  Me.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Flush()
		  VirtVolume.Flush
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save(SaveTo As FolderItem = Nil)
		  VirtVolume.Flush
		  VirtVolume = Nil
		  Dim bsIN As BinaryStream = BinaryStream.Open(tmp, True)
		  Dim hash As String = Crypto.Win32Crypto.Hash(bsIN.Read(bsIN.Length), Crypto.Win32Crypto.CALG_MD5)
		  bsIN.Position = bsIN.Length
		  bsIN.Write(hash)
		  bsIN.Close
		  If SaveTo = Nil Then SaveTo = BackingFile
		  tmp.MoveFileTo(SaveTo)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Verify(Hash As String) As Boolean
		  Dim bsOUT As BinaryStream
		  bsOUT = bsOUT.Open(tmp)
		  Dim tmphash As String = Crypto.Win32Crypto.Hash(bsOUT.Read(bsOUT.Length), Crypto.Win32Crypto.CALG_MD5)
		  bsOUT.Close
		  Return tmphash = Hash
		  'Return True
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private BackingFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mroot As FolderItem
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return VirtVolume.Root
			End Get
		#tag EndGetter
		root As FolderItem
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Tmp As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private VirtVolume As VirtualVolume
	#tag EndProperty


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
End Class
#tag EndClass
