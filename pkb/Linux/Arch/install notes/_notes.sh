#!/bin/sh

#Attempt at preconfiguring networking
pacman -S iwd
systemctl enable iwd.service
systemctl enable systemd-resolved
systemctl enable systemd-networkd
# Symlink resolv.conf to systemd-resolved's stub resolver for apps that expect it
ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf


#Copy iwd profile from arch-iso’s /var/lib/iwd/*.psk
#Add the following to /etc/iwd/main.conf
[Settings]
AutoConnect=true

## Set up sudo
pacman -S sudo
# Some drop-in files can be added to /etc/sudoers.d/
cat > /etc/sudoers.d/20-wheel << "EOF"
# Allow members of the wheel group to execute any command
%wheel ALL=(ALL) ALL
EOF
cat > /etc/sudoers.d/21-session-timeout << "EOF"
# Set a timeout for sudo sessions (e.g., 15 minutes)
Defaults timestamp_timeout=15
EOF
# Permissions for sudoers files should be exactly 0440 or sudo will refuse to use them
chmod 0440 /etc/sudoers.d/20-wheel
chmod 0440 /etc/sudoers.d/21-session-timeout
# Test the sudoers file for syntax errors
visudo -c


## Set up SSH
### The command sshd -t is useful for detecting configuration errors
### drop-in files can be added to /etc/ssh/sshd_config.d/
pacman -S openssh
systemctl enable sshd

# Generate hostkeys
cd /etc/ssh
ssh-keygen -A
cd ~

cat > /etc/ssh/sshd_config.d/20-allow-wheel.conf << "EOF"
AllowGroups wheel
EOF

# Test the config, no output is good
sudo sshd -t



## Configure mkinitcpio
# I found the default config good but it lives in /etc/mkinitcpio.conf
# mkinitcpio will need to be ran again when new kernels are installed
mkinitcpio -P

## Set up grub
pacman -S grub efibootmgr
# This will create /boot/grub and /<esp>/EFI/<id>
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=arch-grub
# Review /etc/default/grub and edit if needed then generate config
grub-mkconfig -o /boot/grub/grub.cfg


## Automatically clearing packman cache
pacman -S pacman-contrib
systemctl enable paccache.timer


## Set up snapper for automated snapshots
# Install snapper
pacman -S snapper
# Enable the snapper timeline and cleanup timers
systemctl enable snapper-timeline.timer
systemctl enable snapper-cleanup.timer

# Create a new config for the root filesystem
snapper --config root create-config /
# Edit the config to set up automatic snapshots and cleanup
vim /etc/snapper/configs/root
# Create initial snapshot
snapper --config root create -c number -d "Initial snapshot"

# Create a new config for the home filesystem
snapper --config home create-config /home
# Edit the config to set up automatic snapshots and cleanup
vim /etc/snapper/configs/home

## snap-pac for automatic snapshotting before and after pacman operations
pacman -S snap-pac
# config is in /etc/snap-pac.ini

## Install yay for AUR package management
# We need this for the 580.xx nvidia drivers which are not in the official repos
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

## Install nvidia drivers
# These are dkms drivers, so we will need kernel headers.
pacman -S --needed linux-headers
yay -S nvidia-580xx-dkms


# Install wayland
pacman -S wayland 
# Install some basic 