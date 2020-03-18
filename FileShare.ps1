cd ~
net use Z: \\fileshare1803.file.core.windows.net\ftp /u:fileshare1803 ntLsKczDP4GhtcklXjylaeKtoq2pkoJO6wzwjsVBS4Lp2xSj2o/NpyKkicBxfq+Eeg3mc1LFftB/6/BtGYXZnA==
cd Z:
dir
.\en_visio_professional_2019.iso
Start-Sleep -Seconds 10
cd F:
dir
.\Setup.exe /admin
Wait-Process -Name OfficeC2RClient
cd ~
net use Z: /DELETE
$Eject = New-Object -ComObject "Shell.Application"
$Eject.Namespace(17).Items() | Where-Object { $_.Type -eq "CD Drive" } | foreach { $_.InvokeVerb("Eject") }