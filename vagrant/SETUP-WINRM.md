## Enable WinRM on Windows host
To be able to control your Windows host from Ansible on the guest VM, Windows Remote Management (WinRM) must be configured.

Download the following Powershell (POSH) script: https://github.com/ansible/ansible/blob/devel/examples/scripts/ConfigureRemotingForAnsible.ps1

Execute the following in an elevated (run as administrator) cmd prompt:
```cmd
:: Change to the directory you saved the script in
cd \Users\Henrik\Desktop
powershell.exe -ExecutionPolicy ByPass -File ConfigureRemotingForAnsible.ps1 -CertValidityDays 2000 -SkipNetworkProfileCheck -ForceNewSSLCert
>
Self-signed SSL certificate generated; thumbprint: CA6BA2DB7A763A5BF9BD20F31AEAB0D773BFF10C

wxf                 : http://schemas.xmlsoap.org/ws/2004/09/transfer
a                   : http://schemas.xmlsoap.org/ws/2004/08/addressing
w                   : http://schemas.dmtf.org/wbem/wsman/1/wsman.xsd
lang                : en-US
Address             : http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous
ReferenceParameters : ReferenceParameters

:: Stop WinRM Service
net stop winrm
>
The Windows Remote Management (WS-Management) service is stopping.
The Windows Remote Management (WS-Management) service was stopped successfully.

:: Start WinRM Service again
net start winrm
>
The Windows Remote Management (WS-Management) service is starting.
The Windows Remote Management (WS-Management) service was started successfully.

:: Check that WinRM is running and listening:
netstat -na -p TCP | findstr ":5986"
>
TCP    0.0.0.0:5986           0.0.0.0:0              LISTENING
```
