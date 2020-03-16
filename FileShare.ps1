$connectTestResult = Test-NetConnection -ComputerName filesharetest120320.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Save the password so the drive will persist on reboot
    cmd.exe /C "cmdkey /add:`"filesharetest120320.file.core.windows.net`" /user:`"Azure\filesharetest120320`" /pass:`"Mmy+UoHBwf6s3tyvva1M8Vj7BO1Ev7bsUNQ0lB0CR5+aI7yT+2iz8mV0hxK8Ao+gPUgWYg/2bBlEMddYkaMQ0w==`""
    # Mount the drive
    New-PSDrive -Name Z -PSProvider FileSystem -Root "\\filesharetest120320.file.core.windows.net\filesharetest120320"-Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}