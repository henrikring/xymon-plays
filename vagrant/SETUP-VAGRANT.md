## Vagrant quick guide

### Prerequisites, Software
* Install Cygwin: https://cygwin.com/install.html  
  If you wish to also use Cygwin as your git command line client (works very well), but there are many other ways of having a command line and Git setup on a Windows host.
* Install VirtualBox: https://www.virtualbox.org/wiki/Downloads  
  If your already have VirtualBox installed make sure that you have at least version 5.1.22 (or you can encounter problems with shared folders).  
  __For Windows 7__: Ensure that Virtual Box is not installed under `C:\Program Files\` use eg `C:\Appl\Oracle\VirtualBox`.  
  This works seamless on the standard path on Windows 10.
* Install Vagrant: https://www.vagrantup.com/downloads.html  
  Use default all the way ... next, next, next, install!
* Enable virtualization on BIOS level  
  On some laptops hardware support for virtualization may be disabled by default.
  In order to use any virtualization software that support needs to be enabled.  
  To verify this, open VirtualBox, click the "New" button, under "Version" ensure that 64-bit options are listed along side with 32-bit options. If only 32-bit options are listed, then Virtualization must be enabled at the BIOS level.  
  For Lenovo: In BIOS (press F1 during start up) navigate to `Security > Virtualization  > Intel (R) Virtualization Technology` and set it to  `[Enabled]`

### Installing on the host machine (Windows assumed)
This has been tested on Windows 7 and 10.  

__FOR WINDOWS 7__ Ensure that VirtualBox is __not__ installed under `C:\Program Files\` (see above).  

Setup an "Ansible and git" test VM.  
In a local cygwin prompt:
```bash
mkdir -p /cygdrive/c/github
cd /cygdrive/c/github
git clone https://github.com/henrikring/xymon-plays.git
cd xymon-plays/vagrant

# To start the VMs - first time it will take some time
# as the Centos box (image) is downloaded to the local vagrant cache.
vagrant up

# To stop the VMs
vagrant halt

# To delete the VM (start a fresh again with vagrant up)
vagrant destroy
```
