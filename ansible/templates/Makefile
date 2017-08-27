# Toplevel Makefile for Xymon
BUILDTOPDIR=`pwd`

# configure settings for Xymon
#
# Toplevel dir
XYMONTOPDIR = /home/xymon
# Server data dir for hist/ etc.
XYMONVAR = /home/xymon/data
# CGI scripts go in CGIDIR
CGIDIR = /home/xymon/cgi-bin
# Admin CGI scripts go in SECURECGIDIR
SECURECGIDIR = /home/xymon/cgi-secure
# Where to put logfiles
XYMONLOGDIR = /var/log/xymon
# Where to install manpages
MANROOT = /usr/local/man
# How to run fping or xymonping
FPING = /usr/local/sbin/fping

# Username running Xymon
XYMONUSER = xymon
# Xymon server hostname
XYMONHOSTNAME = {{ ansible_hostname }}
# Xymon server IP-address
XYMONHOSTIP = {{ xymon_server_ip }}
# Xymon server OS
XYMONHOSTOS = linux

# URL for Xymon webpages
XYMONHOSTURL = /xymon
# URL for Xymon CGIs
XYMONCGIURL = /xymon-cgi
# URL for Xymon Admin CGIs
SECUREXYMONCGIURL = /xymon-seccgi
# Webserver group-ID
HTTPDGID=apache

# C-ARES settings
SYSTEMCARES = no

# PCRE settings
PCRELIBS = -lpcre

# RRDtool settings
RRDDEF = -DRRDTOOL12
RRDLIBS = -lrrd
DORRD = yes
#
# OpenSSL settings
SSLFLAGS = -DHAVE_OPENSSL -DHAVE_SSLV2_SUPPORT -DHAVE_SSLV3_SUPPORT
SSLLIBS = -lssl -lcrypto
DOSSL = yes
#
# OpenLDAP settings
LDAPFLAGS = -DHAVE_LDAP
LDAPLIBS = -lldap -llber
DOLDAP = yes
#
# clock_gettime() settings
LIBRTDEF =

# Net-SNMP settings
DOSNMP = no

# Large File Support settings
LFSDEF = -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64

include build/Makefile.Linux


# Add local CFLAGS etc. settings here

include build/Makefile.rules
