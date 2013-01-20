#tag Class
Protected Class StackFrame
	#tag Method, Flags = &h0
		Sub Constructor(p As Picture)
		  Key = UUID()
		  ThePicture = p
		  Dim d As New Date
		  TimeStamp = d.TotalSeconds
		  'Debug("Created StackFrame: " + Key)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  ThePicture = Nil
		  Unlock()
		  SpecialFolder.Temporary.Child("A Thousand Words").Child(Key).Delete
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Lock(f As FolderItem)
		  If LockToken <> 0 Then Return
		  LockToken = LockFile(f)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Unlock()
		  If LockToken = 0 Then Return
		  If UnlockFile(LockToken) Then
		    LockToken = 0
		  End If
		End Sub
	#tag EndMethod


	#tag Note, Name = Notes
		This class implements a single "stack frame" used by the StackFrame manager.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Paged Then
			    Unlock()
			    Dim f As FolderItem = SpecialFolder.Temporary.Child("A Thousand Words").Child(Key)
			    ThePicture = Picture.Open(f)
			    Paged = False
			    f.Delete
			  End If
			  Dim d As New Date
			  TimeStamp = d.TotalSeconds
			  return ThePicture
			  
			  
			End Get
		#tag EndGetter
		Data As Picture
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Delete As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Key As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Large As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LockToken As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPaged As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mThumbnail As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		Pageable As Boolean = True
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mPaged
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    ThePicture = Nil
			    Lock(SpecialFolder.Temporary.Child("A Thousand Words").Child(Key))
			  End If
			  mPaged = value
			End Set
		#tag EndSetter
		Paged As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private ThePicture As Picture
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThumbnail = Nil Then mThumbnail = Iconize(Me.Data)
			  return mThumbnail
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mThumbnail = value
			End Set
		#tag EndSetter
		Thumbnail As Picture
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		TimeStamp As UInt64
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Data"
			Group="Behavior"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Delete"
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
			Name="Key"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Large"
			Group="Behavior"
			Type="Integer"
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
			Name="Pageable"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Paged"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Thumbnail"
			Group="Behavior"
			Type="Picture"
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
