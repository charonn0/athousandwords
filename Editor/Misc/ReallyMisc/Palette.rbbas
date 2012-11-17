#tag Class
Protected Class Palette
Inherits Thread
	#tag Event
		Sub Run()
		  Debug("Palettizer thread running: " + Str(Me.ThreadID))
		  Dim cols As New Dictionary
		  For X As Integer = 0 To Pic.Width
		    For Y As Integer = 0 To Pic.Height
		      cols.Value(Pic.RGBSurface.Pixel(X, Y)) = 1
		    Next
		  Next
		  Dim col() As Integer
		  
		  For Each Key As Variant In cols.Keys
		    col.Append(Key.IntegerValue)
		  Next
		  col.Sort
		  
		  
		  Pic = New Picture(Sqrt(UBound(col)) * 10, Sqrt(UBound(col)) * 10, 32)
		  For X As Integer = 0 To Pic.Width Step 10
		    For Y As Integer = 0 To Pic.Height Step 10
		      If UBound(col) = -1 Then Exit For X
		      Pic.Graphics.ForeColor = col(0).IntToColor
		      col.Remove(0)
		      Pic.Graphics.FillRect(X, Y, 10, 10)
		    Next
		  Next
		  
		  Dim sf As New StackFrame(Pic)
		  AddStackFrame(sf)
		  
		  Debug("Palettizer thread done: " + Str(Me.ThreadID))
		  If Finish <> Nil Then Finish.Invoke(sf.Key)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(p As Picture, finisher As FinishHandler)
		  Super.Constructor
		  Debug("Created a new palettizer thread: " + Str(Me.ThreadID))
		  Pic = p
		  Finish = finisher
		  Run()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  Debug("Palettizer thread destroyed: " + Str(Me.ThreadID))
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub FinishHandler(Key As String)
	#tag EndDelegateDeclaration


	#tag Property, Flags = &h21
		Private Colors() As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Finish As FinishHandler
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Pic As Picture
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Thread"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
