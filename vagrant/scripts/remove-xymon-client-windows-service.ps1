#if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
#    $arguments = "& '" + $myinvocation.mycommand.definition + "'"
#    #Write-Host $arguments
#    Start-Process powershell -Verb runAs -ArgumentList $arguments
#    Break
#}
#
$svcName = "XymonPSClient"
$installPath = "$($Env:ProgramFiles)\"+$svcName+"\"

$command = "SCHTASKS /Delete /TN ""Restart $($svcName) Service Daily"" /F"
$Output = Invoke-Expression -Command $Command -ErrorAction Ignore

Stop-Service -Name $svcName -ErrorAction Ignore

Set-Location -Path $installPath -ErrorAction Stop
Invoke-expression -Command (".\xymonclient.ps1 uninstall" ) -ErrorAction Ignore

Remove-Item -Recurse -Force "$installPath"
