#!/bin/sh
## This script should be ran from within the chroot environment
set -e


MYUSER="crux"
MYHOST="coldwater"

# Set timezone and synchronize hardware clock
ls -sf /usr/share/zoneinfo/US/Eastern /etc/localtime
hwclock --systohc --utc
echo "Timezone set to US/Eastern and hardware clock synchronized."

## Set up locales
# Uncomment appropriate locales from the /etc/locale.gen
sed -i '/en_US/ s/^#//' /etc/locale.gen
locale-gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=us" > /etc/vconsole.conf
echo "Locale and keymap configured."

## Set hostname and hosts file
echo "$MYHOST" > /etc/hostname
echo "Hostname set to $MYHOST."
echo 127.0.0.1 $MYHOST >> /etc/hosts
echo "Loopback addresses added to /etc/hosts."
echo "Displaying /etc/hosts content:"
echo ""
cat /etc/hosts
echo ""

## Set passwords
# Root
echo "Set root password:"
passwd
echo "Root password set."
# My user
echo "Creating a new user account."
useradd -m -G wheel -s /bin/zsh $MYUSER
echo "Set password for user $MYUSER:"
passwd $MYUSER
echo "Password for user $MYUSER set."
