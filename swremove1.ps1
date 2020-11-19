$Application = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | ?{$_.DisplayName -like "[Application Name]" -and $_.UninstallString -like "*MsiExec* /X*"}
foreach ($i in $Application){
	$Uninstall = $i.UninstallString
	Write-Host "Uninstalling " $i.DisplayName "..."
	& cmd /c $Uninstall /quiet /noreboot
}
