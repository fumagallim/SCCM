# Info HOST 

$ArrComputers =  ".", "HOSTNAME"
# "." means local system

Clear-Host
foreach ($Computer in $ArrComputers) 
{get-wmiobject Win32_ComputerSystem -Computer
    $computerSystem =  $Computer
    $computerBIOS = get-wmiobject Win32_BIOS -Computer $Computer
    $computerOS = get-wmiobject Win32_OperatingSystem -Computer $Computer
    $computerCPU = get-wmiobject Win32_Processor -Computer $Computer
    $computerHDD = Get-WmiObject Win32_LogicalDisk -ComputerName $Computer -Filter drivetype=3
        write-host "Info per: " $computerSystem.Name -BackgroundColor DarkCyan
        "-------------------------------------------------------"
        "Manufacturer: " + $computerSystem.Manufacturer
        "Model: " + $computerSystem.Model
        "Serial Number: " + $computerBIOS.SerialNumber
        "CPU: " + $computerCPU.Name
        "HDD Capacity: "  + "{0:N2}" -f ($computerHDD.Size/1GB) + "GB"
        "HDD Space: " + "{0:P2}" -f ($computerHDD.FreeSpace/$computerHDD.Size) + " Free (" + "{0:N2}" -f ($computerHDD.FreeSpace/1GB) + "GB)"
        "RAM: " + "{0:N2}" -f ($computerSystem.TotalPhysicalMemory/1GB) + "GB"
        "Operating System: " + $computerOS.caption + ", Service Pack: " + $computerOS.ServicePackMajorVersion
        "User logged In: " + $computerSystem.UserName
        "Last Reboot: " + $computerOS.ConvertToDateTime($computerOS.LastBootUpTime)
        ""
        "-------------------------------------------------------"
}