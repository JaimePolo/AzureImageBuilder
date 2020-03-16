cd ~
net use * \\filesharetest120320.file.core.windows.net\filesharetest120320 /u:filesharetest120320 Mmy+UoHBwf6s3tyvva1M8Vj7BO1Ev7bsUNQ0lB0CR5+aI7yT+2iz8mV0hxK8Ao+gPUgWYg/2bBlEMddYkaMQ0w==
cd Z:
dir
.\en_visio_professional_2019.iso
Start-Sleep -Seconds 10
cd F:
dir
.\Setup.exe /admin
Wait-Process -Name OfficeC2RClient
cd ~
$Eject = New-Object -ComObject "Shell.Application"
$Eject.Namespace(17).Items() | Where-Object { $_.Type -eq "CD Drive" } | foreach { $_.InvokeVerb("Eject") }
Restart-Computer