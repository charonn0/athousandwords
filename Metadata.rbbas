#tag Module
Protected Module Metadata
	#tag Method, Flags = &h1
		Protected Function GetCPU() As JSONItem
		  Dim cpu As New JSONItem
		  cpu.Value("Name") = Platform.CPUID
		  cpu.Value("Count") = Platform.NumberOfProcessors
		  For i As Integer = 0 To Platform.NumberOfProcessors - 1
		    Try
		      Dim cpucore As New JSONItem
		      cpucore.Value("Real MHz") = Platform.GetCPUCurrentMhz(i)
		      cpucore.Value("Factory MHz") = Platform.CPUSpeed
		      cpucore.Value("PowerSchemeThrottle") = (Platform.GetCPUCurrentMhz(i) < Platform.GetCPUMaxMhz(i))
		      cpu.Value("Core " + Str(i)) = cpucore
		    Catch OutOfBoundsException
		      Exit For i
		    End Try
		  Next
		  Return cpu
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetDisks() As JSONItem
		  Dim meta As New JSONItem
		  For i As Integer = 0 To VolumeCount - 1
		    Try
		      Dim f As New VolumeInformation(Volume(i).AbsolutePath)
		      Dim disk As New JSONItem
		      disk.Value("SizeTotal") = f.Totalbytes
		      disk.Value("SizeFree") = f.FreeBytes
		      disk.Value("Filesystem") = f.Filesystem
		      disk.Value("VolumeLabel") = f.Name
		      
		      meta.Value(f.Path) = disk
		    Catch NilObjectException
		      Continue
		    End Try
		  Next
		  
		  Return meta
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetMemory() As JSONItem
		  Dim meta As New JSONItem
		  meta.Value("Total RAM") = Platform.TotalPhysicalRAM
		  meta.Value("Available RAM") = Platform.AvailablePhysicalRAM
		  
		  Return meta
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMetadata() As String
		  Dim footer As String
		  Dim meta As New JSONItem
		  
		  meta.Value("Platform") = Platform.VersionString
		  meta.Value("CPU") = GetCPU()
		  meta.Value("Memory") = GetMemory()
		  meta.Value("Disks") = GetDisks
		  meta.Value("Mainboard") = GetMotherboard()
		  meta.Value("Power") = GetPower()
		  meta.Value("Security") = GetSecurity()
		  
		  footer = meta.ToString
		  
		  
		  Return footer
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetMotherboard() As JSONItem
		  Dim meta As New JSONItem
		  meta.Value("Manufacturer") = Platform.MotherboardManufacturer
		  meta.Value("Model") = Platform.MotherboardModel
		  meta.Value("Revision") = Platform.MotherboardModelRevision
		  Return meta
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetPower() As JSONItem
		  Dim meta As New JSONItem
		  If Platform.PowerState.OnBatteries Then
		    meta.Value("Power Source") = "Batteries"
		    meta.Value("mWh Remaining") = Platform.PowerState.BatteryTimeRemaining
		  Else
		    meta.Value("Power Source") = "Mains"
		    
		    If Platform.PowerState.BatteryPresent Then
		      meta.Value("Charging") = Platform.PowerState.Charging
		      meta.Value("Batt. Max mWh") = Platform.PowerState.MaxBatteryCapacity
		    End If
		  End If
		  
		  
		  
		  Return meta
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetSecurity() As JSONItem
		  Dim meta As New JSONItem
		  meta.Value("User") = ConvertEncoding(Platform.CurrentUser, Encodings.ASCII)
		  meta.Value("Administrator") = Platform.IsAdmin()
		  
		  meta.Value("UAC Enabled") = Platform.UAC_IsEnabled
		  Return meta
		End Function
	#tag EndMethod


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
