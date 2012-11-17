#tag Class
Protected Class placardButton
Inherits Canvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma unused X
		  #pragma unused Y
		  
		  drawWhenDown
		  me.Refresh(False)
		  return Not RaiseEvent MouseDown(X, Y)
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  if x<0 or y<0 or x>me.width or y>me.height then
		    'mouse is outside of button
		    if value then
		      if picDown = false then
		        drawWhenDown
		      end
		    else
		      if picDown = true then
		        drawWhenUp
		      end
		    end
		  else
		    'mouse is inside of button
		    if value then
		      if picDown = true then
		        drawWhenUp
		      end
		    else
		      if picDown = false then
		        drawWhenDown
		      end
		    end
		  end
		  
		  me.Refresh(False)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  if x<0 or y<0 or x>me.width or y>me.height then
		    return
		  end
		  if isSticky = false then
		    drawWhenUp
		    value = false
		  else
		    if value = true then
		      drawWhenUp
		      value = false
		    else
		      drawWhenDown
		      value = true
		    end
		  end
		  
		  me.Refresh(False)
		  
		  Action()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Me.setIcon(Icon)
		  RaiseEvent Open()
		  redraw()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  if value then
		    drawWhenDown
		  else
		    drawWhenUp
		  end
		  
		  g.drawPicture p,0,0
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub drawIt(fill as color, topleft as color, bottomright as color, tColor as color, deltaX as integer, deltaY as integer)
		  #pragma BreakOnExceptions Off
		  dim centerX,centerY as integer
		  
		  p = new Picture(width,height,32)
		  
		  p.graphics.foreColor = fill
		  p.graphics.fillRect 0,0,width-1,height-1
		  
		  //text and icon
		  if hasIcon then
		    p.graphics.drawPicture GetFrameThumbnail(Icon),(width/2)-(GetFrameThumbnail(Icon).width/2)+deltaX+iconDX,(height/2)-(GetFrameThumbnail(Icon).height/2)+deltaY+iconDY
		  end
		  
		  p.graphics.foreColor = tColor
		  p.graphics.textFont = textFont
		  p.graphics.textSize = textSize
		  p.graphics.bold = bold
		  p.graphics.underline = underline
		  p.graphics.italic = italic
		  centerX = width/2 - p.graphics.stringWidth(caption)/2
		  centerY = height/2 + p.graphics.textSize/2
		  p.graphics.drawString caption,centerX+deltaX+captionDX,centerY+deltaY+captionDY
		  
		  p.graphics.foreColor = rgb(0,0,0)
		  p.graphics.drawRect 0,0,width-1,height-1
		  
		  p.graphics.foreColor = topleft
		  p.graphics.drawLine 1,1,width-3,1
		  p.graphics.drawLine 1,1,1,height-3
		  
		  p.graphics.foreColor = bottomright
		  p.graphics.drawLine width-2,2,width-2,height-2
		  p.graphics.drawLine 2,height-2,width-2,height-2
		  
		Exception
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawWhenDown()
		  dim c as color
		  'this draws the button in the down (true) position
		  
		  picDown = true
		  if invertTextColor = true then
		    c = invertColor(textColor)
		  else
		    c = textColorDown
		  end
		  
		  drawIt rgb(136,136,136),rgb(85,85,85),rgb(170,170,170),c,downDX,downDY
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawWhenUp()
		  'this draws the button in the up (false) position
		  
		  picDown = false
		  drawIt rgb(221,221,221),rgb(255,255,255),rgb(170,170,170),textColor,0,0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function invertColor(c as color) As color
		  return rgb(255-c.red,255-c.green,255-c.blue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub redraw()
		  'call refresh to redraw the button
		  
		  if value = true then
		    drawWhenDown
		  else
		    drawWhenUp
		  end
		  
		  me.Refresh(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setCaption(text as string)
		  caption = text
		  redraw
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setIcon(p as String)
		  'sets the icon to the picture
		  
		  Icon = p
		  'if p = "" then
		  'hasIcon = false
		  'else
		  'hasIcon = true
		  'end
		  me.refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setSticky(s as boolean)
		  'sets the sticky property of the button
		  
		  isSticky = s
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setValue(v as boolean)
		  'sets the value of the button to either true or false
		  'this meathod automatically displays the change
		  'another way to edit the value is to use:
		  'me.value = true
		  'when using this to show the change you must refresh
		  'the button
		  
		  mvalue = v
		  if value = true then
		    drawWhenDown
		  else
		    drawWhenUp
		  end
		  
		  me.Refresh(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub toggle()
		  'this toggles the vlaue of the button
		  
		  if value = true then
		    drawWhenUp
		    value = false
		  else
		    drawWhenDown
		    value = true
		  end
		  
		  me.Refresh(False)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Action()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDown(X As Integer, Y As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ValueChanged()
	#tag EndHook


	#tag Property, Flags = &h0
		bold As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		caption As string
	#tag EndProperty

	#tag Property, Flags = &h0
		captionDX As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		captionDY As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		downDX As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		downDY As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		hasIcon As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Icon As String = ".png"
	#tag EndProperty

	#tag Property, Flags = &h0
		iconDX As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		iconDY As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		invertTextColor As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		isSticky As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		italic As boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mvalue As boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private p As Picture = Nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected picDown As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		textColor As color
	#tag EndProperty

	#tag Property, Flags = &h0
		textColorDown As color
	#tag EndProperty

	#tag Property, Flags = &h0
		textFont As string
	#tag EndProperty

	#tag Property, Flags = &h0
		textSize As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		underline As boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mvalue
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  setValue(value)
			  ValueChanged()
			End Set
		#tag EndSetter
		value As boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="bold"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="caption"
			Visible=true
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="captionDX"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="captionDY"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="downDX"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="downDY"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hasIcon"
			Visible=true
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Icon"
			Visible=true
			Group="Behavior"
			InitialValue=".png"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="iconDX"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="iconDY"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Group="Initial State"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="invertTextColor"
			Group="Behavior"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="isSticky"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="italic"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="textColor"
			Group="Behavior"
			InitialValue="&h000000"
			Type="color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="textColorDown"
			Group="Behavior"
			InitialValue="&c000000"
			Type="color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="textFont"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="textSize"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="underline"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="value"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
