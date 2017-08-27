#if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
#    $arguments = "& '" + $myinvocation.mycommand.definition + "'"
#    #Write-Host $arguments
#    Start-Process powershell -Verb runAs -ArgumentList $arguments
#    Break
#}

$svcName = "{{ xymon_win_client_name }}"
$installPath = "$($Env:ProgramFiles)\"+$svcName+"\"

$invocation = (Get-Variable MyInvocation).Value
$directorypath = Split-Path $invocation.MyCommand.Path

Unblock-File -Path ($installPath + "nssm.exe") -ErrorAction Stop
Unblock-File -Path ($installPath + "xymonclient.ps1") -ErrorAction Stop
Unblock-File -Path ($installPath + "xymonsend.ps1") -ErrorAction Stop

Set-Location -Path $installPath -ErrorAction Stop
Invoke-expression -Command (".\xymonclient.ps1 install" ) -ErrorAction Stop
Set-Service -Name $svcName -Description "Xymon monitoring system client" -StartupType Automatic -ErrorAction Stop
# TO set delayed start up
$command = "sc.exe config $svcName start=delayed-auto"
$Output = Invoke-Expression -Command $Command -ErrorAction Stop

Start-Service -Name $svcName -ErrorAction Stop

#	Restart XymonPSClient daily
# The PowerShell based Xymon client can have a tendency to be greedy
# when it comes to memory usage - it grows slowly and an can consume 1GB+.
# A task to schedule a daily restart at midnight can be added.


$command = "SCHTASKS /Create /TN ""Restart $($svcName) Service Daily""  /TR ""cmd /C 'net stop $($svcName) & net start $($svcName)'"" /SC DAILY /ST 00:00 /RU SYSTEM /F"
$Output = Invoke-Expression -Command $Command -ErrorAction Stop

# Mark the install as done
echo $null >> "$($installPath)$($svcName).installed"
