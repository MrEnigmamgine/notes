
Config file at `/etc/samba/smb.conf`



```sh
# To serve shares
sudo pacman -S samba
sudo systemctl enable --now smb.service

# Add user to smb auth
sudo smbpasswd -a crux

# To make browseable
sudo pacman -S avahi
sudo systemctl enable --now avahi-daemon.service
```

```sh
# UFW rule
ufw allow CIFS
```




My config file:
```ini
# This is the main Samba configuration file. You should read the  
# smb.conf(5) manual page in order to understand the options listed  
# here. Samba has a huge number of configurable options most of which  
# are not shown in this example  
#  
# There is a web-based interface called SWAT included with samba which  
# can be used to configure the server. Otherwise you can edit this file  
# directly. It is usually stored on one of the following locations:  
# - /etc/samba/smb.conf  
# - /usr/local/samba/lib/smb.conf  
#  
# Some options that are often worth tuning have been included as  
# commented-out examples in this file.  
#  - When such options are commented with ";", the proposed setting  
#    differs from the default Samba behaviour  
#  - When commented with "#", the proposed setting is the default  
#    behaviour of Samba but the option is considered important  
#    enough to be mentioned here  
#  
# NOTE: Whenever you modify this file you should run the command  
# "testparm" to check that you have not made any basic syntactic  
# errors.  
  
#======================= Global Settings =====================================  
  
[global]  
# Server identity  
   workgroup = WORKGROUP  
   server string = %h (Samba %v)  
  
# Authentication  
   server role = standalone server  
   obey pam restrictions = yes  
   unix password sync = yes  
  
# For Unix password sync to work on a Debian GNU/Linux system, the following  
# parameters must be set (thanks to Ian Kahan <<kahan@informatik.tu-muenchen.de> for  
# sending the correct chat script for the passwd program in Debian Sarge).  
   # passwd program = /usr/bin/passwd %u  
   # passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully* .  
  
# This boolean controls whether PAM will be used for password changes  
# when requested by an SMB client instead of the program listed in  
# 'passwd program'. The default is 'no'.  
   pam password change = yes  
  
# This option controls when unsuccessful authentication attempts are mapped to guest  
# [never, bad user, bad password, bad uid]  
   map to guest = bad user  
  
  
# Restrict connections to the local network (and loopback)  
#   hosts allow = 127. 192.168.  
  
# Use transport encryption if possible  
#   server smb encrypt = desired  
  
# Set up debug logs for each machine and cap size  
   logging = file  
   log file = /var/log/samba/log.%m  
   max log size = 5000    
  
### Default Share options  
inherit owner = unix only  
create mask = 0664  
directory mask = 2755  
force create mode = 0644  
force directory mode = 2755  
  
  
#============================ Share Definitions ==============================  
  
[data]  
comment = Data drive  
path = /mnt/d  
browsable = yes  
valid users = crux  
force group = mediacenter  
guest ok = no  
read only = no  
  
[docker]  
comment = Docker Compose and config directories  
path = /opt/docker  
browsable = yes  
valid users = crux  
force group = mediacenter  
guest ok = no  
read only = no
```