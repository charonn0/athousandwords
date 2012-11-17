#tag Module
Protected Module Mod_FreeImage
	#tag Method, Flags = &h1
		Protected Function Copyright() As String
		  'DLL_API const char *DLL_CALLCONV FreeImage_GetCopyrightMessage();
		  
		  
		  
		  #if TargetWin32
		    const fname = "_FreeImage_GetCopyrightMessage@0"
		    Soft Declare Function FreeImage_GetCopyrightMessage Lib "FreeImage" _
		    Alias "_FreeImage_GetCopyrightMessage@0" ( ) As CString
		  #else
		    const fname = "FreeImage_GetCopyrightMessage"
		    Soft Declare Function FreeImage_GetCopyrightMessage Lib "FreeImage" ( ) As CString
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return FreeImage_GetCopyrightMessage()
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CRC32(CRC As Uint32, Source As MemoryBlock, Source_Size As Uint32) As Uint32
		  'DLL_API DWORD DLL_CALLCONV FreeImage_ZLibCRC32(DWORD crc, BYTE *source, DWORD source_size);
		  
		  #if TargetWin32
		    const fname = "_FreeImage_ZLibCRC32@12"
		    Soft Declare Function FreeImage_ZLibCRC32 Lib "FreeImage" _
		    Alias "_FreeImage_ZLibCRC32@12" ( crc as UInt32, source as ptr, source_size as UInt32 ) as UInt32
		  #else
		    const fname = "FreeImage_ZLibCRC32"
		    Soft Declare Function FreeImage_ZLibCRC32 Lib "FreeImage" ( callback as Ptr ) as UInt32
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) _
		    and Source <> Nil then
		    Return FreeImage_ZLibCRC32( CRC, Source, Source_Size )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CRC32(CRC As Uint32, Data As String) As Uint32
		  dim source As new MemoryBlock( data.LenB )
		  source.StringValue( 0, source.Size ) = Data
		  
		  Return CRC32( CRC, Source, Source.Size )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetFIFDescription(FIF As FI_Format) As String
		  'DLL_API const char *DLL_CALLCONV FreeImage_GetFIFDescription(FREE_IMAGE_FORMAT fif);
		  
		  #if TargetWin32
		    const fname = "_FreeImage_GetFIFDescription@4"
		    Soft Declare function FreeImage_GetFIFDescription Lib "FreeImage" _
		    Alias "_FreeImage_GetFIFDescription@4" ( FIF as FI_Format ) as CString
		  #else
		    const fname = "FreeImage_GetFIFDescription"
		    Soft Declare function FreeImage_GetFIFDescription Lib "FreeImage" ( FIF as FI_Format ) as CString
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return FreeImage_GetFIFDescription( FIF )
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetFIFExtensionList(FIF As FI_Format) As String
		  'DLL_API const char *DLL_CALLCONV FreeImage_GetFIFExtensionList(FREE_IMAGE_FORMAT fif);
		  
		  #if TargetWin32
		    const fname = "_FreeImage_GetFIFExtensionList@4"
		    Soft Declare function FreeImage_GetFIFExtensionList  Lib "FreeImage" _
		    Alias "_FreeImage_GetFIFExtensionList@4" ( FIF as fi_format ) as CString
		  #else
		    const fname = "FreeImage_GetFIFExtensionList "
		    Soft Declare function FreeImage_GetFIFExtensionList  Lib "FreeImage" ( FIF as FI_Format ) as CString
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return FreeImage_GetFIFExtensionList( FIF )
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetFIFFromFilename(File as FolderItem) As FI_Format
		  'DLL_API FREE_IMAGE_FORMAT DLL_CALLCONV FreeImage_GetFIFFromFilename(const char *filename);
		  
		  #if TargetWin32
		    const fname = "_FreeImage_GetFIFFromFilename@4"
		    Soft Declare function FreeImage_GetFIFFromFilename Lib "FreeImage" _
		    Alias "_FreeImage_GetFIFFromFilename@4" ( filename as CString ) as FI_Format
		  #else
		    const fname = "FreeImage_GetFIFFromFilename"
		    Soft Declare function FreeImage_GetFIFFromFilename Lib "FreeImage" ( filename as CString ) as FI_Format
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) _
		    and File <> nil then
		    return FreeImage_GetFIFFromFilename( File.Name )
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetFIFFromFilenameU(File as FolderItem) As FI_Format
		  'DLL_API FREE_IMAGE_FORMAT DLL_CALLCONV FreeImage_GetFIFFromFilenameU(const wchar_t *filename);
		  
		  #if TargetWin32
		    const fname = "_FreeImage_GetFIFFromFilenameU@4"
		    Soft Declare function FreeImage_GetFIFFromFilenameU Lib "FreeImage" _
		    Alias "_FreeImage_GetFIFFromFilenameU@4" ( filename as WString ) as FI_Format
		    
		    
		    if System.IsFunctionAvailable( fname, "FreeImage" ) _
		      and File <> nil then
		      return FreeImage_GetFIFFromFilenameU( File.Name )
		      
		    end if
		    
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetFIFFromMime(MIME As String) As FI_Format
		  'DLL_API const char *DLL_CALLCONV FreeImage_GetFIFFromMime (FREE_IMAGE_FORMAT fif);
		  
		  #if TargetWin32
		    const fname = "_FreeImage_GetFIFFromMime@4"
		    Soft Declare function FreeImage_GetFIFFromMime  Lib "FreeImage" _
		    Alias "_FreeImage_GetFIFFromMime@4" ( MIME as CString ) as FI_Format
		  #else
		    const fname = "FreeImage_GetFIFFromMime "
		    Soft Declare function FreeImage_GetFIFFromMime  Lib "FreeImage" ( MIME as CString ) as FI_Format
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return FreeImage_GetFIFFromMime ( mime )
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetFIFMimeType(FIF As FI_Format) As String
		  'DLL_API const char *DLL_CALLCONV FreeImage_GetFIFMimeType(FREE_IMAGE_FORMAT fif);
		  
		  #if TargetWin32
		    const fname = "_FreeImage_GetFIFMimeType@4"
		    Soft Declare function FreeImage_GetFIFMimeType  Lib "FreeImage" _
		    Alias "_FreeImage_GetFIFMimeType@4" ( FIF as fi_format ) as CString
		  #else
		    const fname = "FreeImage_GetFIFMimeType "
		    Soft Declare function FreeImage_GetFIFMimeType  Lib "FreeImage" ( FIF as FI_Format ) as CString
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return FreeImage_GetFIFMimeType( FIF )
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetFIFRegExpr(FIF As FI_Format) As String
		  #if TargetWin32
		    const fname = "_FreeImage_GetFIFRegExpr@4"
		    Soft Declare function FreeImage_GetFIFRegExpr Lib "FreeImage" _
		    Alias "_FreeImage_GetFIFRegExpr@4" ( FIF as FI_Format ) as CString
		  #else
		    const fname = "FreeImage_GetFIFRegExpr"
		    Soft Declare function FreeImage_GetFIFRegExpr Lib "FreeImage" ( FIF as FI_Format ) as CString
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return FreeImage_GetFIFRegExpr( FIF )
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFormatFromFIF(Extends FIF As FI_Format) As String
		  'DLL_API const char *DLL_CALLCONV FreeImage_GetFormatFromFIF(FREE_IMAGE_FORMAT fif);
		  
		  #if TargetWin32
		    const fname = "_FreeImage_GetFormatFromFIF@4"
		    Soft Declare function FreeImage_GetFormatFromFIF Lib "FreeImage" _
		    Alias "_FreeImage_GetFormatFromFIF@4" ( FIF as FI_Format ) as CString
		  #else
		    const fname = "FreeImage_GetFormatFromFIF"
		    Soft Declare function FreeImage_GetFormatFromFIF Lib "FreeImage" ( FIF as FI_Format ) as CString
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return FreeImage_GetFormatFromFIF( FIF )
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GUnZip(In_Data As MemoryBlock, Size As Uint32, Uncompressed_Size As Uint32 = 0, ByRef DataLength As Uint32) As MemoryBlock
		  'DLL_API DWORD DLL_CALLCONV FreeImage_ZLibGZip(BYTE *target, DWORD target_size, BYTE *source, DWORD source_size);
		  
		  #if TargetWin32
		    const fname = "_FreeImage_ZLibGUnzip@16"
		    Soft Declare function FreeImage_ZLibGUnzip Lib "FreeImage" _
		    Alias "_FreeImage_ZLibGUnzip@16" ( target as Ptr, target_size as UInt32, source as ptr, source_size as UInt32 ) as UInt32
		  #else
		    const fname = "FreeImage_ZLibGUnzip"
		    Soft Declare function FreeImage_ZLibGUnzip Lib "FreeImage" _
		    ( target as Ptr, target_size as UInt32, source as ptr, source_size as UInt32 ) as UInt32
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) _
		    and In_Data <> nil then
		    
		    // From the FreeImage documentation:
		    // ===
		    // Upon entry, target_size is the total size of the destination buffer, which must be large enough to hold the
		    // entire uncompressed data. The size of the uncompressed data must have been saved previously by the
		    // compressor and transmitted to the decompressor by some mechanism outside the scope of this compression library.
		    // ===
		    // Ideally, the end user should be saving this value and passing it in as appropriate. However, this may not always be
		    // the case. After running some tests on ASCII data (which compress well -- 33.097% of their original size), we can
		    // guess a good buffer size if we're not passed one
		    
		    dim out_data As MemoryBlock
		    
		    if Uncompressed_Size = 0 then
		      out_data = new MemoryBlock( size*3.5 ) // a little over what we think the uncompressed size may be
		    else
		      out_data = new MemoryBlock( Uncompressed_Size )
		    end if
		    
		    DataLength = FreeImage_ZLibGUnzip( out_data, out_data.Size, In_Data, Size )
		    Return out_data
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GUnZip(In_Data As String, Uncompressed_Size As Uint32 = 0) As String
		  dim in_mb As new MemoryBlock( In_Data.LenB )
		  in_mb.StringValue( 0, in_mb.Size ) = In_Data
		  
		  dim datalength As UInt32
		  dim out_data As MemoryBlock = GUnZip( in_mb, in_mb.Size, Uncompressed_Size, datalength )
		  
		  if out_data <> nil then
		    Return out_data.StringValue( 0, datalength )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GZip(In_Data As MemoryBlock, In_Size As Uint32, Byref DataLength As uint32) As MemoryBlock
		  'DLL_API DWORD DLL_CALLCONV FreeImage_ZLibGZip(BYTE *target, DWORD target_size, BYTE *source, DWORD source_size);
		  
		  #if TargetWin32
		    const fname = "_FreeImage_ZLibGZip@16"
		    Soft Declare function FreeImage_ZLibGZip Lib "FreeImage" _
		    Alias "_FreeImage_ZLibGZip@16" ( target as Ptr, target_size as UInt32, source as ptr, source_size as UInt32 ) as UInt32
		  #else
		    const fname = "FreeImage_ZLibGZip"
		    Soft Declare function FreeImage_ZLibGZip Lib "FreeImage" _
		    ( target as Ptr, target_size as UInt32, source as ptr, source_size as UInt32 ) as UInt32
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    '(DWORD)((double) original_size + (0.1 * (double) original_size) + 24);
		    dim out_data As new MemoryBlock( 1.1*In_Size + 24 )
		    DataLength = FreeImage_ZLibGZip( out_data, out_data.Size, In_Data, In_Size )
		    Return out_data
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GZip(In_Data As String) As String
		  // This method is just a handy wrapper for the MemoryBlock version of GZip
		  dim in_mb As new MemoryBlock( In_Data.LenB )
		  in_mb.StringValue( 0, in_mb.Size ) = In_Data
		  
		  dim compressed As UInt32
		  dim out_data as MemoryBlock = GZip( in_mb, in_mb.Size, compressed )
		  
		  if out_data <> nil then
		    Return out_data.StringValue( 0, compressed )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsAvailable() As Boolean
		  #if TargetWin32
		    const fname = "_FreeImage_Allocate@24"
		    Soft Declare function FreeImage_Allocate Lib "FreeImage" _
		    Alias "_FreeImage_Allocate@24" ( w As Integer, h As Integer, b As Integer, rmask As UInt32, bmask As UInt32, gmask As Uint32 ) as ptr
		  #else
		    const fname = "FreeImage_Allocate"
		    Soft Declare function FreeImage_Allocate Lib "FreeImage" _
		    ( w As Integer, h As Integer, b As Integer, rmask As UInt32, bmask As UInt32, gmask As Uint32 ) as ptr
		  #endif
		  
		  return System.IsFunctionAvailable( fname, "FreeImage" )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LookupColorSVG(ColorName As String, ByRef Result As Color) As Boolean
		  'DLL_API BOOL DLL_CALLCONV FreeImage_LookupSVGColor(const char *szColor, BYTE *nRed, BYTE *nGreen, BYTE *nBlue);
		  
		  dim r,g,b As UInt8
		  
		  #if TargetWin32
		    const fname = "_FreeImage_LookupSVGColor@16"
		    Soft Declare Function FreeImage_LookupSVGColor Lib "FreeImage" _
		    Alias "_FreeImage_LookupSVGColor@16" ( szColor as CString, byref red as uint8, byref green as uint8, byref blue as uint8 ) As Boolean
		  #else
		    const fname = "FreeImage_LookupSVGColor"
		    Soft Declare Function FreeImage_LookupSVGColor Lib "FreeImage" ( szColor as string, byref red as uint8, byref green as uint8, byref blue as uint8 ) As Boolean
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    if FreeImage_LookupSVGColor( ColorName, r, g, b ) then
		      Result = RGB( r, g, b )
		      Return True
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LookupColorX11(ColorName As String, ByRef Result As Color) As boolean
		  'DLL_API BOOL DLL_CALLCONV FreeImage_LookupX11Color(const char *szColor, BYTE *nRed, BYTE *nGreen, BYTE *nBlue);
		  
		  dim r,g,b As UInt8
		  
		  #if TargetWin32
		    const fname = "_FreeImage_LookupX11Color@16"
		    Soft Declare Function FreeImage_LookupX11Color Lib "FreeImage" _
		    Alias "_FreeImage_LookupX11Color@16" ( szColor as CString, byref red as uint8, byref green as uint8, byref blue as uint8 ) As Boolean
		  #else
		    const fname = "FreeImage_LookupX11Color"
		    Soft Declare Function FreeImage_LookupX11Color Lib "FreeImage" ( szColor as string, byref red as uint8, byref green as uint8, byref blue as uint8 ) As Boolean
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    if FreeImage_LookupX11Color( ColorName, r, g, b ) then
		      Result = RGB( r, g, b )
		      return true
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SupportsReading(Extends FIF As FI_Format) As Boolean
		  'DLL_API BOOL DLL_CALLCONV FreeImage_FIFSupportsReading(FREE_IMAGE_FORMAT fif);
		  
		  #if TargetWin32
		    const fname = "_FreeImage_FIFSupportsReading@4"
		    Soft Declare function FreeImage_FIFSupportsReading  Lib "FreeImage" _
		    Alias "_FreeImage_FIFSupportsReading@4" ( FIF as fi_format ) as Boolean
		  #else
		    const fname = "FreeImage_FIFSupportsReading "
		    Soft Declare function FreeImage_FIFSupportsReading  Lib "FreeImage" ( FIF as FI_Format ) as Boolean
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return FreeImage_FIFSupportsReading( FIF )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SupportsWriting(Extends FIF As FI_Format) As Boolean
		  'DLL_API BOOL DLL_CALLCONV FreeImage_FIFSupportsWriting(FREE_IMAGE_FORMAT fif);
		  
		  #if TargetWin32
		    const fname = "_FreeImage_FIFSupportsWriting@4"
		    Soft Declare function FreeImage_FIFSupportsWriting  Lib "FreeImage" _
		    Alias "_FreeImage_FIFSupportsWriting@4" ( FIF as fi_format ) as Boolean
		  #else
		    const fname = "FreeImage_FIFSupportsWriting "
		    Soft Declare function FreeImage_FIFSupportsWriting  Lib "FreeImage" ( FIF as FI_Format ) as Boolean
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return FreeImage_FIFSupportsWriting( FIF )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function TransformJPEG(Extends Source As FolderItem, Destination As FolderItem, Op As FI_JPEGTransform, Perfect As Boolean = False) As Boolean
		  'DLL_API BOOL DLL_CALLCONV FreeImage_JPEGTransform(const char *src_file, const char *dst_file, FREE_IMAGE_JPEG_OPERATION operation, BOOL perfect FI_DEFAULT(FALSE));
		  
		  if not source.Exists or source.Directory or Destination = nil then
		    return false
		  end if
		  
		  #if TargetWin32
		    const fname = "_FreeImage_JPEGTransform@16"
		    Soft Declare function FreeImage_JPEGTransform Lib "FreeImage" _
		    Alias "_FreeImage_JPEGTransform@16" ( source_file as cstring, destination_file as cstring, op as byte, perfect as boolean ) as Boolean
		  #else
		    const fname = "FreeImage_RotateClassic"
		    Soft Declare function FreeImage_JPEGTransform Lib "FreeImage" _
		    ( source_file as cstring, destination_file as cstring, op as byte, perfect as boolean ) as Boolean
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    return FreeImage_JPEGTransform( source.AbsolutePath, Destination.AbsolutePath, integer(op), perfect )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Version() As String
		  'DLL_API const char *DLL_CALLCONV FreeImage_GetVersion();
		  
		  
		  
		  #if TargetWin32
		    const fname = "_FreeImage_GetVersion@0"
		    Soft Declare Function FreeImage_GetVersion Lib "FreeImage" _
		    Alias "_FreeImage_GetVersion@0" ( ) As CString
		  #else
		    const fname = "FreeImage_GetVersion"
		    Soft Declare Function FreeImage_GetVersion Lib "FreeImage" ( ) As CString
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    Return FreeImage_GetVersion()
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ZLibCompress(In_Data As MemoryBlock, In_Size As Uint32, Byref DataLength As uint32) As MemoryBlock
		  'DLL_API DWORD DLL_CALLCONV FreeImage_ZLibCompress(BYTE *target, DWORD target_size, BYTE *source, DWORD source_size);
		  
		  #if TargetWin32
		    const fname = "_FreeImage_ZLibCompress@16"
		    Soft Declare function FreeImage_ZLibCompress Lib "FreeImage" _
		    Alias "_FreeImage_ZLibCompress@16" ( target as Ptr, target_size as UInt32, source as ptr, source_size as UInt32 ) as UInt32
		  #else
		    const fname = "FreeImage_ZLibCompress"
		    Soft Declare function FreeImage_ZLibCompress Lib "FreeImage" _
		    ( target as Ptr, target_size as UInt32, source as ptr, source_size as UInt32 ) as UInt32
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) then
		    '(DWORD)((double) original_size + (0.1 * (double) original_size) + 12);
		    dim out_data As new MemoryBlock( 1.1*In_Size + 12 )
		    DataLength = FreeImage_ZLibCompress( out_data, out_data.Size, In_Data, In_Size )
		    Return out_data
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ZLibCompress(In_Data As String) As String
		  // This method is just a handy wrapper for the MemoryBlock version of ZLibCompress
		  dim in_mb As new MemoryBlock( In_Data.LenB )
		  in_mb.StringValue( 0, in_mb.Size ) = In_Data
		  
		  dim compressed As UInt32
		  dim out_data as MemoryBlock = ZLibCompress( in_mb, in_mb.Size, compressed )
		  
		  if out_data <> nil then
		    Return out_data.StringValue( 0, compressed )
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ZLibUncompress(In_Data As MemoryBlock, Size As Uint32, Uncompressed_Size As Uint32 = 0, ByRef DataLength As Uint32) As MemoryBlock
		  'DLL_API DWORD DLL_CALLCONV FreeImage_ZLibUncompress(BYTE *target, DWORD target_size, BYTE *source, DWORD source_size);
		  
		  #if TargetWin32
		    const fname = "_FreeImage_ZLibUncompress@16"
		    Soft Declare function FreeImage_ZLibUncompress Lib "FreeImage" _
		    Alias "_FreeImage_ZLibUncompress@16" ( target as Ptr, target_size as UInt32, source as ptr, source_size as UInt32 ) as UInt32
		  #else
		    const fname = "FreeImage_ZLibUncompress"
		    Soft Declare function FreeImage_ZLibUncompress Lib "FreeImage" _
		    ( target as Ptr, target_size as UInt32, source as ptr, source_size as UInt32 ) as UInt32
		  #endif
		  
		  if System.IsFunctionAvailable( fname, "FreeImage" ) _
		    and In_Data <> nil then
		    
		    // From the FreeImage documentation:
		    // ===
		    // Upon entry, target_size is the total size of the destination buffer, which must be large enough to hold the
		    // entire uncompressed data. The size of the uncompressed data must have been saved previously by the
		    // compressor and transmitted to the decompressor by some mechanism outside the scope of this compression library.
		    // ===
		    // Ideally, the end user should be saving this value and passing it in as appropriate. However, this may not always be
		    // the case. After running some tests on ASCII data (which compress well -- 33.097% of their original size), we can
		    // guess a good buffer size if we're not passed one
		    
		    dim out_data As MemoryBlock
		    
		    if Uncompressed_Size = 0 then
		      out_data = new MemoryBlock( size*3.5 ) // a little over what we think the uncompressed size may be
		    else
		      out_data = new MemoryBlock( Uncompressed_Size )
		    end if
		    
		    DataLength = FreeImage_ZLibUncompress( out_data, out_data.Size, In_Data, Size )
		    Return out_data
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ZLibUncompress(In_Data As String, Uncompressed_Size As Uint32 = 0) As String
		  dim in_mb As new MemoryBlock( In_Data.LenB )
		  in_mb.StringValue( 0, in_mb.Size ) = In_Data
		  
		  dim datalength As UInt32
		  dim out_data As MemoryBlock = ZLibUncompress( in_mb, in_mb.Size, Uncompressed_Size, datalength )
		  
		  if out_data <> nil then
		    Return out_data.StringValue( 0, datalength )
		  end if
		End Function
	#tag EndMethod


	#tag Note, Name = About
		This is the second major version of my REALbasic wrapper class for the FreeImage library (available from http://freeimage.sourceforge.net). This wrapper class is absolutely free
		for your personal or commercial projects as is the FreeImage library itself.
		
		This version includes a good deal more functionality than the initial version does, some refactoring to improve its API, and at least one bug fix. The library is by no means
		completely implemented, and there is no guarantee that all functions are bulletproof. If you find a bug or implement functions within the FreeImage API not already included,
		please contact me with your changes so others may benefit. The newest version will be available from www.dingostick.com for free.
		
		Please note: I have tested all of this functionality at least minimally (and some functionality extensively) on Windows but not on Mac OS or Linux. Unfortunately, I have been
		unable to compile the library for Macintosh (due to my lack of access to such a machine with a suitable development environment), and I have received no assistance from within
		the REALbasic community in this respect. Therefore, the above warning goes double for Mac users until I am able to test on that platform.
		
		If you wish to assist in the development of this wrapper class, I am in particular looking for a method of converting a FreeImage object to a REALbasic Picture object (and vice-
		versa) in-memory and without the use of any other plugins.
		
		Please send all questions & comments to me through my website -- dingostick.com/contact.php
		
		
		Enjoy!
		-Adam Shirey
	#tag EndNote

	#tag Note, Name = Changelog
		v2008-03-02:
		=========
		- Added ToneMapping
		- Added FI_ToneMapAlgorithm enum
		- Added ToneMapping_Drago
		- Added ToneMapping_Fattal
		- Added ToneMapping_Reinhard
		- Added DotsPerMeterX
		- Added DotsPerMeterY
		- Added AdjustCurve; LUT still needs attention
		- Added AdjustGamma
		- Added AdjustBrightess
		- Added AdjustContrast
		- Added AdjustColors
		- Added SwapColors, PixelsChanged property
		- Added Dither, FI_DitherAlgorithm enum
		- Added new values to FI_Format enum: FIF_EXR (OpenEXR), FIF_J2K (JPEG-2000), FIF_JP2 (JPEG Network Graphics)
		- Added LookupColorSVG
		- Added LookupColorX11
		- Added IsLittleEndian
		- Added Version
		- Added Copyright
		- Added TransformJPEG
		- Added FI_Flag enum
		- Changed all Save methods to accept Flag As FI_Flag instead of Quality As Integer
		- Added alternate Save methods that omit the Flag parameter; these pass in a FI_Flag value of zero (default)
		- Added String and MemoryBlock versions of GZip, GUnZip
		- Added String and MemoryBlock versions of ZLibCompress, ZLibUncompress
		- Added String and MemoryBlock versions of CRC32
		- Removed constants JPEG_QUALITYAVERAGE, JPEG_QUALITYBAD, JPEG_QUALITYGOOD, JPEG_QUALITYNORMAL, JPEG_QUALITYSUPERB
		- Changed scope to Public for most methods within Mod_FreeImage
		- Added GetFIFDescription
		- Added GetFIFExtensionList
		- Added GetFIFFromFilename
		- Added GetFIFFromFilenameU
		- Added GetFIFFromMime
		- Added GetFIFMimeType
		- Added GetFIFRegExpr
		- Added GetFormatFromFIF
		- Added SupportsReading, SupportsWriting
		- Added two versions of ConvertTo4Bits
		- Added two versions of ConvertTo8Bits
		- Added two versions of ConvertTo16Bits555
		- Added two versions of ConvertTo16Bits565
		- Added ColorQuantize
		- Converted String and MemoryBlock versions of Mod_FreeImage.FI_Load to shared methods FreeImage.Load
		- Converted Mod_FreeImage.FI_LoadU to shared method FreeImage.LoadU
		- Converted Mod_FreeImage.FI_LoadFromMemory to shared method FreeImage.LoadFromMemory
		- Changed scope of FreeImage.fi_dib (pointer to a FreeImage object) to private in keeping with OOP paradigm
		- Converted FreeImage.FromString to a shared method
		- Renamed FilterMethod enum to FI_FilterMethod
		- Fixed PixelRGB
		- PixelRGBA now returns and accepts a Color and a UInt8 for its alpha property instead of UInt8()
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  'DLL_API BOOL DLL_CALLCONV FreeImage_IsLittleEndian();
			  
			  #if TargetWin32
			    const fname = "_FreeImage_IsLittleEndian@0"
			    Soft Declare Function FreeImage_IsLittleEndian Lib "FreeImage" _
			    Alias "_FreeImage_IsLittleEndian@0" ( ) as Boolean
			  #else
			    const fname = "FreeImage_IsLittleEndian"
			    Soft Declare Function FreeImage_IsLittleEndian Lib "FreeImage" () As Boolean
			  #endif
			  
			  if System.IsFunctionAvailable( fname, "FreeImage" ) then
			    return FreeImage_IsLittleEndian
			  end if
			End Get
		#tag EndGetter
		IsLittleEndian As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected PixelsChanged As Integer
	#tag EndProperty


	#tag Enum, Name = FI_ColorChannel, Type = Integer, Flags = &h0
		RGB=0
		  Red=1
		  Green=2
		  Blue=3
		  Alpha=4
		  Black=5
		  Real=6
		  Imag=7
		  Mag=8
		Phase=9
	#tag EndEnum

	#tag Enum, Name = FI_DitherAlgorithm, Type = Integer, Flags = &h0
		Floyd_Steinberg=0
		  Bayer4x4=1
		  Bayer8x8=2
		  Cluster6x6=3
		  Cluster8x8=4
		  Cluster16x16=5
		Bayer16x16=6
	#tag EndEnum

	#tag Enum, Name = FI_FilterMethod, Type = Integer, Flags = &h0
		Box=0
		  Bicubic=1
		  Bilinear=2
		  BSpline=3
		  CatmullRom=4
		Lanczos3=5
	#tag EndEnum

	#tag Enum, Name = FI_Flag, Type = Integer, Flags = &h0
		BMP_DEFAULT=0
		  BMP_SAVE_RLE=1
		  CUT_DEFAULT=0
		  DDS_DEFAULT=0
		  EXR_DEFAULT=0
		  EXR_FLOAT=&h0001
		  EXR_NONE=&h0002
		  EXR_ZIP=&h0004
		  EXR_PIZ=&h0008
		  EXR_PXR24=&h0010
		  EXR_B44=&h0020
		  EXR_LC=&h0040
		  FAXG3_DEFAULT=0
		  GIF_DEFAULT=0
		  GIF_LOAD256=1
		  GIF_PLAYBACK=2
		  HDR_DEFAULT=0
		  ICO_DEFAULT=0
		  ICO_MAKEALPHA=1
		  IFF_DEFAULT=0
		  J2K_DEFAULT=0
		  JP2_DEFAULT=0
		  JPEG_DEFAULT=0
		  JPEG_FAST=&h0001
		  JPEG_ACCURATE=&h0002
		  JPEG_CMYK=&h0004
		  JPEG_QUALITYSUPERB=&h80
		  JPEG_QUALITYGOOD=&h0100
		  JPEG_QUALITYNORMAL=&h0200
		  JPEG_QUALITYAVERAGE=&h0400
		  JPEG_QUALITYBAD=&h0800
		  JPEG_PROGRESSIVE=&h2000
		  KOALA_DEFAULT=0
		  LBM_DEFAULT=0
		  MNG_DEFAULT=0
		  PCD_DEFAULT=0
		  PCD_BASE=1
		  PCD_BASEDIV4=2
		  PCD_BASEDIV16=3
		  PCX_DEFAULT=0
		  PNG_DEFAULT=0
		  PNG_IGNOREGAMMA=1
		  PNM_DEFAULT=0
		  PNM_SAVE_RAW=0
		  PNM_SAVE_ASCII=1
		  PSD_DEFAULT=0
		  RAS_DEFAULT=0
		  SGI_DEFAULT=0
		  TARGA_DEFAULT=0
		  TARGA_LOAD_RGB888=1
		  TIFF_DEFAULT=0
		  TIFF_CMYK=&h0001
		  TIFF_PACKBITS=&h0100
		  TIFF_DEFLATE=&h0200
		  TIFF_ADOBE_DEFLATE=&h0400
		  TIFF_NONE=&h0800
		  TIFF_CCITTFAX3=&h1000
		  TIFF_CCITTFAX4=&h2000
		  TIFF_LZW=&h4000
		  TIFF_JPEG=&h8000
		  WBMP_DEFAULT=0
		  XBM_DEFAULT=0
		XPM_DEFAULT=0
	#tag EndEnum

	#tag Enum, Name = FI_Format, Flags = &h0
		UNKNOWN=-1
		  BMP=0
		  ICO=1
		  JPEG=2
		  JNG=3
		  KOALA=4
		  LBM=5
		  IFF=5
		  MNG=6
		  PBM=7
		  PBMRAW=8
		  PCD=9
		  PCX=10
		  PGM=11
		  PGMRAW=12
		  PNG=13
		  PPM=14
		  PPMRAW=15
		  RAS=16
		  TARGA=17
		  TIFF=18
		  WBMP=19
		  PSD=20
		  CUT=21
		  XBM=22
		  XPM=23
		  DDS=24
		  GIF=25
		  HDR=26
		  FAXG3=27
		  SGI=28
		  FIF_EXR=29
		  FI_J2K=30
		FI_JP2=31
	#tag EndEnum

	#tag Enum, Name = FI_ImageType, Type = Integer, Flags = &h0
		UNKNOWN=0
		  BITMAP=1
		  UINT16=2
		  INT16=3
		  UINT32=4
		  INT32=5
		  FLOAT=6
		  DOUBLE=7
		  COMPLEX=8
		  RGB16=9
		  RGBA16=10
		  RBGF=11
		RGBAF=12
	#tag EndEnum

	#tag Enum, Name = FI_JPEGTransform, Type = Integer, Flags = &h0
		None=0
		  Flip_Horizontal=1
		  Flip_Vertical=2
		  Transpose=3
		  Transverse=4
		  Rotate90=5
		  Rotate180=6
		Rotate270=7
	#tag EndEnum

	#tag Enum, Name = FI_MetaDataModel, Type = Integer, Flags = &h0
		NoData=-1
		  Comments=0
		  EXIF_Main=1
		  EXIF_EXIF=2
		  EXIF_GPS=3
		  EXIF_MakerNote=4
		  EXIF_InterOp=5
		  IPTC=6
		  XMP=7
		  GEOTIFF=8
		  Animation=9
		Custom=10
	#tag EndEnum

	#tag Enum, Name = FI_QuantizeAlgorithm, Type = Integer, Flags = &h0
		XiaolinWu=0
		NeuQuant=1
	#tag EndEnum

	#tag Enum, Name = FI_TagType, Type = Integer, Flags = &h0
		NoType=0
		  Byte=1
		  ASCII=2
		  Short=3
		  Long=4
		  Rational=5
		  SByte=6
		  Undefined=7
		  SShort=8
		  SLong=9
		  SRational=10
		  Float=11
		  Double=12
		  IFD=13
		Palette=14
	#tag EndEnum

	#tag Enum, Name = FI_ToneMapAlgorithm, Type = Integer, Flags = &h0
		Drago03=0
		  Reinhard05=1
		Fattal02=2
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsLittleEndian"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
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
