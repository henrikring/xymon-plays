#!/bin/bash
sudo  -i
# Prep ansible
yum -y install epel-release
yum -y install ansible
yum -y install python-pip
pip install --upgrade pip

# Winrm and Kerberos dependancies
yum -y install python-devel krb5-devel krb5-libs krb5-workstation
yum -y install gcc # Prereq for the below Python modules
pip install --upgrade pip
pip install kerberos requests_kerberos
# Support for Winrm
pip install "pywinrm>=0.1.1"
