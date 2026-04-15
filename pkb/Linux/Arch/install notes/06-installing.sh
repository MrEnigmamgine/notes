#!/bin/sh

pacstrap -K /mnt  base  base-devel linux linux-lts linux-firmware amd-ucode  btrfs-progs  e2fsprogs  ntfs-3g  nvme-cli  vim  nano  sudo  git networkmanager iwd efibootmgr grub grub-btrfs os-prober reflector rsync 7zip bat  bat-extras lynx tmux htop dysk zsh zsh-completions zsh-autosuggestions 

echo "Base system and packages installed successfully."
echo "Generating fstab file..."
genfstab -U /mnt >> /mnt/etc/fstab
echo "fstab file generated."
cat <<EOF
The next step is to chroot into the new system and perform additional configurations.
Script 07-chroot_configs.sh contains the necessary commands and should be run from within the chroot environment.

    cp ./07-chroot_configs.sh /mnt/root/07-chroot_configs.sh
    arch-chroot /mnt /bin/sh /root/07-chroot_configs.sh

After completing the chroot configurations, remember to unmount the partitions and reboot the system.

    umount -R /mnt
    swapoff -a
    reboot
EOF

