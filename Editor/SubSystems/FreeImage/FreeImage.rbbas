#tag Class
Class FreeImage
	#tag Method, Flags = &h0
		Function AdjustBrightness(Percent As Double) As FreeImage
		  ' percent = 0 leaves the image alone
		  ' 0 < percent < 100 makes the image brighter
		  ' -100 < percent < 0 makes the image darker
		  
		  #if TargetWin32
		    const fname = "_FreeImage_AdjustBrightness@12"
		    Soft Declare Function FreeImage_AdjustBrightness Lib "FreeImage" _
		    Alias "_FreeImage_AdjustBrightness@12" ( dib As Ptr, Brightness as double ) as Boolean
		  #else
		    const fname = "FreeImage_AdjustBrightness"
		    Soft Declare Function FreeImage_AdjustBrightness Lib "FreeImage" _
		    ( dib As Ptr, Brightness as double ) As Boolean
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    
		    dim ret as FreeImage = me.Clone
		    // Need to figure out exactly what we should do with the LUT value. Until then, this probably won't work as expected
		    if FreeImage_AdjustBrightness( ret.fi_dib, Percent ) then
		      return ret
		    else
		      return nil
		    end if
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AdjustColors(Brightness as double, Contrast As Double, Gamma As Double, Invert As Boolean = false) As FreeImage
		  ' percent = 0 leaves the image alone
		  ' 0 < percent < 100 increases contrast
		  ' -100 < percent < 0 decreases contrast
		  
		  #if TargetWin32
		    const fname = "_FreeImage_AdjustColors@32"
		    Soft Declare Function FreeImage_AdjustColors Lib "FreeImage" _
		    Alias "_FreeImage_AdjustColors@32" ( dib As Ptr, Brightness as double, Contrast As Double, Gamma As Double, Invert As Boolean ) as Boolean
		  #else
		    const fname = "FreeImage_AdjustColors"
		    Soft Declare Function FreeImage_AdjustColors Lib "FreeImage" _
		    ( dib As Ptr, Brightness as double, Contrast As Double, Gamma As Double, Invert As Boolean ) As Boolean
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    
		    dim ret as FreeImage = me.Clone
		    // Need to figure out exactly what we should do with the LUT value. Until then, this probably won't work as expected
		    if FreeImage_AdjustColors( ret.fi_dib, Brightness, Contrast, Gamma, Invert ) then
		      return ret
		    else
		      return nil
		    end if
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AdjustContrast(Percent As Double) As FreeImage
		  ' percent = 0 leaves the image alone
		  ' 0 < percent < 100 increases contrast
		  ' -100 < percent < 0 decreases contrast
		  
		  #if TargetWin32
		    const fname = "_FreeImage_AdjustContrast@12"
		    Soft Declare Function FreeImage_AdjustContrast Lib "FreeImage" _
		    Alias "_FreeImage_AdjustContrast@12" ( dib As Ptr, Contrast as double ) as Boolean
		  #else
		    const fname = "FreeImage_AdjustContrast"
		    Soft Declare Function FreeImage_AdjustContrast Lib "FreeImage" _
		    ( dib As Ptr, Contrast as double ) As Boolean
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    
		    dim ret as FreeImage = me.Clone
		    // Need to figure out exactly what we should do with the LUT value. Until then, this probably won't work as expected
		    if FreeImage_AdjustContrast( ret.fi_dib, Percent ) then
		      return ret
		    else
		      return nil
		    end if
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AdjustCurve(Channel As FI_ColorChannel, LUT As MemoryBlock) As FreeImage
		  #if TargetWin32
		    const fname = "_FreeImage_AdjustCurve@12"
		    Soft Declare Function FreeImage_AdjustCurve Lib "FreeImage" _
		    Alias "_FreeImage_AdjustCurve@12" ( dib As Ptr, LUT as ptr, channel as FI_ColorChannel ) as Boolean
		  #else
		    const fname = "FreeImage_AdjustCurve"
		    Soft Declare Function FreeImage_AdjustCurve Lib "FreeImage" _
		    ( dib As Ptr, LUT as uint8, channel as FI_ColorChannel ) As Boolean
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) and LUT <> nil and LUT.Size = 256 then
		    
		    dim ret as FreeImage = me.Clone
		    if FreeImage_AdjustCurve( ret.fi_dib, LUT, Channel ) then
		      return ret
		    else
		      return nil
		    end if
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AdjustGamma(Gamma As Double) As FreeImage
		  ' gamma = 1 leaves the image alone
		  ' gamma > 1 lightens the image
		  ' 0 < gamma < 1 darkens the image
		  
		  #if TargetWin32
		    const fname = "_FreeImage_AdjustGamma@12"
		    Soft Declare Function FreeImage_AdjustGamma Lib "FreeImage" _
		    Alias "_FreeImage_AdjustGamma@12" ( dib As Ptr, gamma as double ) as Boolean
		  #else
		    const fname = "FreeImage_AdjustGamma"
		    Soft Declare Function FreeImage_AdjustGamma Lib "FreeImage" _
		    ( dib As Ptr, gamma as double ) As Boolean
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    
		    dim ret as FreeImage = me.Clone
		    // Need to figure out exactly what we should do with the LUT value. Until then, this probably won't work as expected
		    if FreeImage_AdjustGamma( ret.fi_dib, Gamma ) then
		      return ret
		    else
		      return nil
		    end if
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AsString(type as FI_Format, flags As fi_flag) As String
		  // Part of the StringProvider interface.
		  
		  dim mb As MemoryBlock = me.SaveToMemory( type, flags )
		  
		  if mb <> nil then
		    return mb.StringValue( 0, mb.Size )
		  else
		    return ""
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clone() As FreeImage
		  #if TargetWin32
		    const fname = "_FreeImage_Clone@4"
		    Soft Declare Function FreeImage_Clone Lib "FreeImage" _
		    Alias "_FreeImage_Clone@4" ( dib As Ptr ) as Ptr
		  #else
		    const fname = "FreeImage_Clone"
		    Soft Declare Function FreeImage_Clone Lib "FreeImage" _
		    ( dib As Ptr ) as Ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return new FreeImage( FreeImage_Clone( fi_dib ) )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColorQuantize(Quantize As FI_QuantizeAlgorithm) As freeImage
		  #if TargetWin32
		    const fname = "_FreeImage_ColorQuantize@8"
		    Soft Declare function FreeImage_ColorQuantize Lib "FreeImage" _
		    Alias "_FreeImage_ColorQuantize@8" ( dib As Ptr, quantize as FI_QuantizeAlgorithm ) as Ptr
		  #else
		    const fname = "FreeImage_ColorQuantize"
		    Soft Declare function FreeImage_ColorQuantize Lib "FreeImage" _
		    ( dib As Ptr, alg as FI_QuantizeAlgorithm ) as Ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return new FreeImage( FreeImage_ColorQuantize( fi_dib, quantize ) )
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Composite(bg as FreeImage) As FreeImage
		  'DLL_API FIBITMAP *DLL_CALLCONV FreeImage_Composite(FIBITMAP *fg, BOOL useFileBkg
		  'FI_DEFAULT(FALSE), RGBQUAD *appBkColor FI_DEFAULT(NULL), FIBITMAP *bg
		  'FI_DEFAULT(NULL));
		  
		  
		  if bg = nil then return nil
		  
		  #if TargetWin32
		    const fname = "_FreeImage_Composite@16"
		    Soft Declare function FreeImage_Composite Lib "FreeImage" _
		    Alias "_FreeImage_Composite@16" ( fg as Ptr, useFileBkg As Boolean, appBkColor as Ptr, bg as ptr ) as Ptr
		  #else
		    const fname = "FreeImage_Composite@16"
		    Soft Declare function FreeImage_Composite Lib "FreeImage" _
		    ( fg as Ptr, useFileBkg As Boolean, appBkColor as Ptr, bg as ptr ) as Ptr
		  #endif
		  
		  dim bgx As FreeImage = bg
		  dim me32 As FreeImage = me
		  if me.GetBPP <> 32 then me32 = me.ConvertTo32Bits
		  if bgx.HasTransparency then bgx.hastransparency = false
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return new FreeImage( FreeImage_Composite( me32.fi_dib, true, nil, bgx.fi_dib ) )
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Composite(c() as Uint8) As FreeImage
		  'DLL_API FIBITMAP *DLL_CALLCONV FreeImage_Composite(FIBITMAP *fg, BOOL useFileBkg
		  'FI_DEFAULT(FALSE), RGBQUAD *appBkColor FI_DEFAULT(NULL), FIBITMAP *bg
		  'FI_DEFAULT(NULL));
		  
		  
		  #if TargetWin32
		    const fname = "_FreeImage_Composite@16"
		    Soft Declare function FreeImage_Composite Lib "FreeImage" _
		    Alias "_FreeImage_Composite@16" ( fg as Ptr, useFileBkg As Boolean, appBkColor as Ptr, bg as ptr ) as Ptr
		  #else
		    const fname = "FreeImage_Composite@16"
		    Soft Declare function FreeImage_Composite Lib "FreeImage" _
		    ( fg as Ptr, useFileBkg As Boolean, appBkColor as Ptr, bg as ptr ) as Ptr
		  #endif
		  
		  if UBound( c ) < 3 then return nil
		  
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    dim mb as new MemoryBlock( 8 )
		    mb.Byte( 0 ) = c( 2 )
		    mb.Byte( 1 ) = c( 1 )
		    mb.Byte( 2 ) = c( 0 )
		    mb.Byte( 3 ) = c( 3 )
		    return new FreeImage( FreeImage_Composite( fi_dib, false, mb, nil ) )
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(InWidth As Integer, InHeight As Integer, InBitsPerPixel As Integer = 24)
		  #if TargetWin32
		    const fname = "_FreeImage_Allocate@24"
		    Soft Declare function FreeImage_Allocate Lib "FreeImage" _
		    Alias "_FreeImage_Allocate@24" ( w As Integer, h As Integer, b As Integer, rmask As UInt32, bmask As UInt32, gmask As Uint32 ) as ptr
		  #else
		    const fname = "FreeImage_Allocate"
		    Soft Declare function FreeImage_Allocate Lib "FreeImage" _
		    ( w As Integer, h As Integer, b As Integer, rmask As UInt32, bmask As UInt32, gmask As Uint32 ) as ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    me.fi_dib = FreeImage_Allocate( InWidth, InHeight, InBitsPerPixel, 0, 0, 0 )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor(p as Ptr)
		  me.fi_dib = p
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ConvertTo16Bits555()
		  ' an in-place version of the 16-bit conversion (ie, converts itself to 16 bits, frees its own memory, and replaces its ptr)
		  
		  #if TargetWin32
		    const fname = "_FreeImage_ConvertTo16Bits555@4"
		    Soft Declare function FreeImage_ConvertTo16Bits555 Lib "FreeImage" _
		    Alias "_FreeImage_ConvertTo16Bits555@4" ( dib as Ptr ) as ptr
		  #else
		    const fname = "FreeImage_ConvertTo16Bits555"
		    Soft Declare function FreeImage_ConvertTo16Bits555 Lib "FreeImage" _
		    ( dib as Ptr ) as ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    dim p As ptr = FreeImage_ConvertTo16Bits555( fi_dib )
		    Free( fi_dib )
		    fi_dib = p
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertTo16Bits555() As FreeImage
		  #if TargetWin32
		    const fname = "_FreeImage_ConvertTo16Bits555@4"
		    Soft Declare function FreeImage_ConvertTo16Bits555 Lib "FreeImage" _
		    Alias "_FreeImage_ConvertTo16Bits555@4" ( dib as Ptr ) as ptr
		  #else
		    const fname = "FreeImage_ConvertTo16Bits555"
		    Soft Declare function FreeImage_ConvertTo16Bits555 Lib "FreeImage" _
		    ( dib as Ptr ) as ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return new FreeImage( FreeImage_ConvertTo16Bits555( fi_dib ) )
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ConvertTo16Bits565()
		  ' an in-place version of the 16-bit (565) conversion (ie, converts itself to 16 bits, frees its own memory, and replaces its ptr)
		  
		  #if TargetWin32
		    const fname = "_FreeImage_ConvertTo16Bits565@4"
		    Soft Declare function FreeImage_ConvertTo16Bits565 Lib "FreeImage" _
		    Alias "_FreeImage_ConvertTo16Bits565@4" ( dib as Ptr ) as ptr
		  #else
		    const fname = "FreeImage_ConvertTo16Bits565"
		    Soft Declare function FreeImage_ConvertTo16Bits565 Lib "FreeImage" _
		    ( dib as Ptr ) as ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    dim p As ptr = FreeImage_ConvertTo16Bits565( fi_dib )
		    Free( fi_dib )
		    fi_dib = p
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertTo16Bits565() As FreeImage
		  #if TargetWin32
		    const fname = "_FreeImage_ConvertTo16Bits565@4"
		    Soft Declare function FreeImage_ConvertTo16Bits565 Lib "FreeImage" _
		    Alias "_FreeImage_ConvertTo16Bits565@4" ( dib as Ptr ) as ptr
		  #else
		    const fname = "FreeImage_ConvertTo16Bits565"
		    Soft Declare function FreeImage_ConvertTo16Bits565 Lib "FreeImage" _
		    ( dib as Ptr ) as ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return new FreeImage( FreeImage_ConvertTo16Bits565( fi_dib ) )
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ConvertTo24Bits()
		  ' an in-place version of the 24-bit conversion (ie, converts itself to 24 bits, frees its own memory, and replaces its ptr)
		  
		  #if TargetWin32
		    const fname = "_FreeImage_ConvertTo24Bits@4"
		    Soft Declare function FreeImage_ConvertTo24Bits Lib "FreeImage" _
		    Alias "_FreeImage_ConvertTo24Bits@4" ( dib as Ptr ) as ptr
		  #else
		    const fname = "FreeImage_ConvertTo24Bits"
		    Soft Declare function FreeImage_ConvertTo24Bits Lib "FreeImage" _
		    ( dib as Ptr ) as ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    dim p As ptr = FreeImage_ConvertTo24Bits( fi_dib )
		    Free( fi_dib )
		    fi_dib = p
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertTo24Bits() As FreeImage
		  #if TargetWin32
		    const fname = "_FreeImage_ConvertTo24Bits@4"
		    Soft Declare function FreeImage_ConvertTo24Bits Lib "FreeImage" _
		    Alias "_FreeImage_ConvertTo24Bits@4" ( dib as Ptr ) as ptr
		  #else
		    const fname = "FreeImage_ConvertTo24Bits"
		    Soft Declare function FreeImage_ConvertTo24Bits Lib "FreeImage" _
		    ( dib as Ptr ) as ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return new FreeImage( FreeImage_ConvertTo24Bits( fi_dib ) )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ConvertTo32Bits()
		  ' an in-place version of the 32-bit conversion (ie, converts itself to 32 bits, frees its own memory, and replaces its ptr)
		  
		  #if TargetWin32
		    const fname = "_FreeImage_ConvertTo32Bits@4"
		    Soft Declare function FreeImage_ConvertTo32Bits Lib "FreeImage" _
		    Alias "_FreeImage_ConvertTo32Bits@4" ( dib as Ptr ) as ptr
		  #else
		    const fname = "FreeImage_ConvertTo32Bits"
		    Soft Declare function FreeImage_ConvertTo32Bits Lib "FreeImage" _
		    ( dib as Ptr ) as ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    dim p As ptr = FreeImage_ConvertTo32Bits( fi_dib )
		    
		    Free( fi_dib )
		    fi_dib = p
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertTo32Bits() As FreeImage
		  #if TargetWin32
		    const fname = "_FreeImage_ConvertTo32Bits@4"
		    Soft Declare function FreeImage_ConvertTo32Bits Lib "FreeImage" _
		    Alias "_FreeImage_ConvertTo32Bits@4" ( dib as Ptr ) as ptr
		  #else
		    const fname = "FreeImage_ConvertTo32Bits"
		    Soft Declare function FreeImage_ConvertTo32Bits Lib "FreeImage" _
		    ( dib as Ptr ) as ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return new FreeImage( FreeImage_ConvertTo32Bits( fi_dib ) )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ConvertTo4Bits()
		  ' an in-place version of the 4-bit conversion (ie, converts itself to 4 bits, frees its own memory, and replaces its ptr)
		  
		  #if TargetWin32
		    const fname = "_FreeImage_ConvertTo4Bits@4"
		    Soft Declare function FreeImage_ConvertTo4Bits Lib "FreeImage" _
		    Alias "_FreeImage_ConvertTo4Bits@4" ( dib as Ptr ) as ptr
		  #else
		    const fname = "FreeImage_ConvertTo4Bits"
		    Soft Declare function FreeImage_ConvertTo4Bits Lib "FreeImage" _
		    ( dib as Ptr ) as ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    dim p As ptr = FreeImage_ConvertTo4Bits( fi_dib )
		    Free( fi_dib )
		    fi_dib = p
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertTo4Bits() As FreeImage
		  #if TargetWin32
		    const fname = "_FreeImage_ConvertTo4Bits@4"
		    Soft Declare function FreeImage_ConvertTo4Bits Lib "FreeImage" _
		    Alias "_FreeImage_ConvertTo4Bits@4" ( dib as Ptr ) as ptr
		  #else
		    const fname = "FreeImage_ConvertTo4Bits"
		    Soft Declare function FreeImage_ConvertTo4Bits Lib "FreeImage" _
		    ( dib as Ptr ) as ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return new FreeImage( FreeImage_ConvertTo4Bits( fi_dib ) )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ConvertTo8Bits()
		  ' an in-place version of the 8-bit conversion (ie, converts itself to 8 bits, frees its own memory, and replaces its ptr)
		  
		  #if TargetWin32
		    const fname = "_FreeImage_ConvertTo8Bits@4"
		    Soft Declare function FreeImage_ConvertTo8Bits Lib "FreeImage" _
		    Alias "_FreeImage_ConvertTo8Bits@4" ( dib as Ptr ) as ptr
		  #else
		    const fname = "FreeImage_ConvertTo8Bits"
		    Soft Declare function FreeImage_ConvertTo8Bits Lib "FreeImage" _
		    ( dib as Ptr ) as ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    dim p As ptr = FreeImage_ConvertTo8Bits( fi_dib )
		    Free( fi_dib )
		    fi_dib = p
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertTo8Bits() As FreeImage
		  #if TargetWin32
		    const fname = "_FreeImage_ConvertTo8Bits@4"
		    Soft Declare function FreeImage_ConvertTo8Bits Lib "FreeImage" _
		    Alias "_FreeImage_ConvertTo8Bits@4" ( dib as Ptr ) as ptr
		  #else
		    const fname = "FreeImage_ConvertTo8Bits"
		    Soft Declare function FreeImage_ConvertTo8Bits Lib "FreeImage" _
		    ( dib as Ptr ) as ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return new FreeImage( FreeImage_ConvertTo8Bits( fi_dib ) )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Copy(left as Integer, top as Integer, InWidth as Integer, InHeight as Integer, StayWithinBounds As Boolean = True) As FreeImage
		  #if TargetWin32
		    const fname = "_FreeImage_Copy@20"
		    Soft Declare function FreeImage_Copy Lib "FreeImage" _
		    Alias "_FreeImage_Copy@20" ( dib as Ptr, le as Integer, tp as Integer, rt as Integer, bt as Integer ) as ptr
		  #else
		    const fname = "FreeImage_Copy"
		    Soft Declare function FreeImage_Copy Lib "FreeImage" _
		    ( dib as Ptr, le as Integer, tp as Integer, rt as Integer, bt as Integer ) as ptr
		  #endif
		  
		  ' calculate right and bottom
		  dim fi_right as Integer = left + inwidth
		  dim fi_bottom as Integer = top + inheight
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    
		    if StayWithinBounds then
		      ' if the arguments exceed the bounds of the image (eg, left=-10), just run the function, though it'll return a nil pointer
		      return new FreeImage( FreeImage_Copy( fi_dib, left, top, fi_right, fi_bottom ) )
		    else
		      ' if we're trying to copy a region that exceeds the bounds of this image, implicitly copy a blank area
		      dim newleft, newtop, newwidth, newheight As Integer
		      
		      if left < 0 then newleft = 0
		      if top < 0 then newtop = 0
		      if left + InWidth > me.Width then newwidth = me.Width - newleft
		      if top + InHeight > me.Height then newheight = me.Height - newtop
		      
		      dim blank As FreeImage = new FreeImage( InWidth, InHeight, me.GetBPP )
		      dim response As FreeImage = me.Copy( newleft, newtop, newwidth, newheight, true )
		      
		      if blank.Paste( response, ( newleft - left ), ( newtop - top ), 256 ) then
		        return blank
		      end if
		    end if
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  #if TargetWin32
		    const fname = "_FreeImage_Unload@4"
		    Soft Declare Sub FreeImage_Unload Lib "FreeImage" _
		    Alias "_FreeImage_Unload@4" ( dib As Ptr )
		  #else
		    const fname = "FreeImage_Unload"
		    Soft Declare Sub FreeImage_Unload Lib "FreeImage" _
		    ( dib As Ptr )
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    FreeImage_Unload( fi_dib )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Dither(Type As FI_DitherAlgorithm) As FreeImage
		  #if TargetWin32
		    const fname = "_FreeImage_Dither@8"
		    Soft Declare function FreeImage_Dither Lib "FreeImage" _
		    Alias "_FreeImage_Dither@8" ( dib as Ptr, alg as UInt8 ) as ptr
		  #else
		    const fname = "FreeImage_Dither"
		    Soft Declare function FreeImage_Dither Lib "FreeImage" _
		    ( dib as Ptr, alg as Uint8 ) as ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return new FreeImage( FreeImage_Dither( fi_dib, integer(Type) ) )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FlipHorizontal() As FreeImage
		  #if TargetWin32
		    const fname = "_FreeImage_FlipHorizontal@4"
		    Soft Declare function FreeImage_FlipHorizontal Lib "FreeImage" _
		    Alias "_FreeImage_FlipHorizontal@4" ( dib as Ptr ) as Boolean
		  #else
		    const fname = "FreeImage_FlipHorizontal"
		    Soft Declare function FreeImage_FlipHorizontal Lib "FreeImage" _
		    ( dib as Ptr ) as Boolean
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    ' FlipHorizontal and FlipVertical modify the passed image in-place. To be consistent, we'll return a copy of it.
		    dim dupe as FreeImage = me.Clone
		    
		    if dupe <> nil and FreeImage_FlipHorizontal( dupe.fi_dib ) then
		      return dupe
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FlipVertical() As FreeImage
		  #if TargetWin32
		    const fname = "_FreeImage_FlipVertical@4"
		    Soft Declare function FreeImage_FlipVertical Lib "FreeImage" _
		    Alias "_FreeImage_FlipVertical@4" ( dib as Ptr ) as Boolean
		  #else
		    const fname = "FreeImage_FlipVertical"
		    Soft Declare function FreeImage_FlipVertical Lib "FreeImage" _
		    ( dib as Ptr ) as Boolean
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    ' FlipHorizontal and FlipVertical modify the passed image in-place. To be consistent, we'll return a copy of it.
		    dim dupe as FreeImage = me.Clone
		    
		    if dupe <> nil and FreeImage_FlipVertical( dupe.fi_dib ) then
		      return dupe
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Free(dib As Ptr)
		  #if TargetWin32
		    const fname = "_FreeImage_Unload@4"
		    Soft Declare Sub FreeImage_Unload Lib "FreeImage" _
		    Alias "_FreeImage_Unload@4" ( dib As Ptr )
		  #else
		    const fname = "FreeImage_Unload"
		    Soft Declare Sub FreeImage_Unload Lib "FreeImage" _
		    ( dib As Ptr )
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    FreeImage_Unload( dib )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function FromString(Str As String) As FreeImage
		  dim mb as new MemoryBlock( str.Len )
		  mb.StringValue( 0, mb.Size ) = str
		  
		  dim tmp as FreeImage = LoadFromMemory( mb )
		  
		  return tmp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBPP() As Uint32
		  #if TargetWin32
		    const fname = "_FreeImage_GetBPP@4"
		    Soft Declare Function FreeImage_GetBPP Lib "FreeImage" _
		    Alias "_FreeImage_GetBPP@4" ( dib As Ptr ) as UInt32
		  #else
		    const fname = "FreeImage_GetBPP"
		    Soft Declare Function FreeImage_GetBPP Lib "FreeImage" _
		    ( dib As Ptr ) as UInt32
		  #endif
		  
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return FreeImage_GetBPP( fi_dib )
		  else
		    return -1
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetColorsUsed() As Uint32
		  ' returns the size of the color palette
		  
		  #if TargetWin32
		    const fname = "_FreeImage_GetColorsUsed@4"
		    Soft Declare Function FreeImage_GetColorsUsed Lib "FreeImage" _
		    Alias "_FreeImage_GetColorsUsed@4" ( dib As Ptr ) as UInt32
		  #else
		    const fname = "FreeImage_GetColorsUsed"
		    Soft Declare Function FreeImage_GetColorsUsed Lib "FreeImage" _
		    ( dib As Ptr ) as UInt32
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return FreeImage_GetColorsUsed( fi_dib )
		  else
		    return -1
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function GetFileType(fn as string) As Uint32
		  const SIZE_PARAM = 0 ' not used
		  
		  #if TargetWin32
		    const fname1 = "_FreeImage_GetFileType@8"
		    const fname2 = "_FreeImage_GetFIFFromFilename@4"
		    Soft Declare Function FreeImage_GetFileType Lib "FreeImage" _
		    Alias "_FreeImage_GetFileType@8" ( fileName as CString, size as Integer ) as Integer
		    Soft Declare Function FreeImage_GetFIFFromFilename Lib "FreeImage" _
		    Alias "_FreeImage_GetFIFFromFilename@4" ( fileName as CString ) as Integer
		  #else
		    const fname1 = "FreeImage_GetFileType"
		    const fname2 = "FreeImage_GetFIFFromFilename"
		    Soft Declare Function FreeImage_GetFileType Lib "FreeImage" _
		    ( fileName as CString, size as Integer ) as Integer
		    Soft Declare Function FreeImage_GetFIFFromFilename Lib "FreeImage" _
		    ( fileName as CString ) as Integer
		  #endif
		  
		  If System.IsFunctionAvailable( fname1, "FreeImage" ) then
		    dim type as Integer = FreeImage_GetFileType( fn, SIZE_PARAM )
		    
		    if type = -1 then
		      ' unknown file type. let's try another method...
		      
		      If System.IsFunctionAvailable( fname2, "FreeImage" ) then
		        type = FreeImage_GetFIFFromFilename( fn )
		      End If
		      
		    end if
		    
		    return type
		  else
		    return -1
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetImageType() As FI_ImageType
		  #if TargetWin32
		    const fname = "_FreeImage_GetImageType@4"
		    Soft Declare Function FreeImage_GetImageType Lib "FreeImage" _
		    Alias "_FreeImage_GetImageType@4" ( dib As Ptr ) as UInt32
		  #else
		    const fname = "FreeImage_GetImageType"
		    Soft Declare Function FreeImage_GetImageType Lib "FreeImage" _
		    ( dib As Ptr ) as UInt32
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return FI_ImageType( FreeImage_GetImageType( fi_dib ) )
		  else
		    return FI_ImageType.UNKNOWN
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Greyscale() As FreeImage
		  #if TargetWin32
		    const fname = "_FreeImage_ConvertToGreyscale@4"
		    Soft Declare Function FreeImage_ConvertToGreyscale Lib "FreeImage" _
		    Alias "_FreeImage_ConvertToGreyscale@4" ( dib As Ptr ) As Ptr
		  #else
		    const fname = "FreeImage_ConvertToGreyscale"
		    Soft Declare Function FreeImage_ConvertToGreyscale Lib "FreeImage" _
		    ( dib As Ptr ) As Ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    dim p as ptr = FreeImage_ConvertToGreyscale( fi_dib )
		    
		    return new FreeImage( p )
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasBackgroundColor() As Boolean
		  #if TargetWin32
		    const fname = "_FreeImage_HasBackgroundColor@4"
		    Soft Declare Function FreeImage_HasBackgroundColor Lib "FreeImage" _
		    Alias "_FreeImage_HasBackgroundColor@4" ( dib As Ptr ) as Boolean
		  #else
		    const fname = "FreeImage_HasBackgroundColor"
		    Soft Declare Function FreeImage_HasBackgroundColor Lib "FreeImage" _
		    ( dib As Ptr ) as Boolean
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return FreeImage_HasBackgroundColor( fi_dib )
		  else
		    return False
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Height() As Uint32
		  #if TargetWin32
		    const fname = "_FreeImage_GetHeight@4"
		    Soft Declare Function FreeImage_GetHeight Lib "FreeImage" _
		    Alias "_FreeImage_GetHeight@4" ( dib as Ptr ) As Uint32
		  #else
		    const fname = "FreeImage_GetHeight"
		    Soft Declare Function FreeImage_GetHeight Lib "FreeImage" _
		    ( dib as Ptr ) As Uint32
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return FreeImage_GetHeight( fi_dib )
		  else
		    return -1
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Invert() As FreeImage
		  #if TargetWin32
		    const fname = "_FreeImage_Invert@4"
		    Soft Declare function FreeImage_Invert Lib "FreeImage" _
		    Alias "_FreeImage_Invert@4" ( dib as Ptr ) as Boolean
		  #else
		    const fname = "FreeImage_Invert"
		    Soft Declare function FreeImage_Invert Lib "FreeImage" _
		    ( dib as Ptr ) as Boolean
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    dim ret as FreeImage = me.Clone
		    if FreeImage_Invert( ret.fi_dib ) then
		      return ret
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Load(f as folderitem) As FreeImage
		  #if TargetWin32
		    const fname1 = "_FreeImage_Load@12"
		    const fname2 = "_FreeImage_GetFileType@8"
		    Soft Declare Function FreeImage_Load Lib "FreeImage" _
		    Alias "_FreeImage_Load@12" ( fif as Integer, fileName as CString, flags as Integer ) as Ptr
		    Soft Declare Function FreeImage_GetFileType Lib "FreeImage" _
		    Alias "_FreeImage_GetFileType@8" ( fif as Integer, fileName as CString, flags as Integer ) as Ptr
		  #else
		    const fname1 = "FreeImage_Load"
		    const fname2 = "FreeImage_GetFileType"
		    Soft Declare Function FreeImage_Load Lib "FreeImage" _
		    ( fif as Integer, fileName as CString, flags as Integer ) as Ptr
		    Soft Declare Function FreeImage_GetFileType Lib "FreeImage" _
		    ( fif as Integer, fileName as CString, flags as Integer ) as Ptr
		  #endif
		  
		  If System.IsFunctionAvailable( fname1, "FreeImage" ) _
		    and System.IsFunctionAvailable( fname2, "FreeImage" ) _
		    and f <> nil then
		    dim type as integer = FreeImage.GetFileType( f.Name )
		    dim p as ptr = FreeImage_Load( Integer( type ), f.AbsolutePath, 0 )
		    
		    return new FreeImage( p )
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Load(f As FolderItem, type as FI_Format) As FreeImage
		  #if TargetWin32
		    const fname = "_FreeImage_Load@12"
		    Soft Declare Function FreeImage_Load Lib "FreeImage" _
		    Alias "_FreeImage_Load@12" ( fif as Integer, fileName as CString, flags as Integer ) as Ptr
		  #else
		    const fname = "FreeImage_Load"
		    Soft Declare Function FreeImage_Load Lib "FreeImage" _
		    ( fif as Integer, fileName as CString, flags as Integer ) as Ptr
		  #endif
		  
		  If System.IsFunctionAvailable( fname, "FreeImage" ) then
		    dim p as ptr = FreeImage_Load( Integer( type ), f.absolutepath, 0 )
		    
		    return new FreeImage( p )
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function LoadFromMemory(mb as MemoryBlock) As FreeImage
		  // Wrap the two-parameter version of LoadFromMemory by passing in the default flag value of 0
		  Return LoadFromMemory( mb, FI_Flag( 0 ) )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function LoadFromMemory(mb as MemoryBlock, flags as FI_Flag) As FreeImage
		  #if TargetWin32
		    const fname1 = "_FreeImage_LoadFromMemory@12"
		    const fname2 = "_FreeImage_OpenMemory@8"
		    const fname3 = "_FreeImage_CloseMemory@4"
		    const fname4 = "_FreeImage_GetFileTypeFromMemory@8"
		    Soft Declare Function FreeImage_LoadFromMemory Lib "FreeImage" _
		    Alias "_FreeImage_LoadFromMemory@12" ( fif as Integer, stream as ptr, flags as Integer ) as Ptr
		    Soft Declare Function FreeImage_OpenMemory Lib "FreeImage" _
		    Alias "_FreeImage_OpenMemory@8" ( data As Ptr = nil, size_in_bytes as UInt32 = 0 ) as Ptr
		    Soft Declare sub FreeImage_CloseMemory Lib "FreeImage" _
		    Alias "_FreeImage_CloseMemory@4" ( stream as Ptr )
		    Soft Declare Function FreeImage_GetFileTypeFromMemory Lib "FreeImage" _
		    Alias "_FreeImage_GetFileTypeFromMemory@8" ( stream as Ptr, size as Integer ) As Integer
		  #else
		    const fname1 = "FreeImage_Load"
		    const fname2 = "FreeImage_OpenMemory"
		    const fname3 = "FreeImage_CloseMemory"
		    const fname4 = "FreeImage_GetFileTypeFromMemory"
		    
		    Soft Declare Function FreeImage_LoadFromMemory Lib "FreeImage" _
		    ( fif as Integer, stream as ptr, flags as Integer ) as Ptr
		    Soft Declare Function FreeImage_OpenMemory Lib "FreeImage" _
		    ( data As Ptr = nil, size_in_bytes as UInt32 = 0 ) as Ptr
		    Soft Declare sub FreeImage_CloseMemory Lib "FreeImage" _
		    ( stream as Ptr )
		    Soft Declare Function FreeImage_GetFileTypeFromMemory Lib "FreeImage" _
		    ( stream as Ptr, size as Integer ) As Integer
		  #endif
		  
		  
		  If System.IsFunctionAvailable( fname1, "FreeImage" )and _
		    System.IsFunctionAvailable( fname2, "FreeImage" ) and _
		    System.IsFunctionAvailable( fname3, "FreeImage" ) and _
		    System.IsFunctionAvailable( fname4, "FreeImage" ) then
		    dim p as ptr = FreeImage_OpenMemory( mb, mb.Size )
		    dim type as integer = FreeImage_GetFileTypeFromMemory( p, mb.size )
		    
		    p = FreeImage_LoadFromMemory( type, p, Integer(flags) )
		    
		    return new FreeImage( p )
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function LoadFromString(s As String) As FreeImage
		  dim mb as new MemoryBlock( s.Len )
		  mb.StringValue( 0, mb.Size ) = s
		  
		  return FreeImage.LoadFromMemory( mb )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function LoadU(file as folderitem, FIF as FI_Format) As FreeImage
		  #if TargetWin32 
		    const fname = "_FreeImage_LoadU@12"
		    Soft Declare Function FreeImage_LoadU Lib "FreeImage" _
		    Alias "_FreeImage_LoadU@12" ( fif as Integer, fileName as CString, flags as Integer ) as Ptr
		    
		    If System.IsFunctionAvailable( fname, "FreeImage" ) then
		      dim p as ptr = FreeImage_LoadU( UInt32( FIF ), file.AbsolutePath, 0 )
		      
		      return new FreeImage( p )
		    End If
		  #else
		    Return Load( file, fif )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakeThumbnail(max_pixel_size As Integer) As freeImage
		  #if TargetWin32
		    const fname = "_FreeImage_MakeThumbnail@12"
		    Soft Declare function FreeImage_MakeThumbnail Lib "FreeImage" _
		    Alias "_FreeImage_MakeThumbnail@12" ( dib As Ptr, size as Integer, convert as Boolean ) as Ptr
		  #else
		    const fname = "FreeImage_MakeThumbnail"
		    Soft Declare function FreeImage_MakeThumbnail Lib "FreeImage" _
		    ( dib As Ptr, size as Integer, convert as Boolean ) as Ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return new FreeImage( FreeImage_MakeThumbnail( fi_dib, max_pixel_size, false ) )
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Paste(source as FreeImage, left as Integer, top as Integer, alpha as integer = 256, HandleOutOfBounds As Boolean = False) As boolean
		  if source = nil then return false
		  
		  #if TargetWin32
		    const fname = "_FreeImage_Paste@20"
		    Soft Declare function FreeImage_Paste Lib "FreeImage" _
		    Alias "_FreeImage_Paste@20" ( dst as Ptr, src as Ptr, le as Integer, tp as Integer, fi_alpha as integer ) as Boolean
		  #else
		    const fname = "FreeImage_Paste"
		    Soft Declare function FreeImage_Paste Lib "FreeImage" _
		    ( dst as Ptr, src as Ptr, le as Integer, tp as Integer, fi_alpha as integer ) as Boolean
		  #endif
		  
		  
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    
		    if HandleOutOfBounds and ( left < 0 or top < 0 ) then
		      dim newleft,newtop,newright,newbot,newwidth,newheight As integer
		      
		      newleft = max( 0, Left )
		      newtop = max( 0, Top )
		      newright = min( me.Width, source.Width + Left )
		      newbot = min( me.Height, source.Height + Top )
		      
		      newwidth = newright - newleft
		      newheight = newbot - newtop
		      
		      dim part As FreeImage = me.Copy( newleft, newtop, newwidth, newheight, true )
		      
		      call part.Width
		      call part.Height
		      
		      if source.GetBPP > me.GetBPP then
		        return FreeImage_Paste( me.ConvertTo32Bits.fi_dib, part.fi_dib, newleft, newtop, alpha )
		      else
		        return FreeImage_Paste( fi_dib, part.fi_dib, newleft, newtop, alpha )
		      end if
		      
		    else
		      if me.GetBPP = 24 then me.ConvertTo32Bits
		      if source.GetBPP = 24 then source.ConvertTo32Bits
		      
		      if FreeImage_Paste( me.fi_dib, source.fi_dib, left, top, alpha ) then
		        
		        me.fi_dib = me.fi_dib
		        return true
		      end if
		      
		      return false
		    end if
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PixelRGB(x As Uint32, y as uint32) As Color
		  #if TargetWin32
		    const fname = "_FreeImage_GetPixelColor@16"
		    Soft Declare function FreeImage_GetPixelColor Lib "FreeImage" _
		    Alias "_FreeImage_GetPixelColor@16" ( dib As Ptr, fix as UInt32, fiy as UInt32, value as Ptr ) as Boolean
		  #else
		    const fname = "FreeImage_GetPixelColor"
		    Soft Declare function FreeImage_GetPixelColor Lib "FreeImage" _
		    ( dib As Ptr, fix as UInt32, fiy as UInt32, value as Ptr ) as Boolean
		  #endif
		  
		  dim mb as new MemoryBlock( 8 )
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    ' FreeImage's origin is bottom left; REALbasic's is top left. Leave X alone, but compensate by flipping the Y origin
		    if FreeImage_GetPixelColor( fi_dib, x, me.Height-y, mb ) then
		      return RGB( mb.Byte( 0 ), mb.Byte( 1 ), mb.Byte( 2 ) )
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PixelRGB(x As Uint32, y as uint32, assigns c as color)
		  #if TargetWin32
		    const fname = "_FreeImage_SetPixelColor@16"
		    Soft Declare function FreeImage_SetPixelColor Lib "FreeImage" _
		    Alias "_FreeImage_SetPixelColor@16" ( dib As Ptr, fix as UInt32, fiy as UInt32, value as Ptr ) as Boolean
		  #else
		    const fname = "FreeImage_SetPixelColor"
		    Soft Declare function FreeImage_SetPixelColor Lib "FreeImage" _
		    ( dib As Ptr, fix as UInt32, fiy as UInt32, value as Ptr ) as Boolean
		  #endif
		  
		  dim mb as new MemoryBlock( 8 )
		  'mb.Byte( 0 ) = c.Red
		  'mb.Byte( 1 ) = c.Green
		  'mb.Byte( 2 ) = c.Blue
		  mb.ColorValue( 0, 24 ) = c
		  mb.Byte( 3 ) = 255 ' full opacity
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    ' FreeImage's origin is bottom left; REALbasic's is top left. Leave X alone, but compensate by flipping the Y origin
		    call FreeImage_SetPixelColor( fi_dib, x, me.Height - y, mb )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PixelRGBA(x As Uint32, y as uint32, byref alpha As uint8) As color
		  #if TargetWin32
		    const fname = "_FreeImage_GetPixelColor@16"
		    Soft Declare function FreeImage_GetPixelColor Lib "FreeImage" _
		    Alias "_FreeImage_GetPixelColor@16" ( dib As Ptr, fix as UInt32, fiy as UInt32, value as Ptr ) as Boolean
		  #else
		    const fname = "FreeImage_GetPixelColor"
		    Soft Declare function FreeImage_GetPixelColor Lib "FreeImage" _
		    ( dib As Ptr, fix as UInt32, fiy as UInt32, value as Ptr ) as Boolean
		  #endif
		  
		  dim mb as new MemoryBlock( 8 )
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    if FreeImage_GetPixelColor( fi_dib, x, me.Height-y, mb ) then
		      ' FreeImage's origin is bottom left; REALbasic's is top left. Leave X alone, but compensate by flipping the Y origin
		      alpha = mb.UInt8Value( 3 )
		      Return RGB( mb.UInt8Value( 0 ), mb.UInt8Value( 1 ), mb.UInt8Value( 2 ) )
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PixelRGBA(x As Uint32, y as uint32, alpha as uint8, assigns c As color)
		  #if TargetWin32
		    const fname = "_FreeImage_SetPixelColor@16"
		    Soft Declare function FreeImage_SetPixelColor Lib "FreeImage" _
		    Alias "_FreeImage_SetPixelColor@16" ( dib As Ptr, fix as UInt32, fiy as UInt32, value as Ptr ) as Boolean
		  #else
		    const fname = "FreeImage_SetPixelColor"
		    Soft Declare function FreeImage_SetPixelColor Lib "FreeImage" _
		    ( dib As Ptr, fix as UInt32, fiy as UInt32, value as Ptr ) as Boolean
		  #endif
		  
		  
		  dim mb as new MemoryBlock( 8 )
		  mb.Byte( 0 ) = c.Red
		  mb.Byte( 1 ) = c.Green
		  mb.Byte( 2 ) = c.Blue
		  mb.Byte( 3 ) = alpha
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    ' FreeImage's origin is bottom left; REALbasic's is top left. Leave X alone, but compensate by flipping the Y origin
		    call FreeImage_SetPixelColor( fi_dib, x, me.Height - y, mb )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Rescale(width as integer, height as integer) As FreeImage
		  // If no filter method is passed, we'll pick Box as the default
		  Return Rescale( Width, Height, FI_FilterMethod.Box )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Rescale(width as integer, height as integer, filter as FI_FilterMethod) As FreeImage
		  #if TargetWin32
		    const fname = "_FreeImage_Rescale@16"
		    Soft Declare function FreeImage_Rescale Lib "FreeImage" _
		    Alias "_FreeImage_Rescale@16" ( dib as Ptr, dst_width as integer, dst_height as integer, fi_filter as FI_FilterMethod ) as ptr
		  #else
		    const fname = "FreeImage_Rescale"
		    Soft Declare function FreeImage_Rescale Lib "FreeImage" _
		    ( dib as Ptr, dst_width as integer, dst_height as integer, fi_filter as FI_FilterMethod ) as ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return new FreeImage( FreeImage_Rescale( fi_dib, width, height, filter ) )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Rotate180() As FreeImage
		  return RotateClassic( 180 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Rotate270() As FreeImage
		  return RotateClassic( 270 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Rotate90() As FreeImage
		  return RotateClassic( 90 )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RotateClassic(angle90 as double) As FreeImage
		  ' angle90 should be an integer multiple of 90 (eg, -90, 90, 180, 270), as RotateClassic retains image size and aspect.
		  ' note that this is not a requirement, however, so feel free to make this a public method.
		  
		  #if TargetWin32
		    const fname = "_FreeImage_RotateClassic@12"
		    Soft Declare function FreeImage_RotateClassic Lib "FreeImage" _
		    Alias "_FreeImage_RotateClassic@12" ( dib as Ptr, angle as Double ) as ptr
		  #else
		    const fname = "FreeImage_RotateClassic"
		    Soft Declare function FreeImage_RotateClassic Lib "FreeImage" _
		    ( dib as Ptr, angle as Double ) as ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return new FreeImage( FreeImage_RotateClassic( fi_dib, angle90 ) )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RotateEx(angle as double, x_shift as double=-1, y_shift as double=-1, x_origin as double=0, y_origin as double=0, use_mask as boolean = false) As FreeImage
		  
		  if x_origin = -1 then
		    x_origin = me.Width / 2
		  end if
		  
		  if y_origin = -1 then
		    y_origin = me.Height / 2
		  end if
		  
		  #if TargetWin32
		    const fname = "_FreeImage_RotateEx@48"
		    Soft Declare function FreeImage_RotateEx Lib "FreeImage" _
		    Alias "_FreeImage_RotateEx@48" ( dib as Ptr, angle as Double, xshift as double, yshift as double, xorigin as double, yorigin as double, usemask as boolean ) as ptr
		  #else
		    const fname = "FreeImage_RotateEx"
		    Soft Declare function FreeImage_RotateEx Lib "FreeImage" _
		    ( dib as Ptr, angle as Double, xshift as double, yshift as double, xorigin as double, yorigin as double, usemask as boolean ) as ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return new FreeImage( FreeImage_RotateEx( fi_dib, angle, x_shift, y_shift, x_origin, y_origin, use_mask ) )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Save(destination As FolderItem, FIF as FI_Format) As boolean
		  if destination = nil then return false
		  
		  // This function lacks the Flag parameter, so we'll just wrap the call and set it as appropriate. Format defaults are all zero, so...
		  
		  return Save( destination, FIF, FI_Flag(0) )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Save(destination As FolderItem, FIF as FI_Format, Flags As FI_Flag) As boolean
		  if destination = nil then return false
		  
		  #if TargetWin32
		    const fname = "_FreeImage_Save@16"
		    Soft Declare function FreeImage_Save Lib "FreeImage" _
		    Alias "_FreeImage_Save@16" ( fif as Integer, dib As Ptr, filename as cstring, flags as integer ) as Boolean
		  #else
		    const fname = "FreeImage_Save"
		    Soft Declare function FreeImage_Save Lib "FreeImage" _
		    ( fif as Integer, dib As Ptr, filename as cstring, flags as integer ) as Boolean
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return FreeImage_Save( Integer( FIF ), fi_dib, destination.AbsolutePath, Integer(Flags) )
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveToMemory(FIF as FI_Format) As memoryBlock
		  // This function lacks the Flag parameter, so we'll just wrap the call and set it as appropriate. Format defaults are all zero, so...
		  return SaveToMemory( FIF, FI_Flag(0) )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveToMemory(FIF as FI_Format, Flags As FI_Flag) As memoryBlock
		  ' this method does not work as-is -- do not use it. you've been warned. that being said...
		  #if TargetWin32
		    const fname1 = "_FreeImage_SaveToMemory@16"
		    const fname2 = "_FreeImage_TellMemory@4"
		    const fname3 = "_FreeImage_OpenMemory@8"
		    const fname4 = "_FreeImage_CloseMemory@4"
		    const fname5 = "_FreeImage_SeekMemory@12"
		    const fname6 = "_FreeImage_ReadMemory@16"
		    Soft Declare function FreeImage_SaveToMemory Lib "FreeImage" _
		    Alias "_FreeImage_SaveToMemory@16" ( fif as Integer, dib As Ptr, stream as Ptr, flags as integer ) as Boolean
		    Soft Declare function FreeImage_TellMemory Lib "FreeImage" _
		    Alias "_FreeImage_TellMemory@4" ( stream as Ptr ) as Int32
		    Soft Declare Function FreeImage_OpenMemory Lib "FreeImage" _
		    Alias "_FreeImage_OpenMemory@8" ( data As Ptr = nil, size_in_bytes as UInt32 = 0 ) as Ptr
		    Soft Declare sub FreeImage_CloseMemory Lib "FreeImage" _
		    Alias "_FreeImage_CloseMemory@4" ( stream as Ptr )
		    Soft Declare Function FreeImage_SeekMemory Lib "FreeImage" _
		    Alias "_FreeImage_SeekMemory@12" ( stream as Ptr, offset as integer, origin as integer ) As Boolean
		    Soft Declare Function FreeImage_ReadMemory Lib "FreeImage" _
		    Alias "_FreeImage_ReadMemory@16" ( buffer As Ptr, size As Uint32, count As Uint32, stream As Ptr ) As UInt32
		    
		  #else
		    const fname1 = "FreeImage_SaveToMemory"
		    const fname2 = "FreeImage_TellMemory"
		    const fname3 = "FreeImage_OpenMemory"
		    const fname4 = "FreeImage_CloseMemory"
		    const fname5 = "FreeImage_SeekMemory"
		    const fname6 = "FreeImage_ReadMemory"
		    
		    Soft Declare function FreeImage_SaveToMemory Lib "FreeImage" _
		    ( fif as Integer, dib As Ptr, stream as Ptr, flags as integer ) as Boolean
		    Soft Declare function FreeImage_TellMemory Lib "FreeImage" _
		    ( stream as Ptr ) as Int32
		    Soft Declare Function FreeImage_OpenMemory Lib "FreeImage" _
		    ( data As Ptr = nil, size_in_bytes as UInt32 = 0 ) as Ptr
		    Soft Declare sub FreeImage_CloseMemory Lib "FreeImage" _
		    ( stream as Ptr )
		    Soft Declare Sub FreeImage_Unload Lib "FreeImage" _
		    ( dib As Ptr )
		    Soft Declare Function FreeImage_SeekMemory Lib "FreeImage" _
		    ( stream as Ptr, offset as integer, origin as integer ) As Boolean
		    Soft Declare Function FreeImage_ReadMemory  Lib "FreeImage" _
		    ( buffer As Ptr, size As Uint32, count As Uint32, stream As Ptr ) As UInt32
		    
		  #endif
		  
		  
		  
		  if System.IsFunctionAvailable( fname1, "FreeImage" ) and _
		    System.isFunctionAvailable( fname2, "FreeImage" ) and _
		    System.isFunctionAvailable( fname3, "FreeImage" ) and _
		    System.isFunctionAvailable( fname4, "FreeImage" ) and _
		    System.isFunctionAvailable( fname5, "FreeImage" ) and _
		    System.isFunctionAvailable( fname6, "FreeImage" ) _
		    then
		    
		    dim stream as ptr = FreeImage_OpenMemory
		    dim mb As MemoryBlock
		    if FreeImage_SaveToMemory( Integer( FIF ), fi_dib, stream, Integer(Flags) ) then
		      ' how big is the stream?
		      dim size as integer = FreeImage_TellMemory( stream )
		      mb = new MemoryBlock( size )
		      
		      Call FreeImage_SeekMemory(stream, 0, 0)
		      Call FreeImage_ReadMemory( mb, mb.Size, 1, stream )
		    end if
		    FreeImage_CloseMemory( stream )
		    return mb
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveU(Destination As FolderItem, fif as FI_Format) As boolean
		  #if TargetWin32
		    if destination = nil then return false
		    
		    // This function lacks the Flag parameter, so we'll just wrap the call and set it as appropriate. Format defaults are all zero, so...
		    return SaveU( destination, FIF, FI_Flag(0) )
		  #else
		    Return save( Destination, fif )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveU(Destination As FolderItem, fif as FI_Format, Flag As FI_Flag) As boolean
		  #if TargetWin32
		    if Destination = nil then return false
		    
		    const fname = "_FreeImage_SaveU@16"
		    
		    Soft Declare function FreeImage_SaveU Lib "FreeImage" _
		    Alias "_FreeImage_SaveU@16" ( fif as Integer, dib As Ptr, filename as cstring, flags as integer ) as Boolean
		    
		    if System.IsFunctionAvailable( fname, "FreeImage" ) then
		      return FreeImage_SaveU( Integer( fif ), fi_dib, Destination.AbsolutePath, integer(flag) )
		    else
		      return false
		    end if
		  #else
		    Return Save( Destination, fif, flag )
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetMask(mask as FreeImage) As FreeImage
		  if mask = nil then return nil
		  
		  dim greymask As FreeImage 
		  if mask.GetBPP <> 8 then
		    greymask = mask.Greyscale
		    if greymask = nil then return nil
		  else
		    greymask = mask
		  end if
		  
		  dim me32 as FreeImage
		  
		  if me.GetBPP <> 32 then
		    me32 = me.ConvertTo32Bits
		    if me32.fi_dib = nil then return nil
		  else
		    me32 = me.Clone
		  end if
		  
		  #if TargetWin32
		    const fname = "_FreeImage_SetChannel@12"
		    Soft Declare function FreeImage_SetChannel Lib "FreeImage" _
		    Alias "_FreeImage_SetChannel@12" ( dib as Ptr, dib8 As Ptr, channel as Int8 ) as Boolean
		  #else
		    const fname = "FreeImage_SetChannel"
		    Soft Declare function FreeImage_SetChannel Lib "FreeImage" _
		    ( dib as Ptr, dib8 As Ptr, channel As Int8 ) as Boolean
		  #endif
		  
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    ' 4 = alpha channel
		    if FreeImage_SetChannel( me32.fi_dib, greymask.fi_dib, 4 ) then
		      return me32
		    end if
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SwapColors(ColorA As Color, ColorB As Color, Ignore_Alpha As Boolean) As FreeImage
		  
		  dim ca as new MemoryBlock( 8 )
		  ca.Byte( 0 ) = ColorA.Red
		  ca.Byte( 1 ) = ColorA.Green
		  ca.Byte( 2 ) = ColorA.Blue
		  ' byte 3 is reserved
		  
		  dim cb as new MemoryBlock( 8 )
		  cb.Byte( 0 ) = ColorB.Red
		  cb.Byte( 1 ) = ColorB.Green
		  cb.Byte( 2 ) = ColorB.Blue
		  ' byte 3 is reserved
		  
		  
		  // I'm not sure this function is working properly. It requires more attention
		  #if TargetWin32
		    const fname = "_FreeImage_SwapColors@16"
		    Soft Declare function FreeImage_SwapColors Lib "FreeImage" _
		    Alias "_FreeImage_SwapColors@16" ( dib As Ptr, colora as Ptr, colorb as Ptr, ignore_alpha as boolean ) as UInt32
		  #else
		    const fname = "FreeImage_SwapColors"
		    Soft Declare function FreeImage_SwapColors Lib "FreeImage" _
		    ( dib As Ptr, colora as Ptr, colorb as Ptr, ignore_alpha as boolean ) as UInt32
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    dim ret as FreeImage = me.Clone
		    // Need to figure out exactly what we should do with the LUT value. Until then, this probably won't work as expected
		    dim changed As integer = FreeImage_SwapColors( ret.fi_dib, ca, cb, Ignore_Alpha )
		    Mod_FreeImage.PixelsChanged = changed
		    
		    Return ret
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Threshold(t As Uint8) As FreeImage
		  #if TargetWin32
		    const fname = "_FreeImage_Threshold@8"
		    Soft Declare function FreeImage_Threshold Lib "FreeImage" _
		    Alias "_FreeImage_Threshold@8" ( dib as Ptr, thr as UInt8 ) as ptr
		  #else
		    const fname = "FreeImage_Threshold"
		    Soft Declare function FreeImage_Threshold Lib "FreeImage" _
		    ( dib as Ptr, thr as Uint8 ) as ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return new FreeImage( FreeImage_Threshold( fi_dib, t ) )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToneMapping(Algorithm As FI_ToneMapAlgorithm, Param1 As Double, Param2 As Double) As FreeImage
		  select case Algorithm
		  case FI_ToneMapAlgorithm.Drago03
		    return ToneMapping_Drago( Param1, Param2 )
		  case FI_ToneMapAlgorithm.Reinhard05
		    return ToneMapping_Reinhard( Param1, Param2 )
		  case FI_ToneMapAlgorithm.Fattal02
		    return ToneMapping_Fattal( Param1, Param2 )
		  end select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToneMapping_Drago(Gamma As Double = 2.2, Exposure As Double = 0) As FreeImage
		  #if TargetWin32
		    const fname = "_FreeImage_TmoDrago03@20"
		    Soft Declare function FreeImage_TmoDrago03 Lib "FreeImage" _
		    Alias "_FreeImage_TmoDrago03@20" ( dib as Ptr, gamma as double, exposure as double ) as ptr
		  #else
		    const fname = "FreeImage_TmoDrago03"
		    Soft Declare function FreeImage_TmoDrago03 Lib "FreeImage" _
		    ( dib as Ptr, gamma as double, exposure as double ) as ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return new FreeImage( FreeImage_TmoDrago03( fi_dib, Gamma, Exposure ) )
		  end if
		  
		  
		  'DLL_API FIBITMAP* DLL_CALLCONV FreeImage_TmoDrago03(FIBITMAP *src, double gamma FI_DEFAULT(2.2), double exposure FI_DEFAULT(0));
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToneMapping_Fattal(Color_Saturation As Double = 0.5, Attenuation As Double = 0.85) As FreeImage
		  #if TargetWin32
		    const fname = "_FreeImage_TmoFattal02@20"
		    Soft Declare function FreeImage_TmoFattal02 Lib "FreeImage" _
		    Alias "_FreeImage_TmoFattal02@20" ( dib as Ptr, Color_Saturation as double, Attenuation as double ) as ptr
		  #else
		    const fname = "FreeImage_TmoFattal02"
		    Soft Declare function FreeImage_TmoFattal02 Lib "FreeImage" _
		    ( dib as Ptr, Color_Saturation as double, Attenuation as double ) as ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return new FreeImage( FreeImage_TmoFattal02( fi_dib, Color_Saturation, Attenuation ) )
		  end if
		  
		  
		  'DLL_API FIBITMAP *DLL_CALLCONV FreeImage_TmoFattal02(FIBITMAP *src, double color_saturation FI_DEFAULT(0.5), double attenuation FI_DEFAULT(0.85));
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToneMapping_Reinhard(Intensity As Double = 0, Contrast As Double = 0) As FreeImage
		  #if TargetWin32
		    const fname = "_FreeImage_TmoReinhard05@20"
		    Soft Declare function FreeImage_TmoReinhard05 Lib "FreeImage" _
		    Alias "_FreeImage_TmoReinhard05@20" ( dib as Ptr, intensity as double, contrast as double ) as ptr
		  #else
		    const fname = "FreeImage_TmoReinhard05"
		    Soft Declare function FreeImage_TmoReinhard05 Lib "FreeImage" _
		    ( dib as Ptr, intensity as double, contrast as double ) as ptr
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return new FreeImage( FreeImage_TmoReinhard05( fi_dib, Intensity, Contrast ) )
		  end if
		  
		  
		  'DLL_API FIBITMAP* DLL_CALLCONV FreeImage_TmoReinhard05(FIBITMAP *src, double intensity FI_DEFAULT(0), double contrast FI_DEFAULT(0));
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Width() As Uint32
		  #if TargetWin32
		    const fname = "_FreeImage_GetWidth@4"
		    Soft Declare Function FreeImage_GetWidth Lib "FreeImage" _
		    Alias "_FreeImage_GetWidth@4" ( dib As Ptr ) As Uint32
		  #else
		    const fname = "FreeImage_GetWidth"
		    Soft Declare Function FreeImage_GetWidth Lib "FreeImage" _
		    ( dib As Ptr ) As Uint32
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return FreeImage_GetWidth( fi_dib )
		  else
		    return -1
		  end if
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWin32
			    const fname = "_FreeImage_GetBackgroundColor@8"
			    Soft Declare function FreeImage_GetBackgroundColor Lib "FreeImage" _
			    Alias "_FreeImage_GetBackgroundColor@8" ( dib As Ptr, bkcolor as Ptr ) as Boolean
			  #else
			    const fname = "FreeImage_GetBackgroundColor"
			    Soft Declare function FreeImage_GetBackgroundColor Lib "FreeImage" _
			    ( dib As Ptr, bkcolor as Ptr ) as Boolean
			  #endif
			  
			  dim mb as new MemoryBlock( 8 )
			  
			  if System.IsFunctionAvailable( fname, "FreeImage" ) then
			    call FreeImage_GetBackgroundColor( fi_dib, mb )
			    
			    return RGB( mb.Byte( 0 ), mb.Byte( 1 ),mb.Byte( 2 ) )
			    
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  'DLL_API BOOL DLL_CALLCONV FreeImage_SetBackgroundColor(FIBITMAP *dib, RGBQUAD  *bkcolor);  
			  
			  dim mb as new MemoryBlock( 8 )
			  mb.Byte( 0 ) = value.Red
			  mb.Byte( 1 ) = value.Green
			  mb.Byte( 2 ) = value.Blue
			  ' byte 3 is reserved
			  
			  
			  #if TargetWin32
			    const fname = "_FreeImage_SetBackgroundColor@8"
			    Soft Declare function FreeImage_SetBackgroundColor Lib "FreeImage" _
			    Alias "_FreeImage_SetBackgroundColor@8" ( dib As Ptr, bkcolor as Ptr ) as Boolean
			  #else
			    const fname = "FreeImage_SetBackgroundColor"
			    Soft Declare function FreeImage_SetBackgroundColor Lib "FreeImage" _
			    ( dib As Ptr, bkcolor as Ptr ) as Boolean
			  #endif
			  
			  if System.IsFunctionAvailable( fname, "FreeImage" ) then
			    call FreeImage_SetBackgroundColor( fi_dib, mb )
			  end if
			  
			  '#ifdef FUNCTION_BIGENDIAN
			  'BYTE rgbRed;
			  'BYTE rgbGreen;
			  'BYTE rgbBlue;
			  '#else
			  'BYTE rgbBlue;
			  'BYTE rgbGreen;
			  'BYTE rgbRed;
			  '#endif // FUNCTION_BIGENDIAN
			  'BYTE rgbReserved;
			  '} RGBQUAD;
			  
			  
			End Set
		#tag EndSetter
		BackgroundColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  'DLL_API unsigned DLL_CALLCONV FreeImage_GetDotsPerMeterY(FIBITMAP *dib);
			  
			  
			  #if TargetWin32
			    const fname = "_FreeImage_GetDotsPerMeterX@4"
			    Soft Declare Function FreeImage_GetDotsPerMeterX Lib "FreeImage" _
			    Alias "_FreeImage_GetDotsPerMeterX@4" ( dib As Ptr ) as UInt32
			  #else
			    const fname = "FreeImage_GetDotsPerMeterX"
			    Soft Declare Function FreeImage_GetDotsPerMeterX Lib "FreeImage" _
			    ( dib As Ptr ) as Uint32
			  #endif
			  
			  if System.IsFunctionAvailable( fname, "FreeImage" ) then
			    return FreeImage_GetDotsPerMeterX( fi_dib )
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  'DLL_API unsigned DLL_CALLCONV FreeImage_GetDotsPerMeterY(FIBITMAP *dib);
			  
			  
			  #if TargetWin32
			    const fname = "_FreeImage_SetDotsPerMeterX@8"
			    Soft Declare Sub FreeImage_SetDotsPerMeterX Lib "FreeImage" _
			    Alias "_FreeImage_SetDotsPerMeterX@8" ( dib As Ptr, res as Uint32 )
			  #else
			    const fname = "FreeImage_SetDotsPerMeterX"
			    Soft Declare Sub FreeImage_SetDotsPerMeterX Lib "FreeImage" _
			    ( dib As Ptr, res As Uint32 )
			  #endif
			  
			  if System.IsFunctionAvailable( fname, "FreeImage" ) then
			    FreeImage_SetDotsPerMeterX( fi_dib, value )
			  end if
			End Set
		#tag EndSetter
		DotsPerMeterX As Uint32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  'DLL_API unsigned DLL_CALLCONV FreeImage_GetDotsPerMeterY(FIBITMAP *dib);
			  
			  
			  #if TargetWin32
			    const fname = "_FreeImage_GetDotsPerMeterY@4"
			    Soft Declare Function FreeImage_GetDotsPerMeterY Lib "FreeImage" _
			    Alias "_FreeImage_GetDotsPerMeterY@4" ( dib As Ptr ) as UInt32
			  #else
			    const fname = "FreeImage_GetDotsPerMeterY"
			    Soft Declare Function FreeImage_GetDotsPerMeterY Lib "FreeImage" _
			    ( dib As Ptr ) as Uint32
			  #endif
			  
			  if System.IsFunctionAvailable( fname, "FreeImage" ) then
			    return FreeImage_GetDotsPerMeterY( fi_dib )
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  'DLL_API unsigned DLL_CALLCONV FreeImage_GetDotsPerMeterY(FIBITMAP *dib);
			  
			  
			  #if TargetWin32
			    const fname = "_FreeImage_SetDotsPerMeterY@8"
			    Soft Declare Sub FreeImage_SetDotsPerMeterY Lib "FreeImage" _
			    Alias "_FreeImage_SetDotsPerMeterY@8" ( dib As Ptr, res as Uint32 )
			  #else
			    const fname = "FreeImage_SetDotsPerMeterY"
			    Soft Declare Sub FreeImage_SetDotsPerMeterY Lib "FreeImage" _
			    ( dib As Ptr, res As Uint32 )
			  #endif
			  
			  if System.IsFunctionAvailable( fname, "FreeImage" ) then
			    FreeImage_SetDotsPerMeterY( fi_dib, value )
			  end if
			End Set
		#tag EndSetter
		DotsPerMeterY As Uint32
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private fi_dib As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWin32
			    const fname = "_FreeImage_IsTransparent@4"
			    Soft Declare Function FreeImage_IsTransparent Lib "FreeImage" _
			    Alias "_FreeImage_IsTransparent@4" ( dib As Ptr ) as Boolean
			  #else
			    const fname = "FreeImage_IsTransparent"
			    Soft Declare Function FreeImage_IsTransparent Lib "FreeImage" _
			    ( dib As Ptr ) as Boolean
			  #endif
			  
			  if System.IsFunctionAvailable( fname, "FreeImage" ) then
			    return FreeImage_IsTransparent( fi_dib )
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetWin32
			    const fname = "_FreeImage_SetTransparent@8"
			    Soft Declare Sub FreeImage_SetTransparent Lib "FreeImage" _
			    Alias "_FreeImage_SetTransparent@8" ( dib As Ptr, use As Boolean )
			  #else
			    const fname = "FreeImage_SetTransparent"
			    Soft Declare Sub FreeImage_SetTransparent Lib "FreeImage" _
			    ( dib As Ptr, use As Boolean )
			  #endif
			  
			  if System.IsFunctionAvailable( fname, "FreeImage" ) then
			    FreeImage_SetTransparent( fi_dib, value )
			  end if
			End Set
		#tag EndSetter
		HasTransparency As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="BackgroundColor"
			Group="Behavior"
			InitialValue="&h000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasTransparency"
			Group="Behavior"
			InitialValue="0"
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
