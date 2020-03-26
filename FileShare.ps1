Set-ExecutionPolicy bypass

Start-Job -Name createTemp -ScriptBlock { New-Item -Path C:\temp -ItemType Directory }

Start-Job -Name mountFileShare -ScriptBlock { cd ~ | net use Z: \\fileshare1803.file.core.windows.net\ftp /u:fileshare1803 ntLsKczDP4GhtcklXjylaeKtoq2pkoJO6wzwjsVBS4Lp2xSj2o/NpyKkicBxfq+Eeg3mc1LFftB/6/BtGYXZnA== }
Wait-Job -Name mountFileShare


Start-Job -Name copyFile -ScriptBlock { Copy-Item -Path Z:\en_visio_professional_2019_x86_x64_dvd_3b951cef.iso -Destination C:\temp }
Wait-Job -Name copyFile

Start-Job -name loadIso -ScriptBlock { $mountIso = Mount-DiskImage -ImagePath C:\temp\en_visio_professional_2019_x86_x64_dvd_3b951cef.iso }
Wait-Job -Name loadIso

#Start-Job -Name install -ScriptBlock { Start-Process -FilePath C:\temp\setup.exe -PassThru -Wait }
#Wait-Job -Name install

$driveLetter = ($mountIso | Get-Volume).DriveLetter

$installVisio   = '$driveLetter":"\Setup.exe /ADMIN'

$inst1 = (Start-Process -FilePath $installVisio -PassThru)
$inst1 | Wait-Process

#Start-Job -Name launchInstaller -ScriptBlock { Start-Process -FilePath F:\Setup.exe -ArgumentList /ADMIN }
#Wait-Job -Name launchInstaller
#Get-Volume F: | Get-DiskImage | Dismount-DiskImage
#$Eject = New-Object -ComObject "Shell.Application"
#$Eject.Namespace(17).Items() | Where-Object { $_.Type -eq "CD Drive" } | foreach { $_.InvokeVerb("Eject") }
#net use Z: /DELETE
#if (Test-Path -Path F:\Setup.exe) {Start-Process -FilePath F:\Setup.exe}