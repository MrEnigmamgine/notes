As a result of the archinistall defaults, my ESP was mounted at `/boot` and contained my kernel and initramfs.  I want these artifacts inside of the btrfs filesystem so that they can get snapshotted with the rest of the system, and prevent version mismatches when booting from snapshots. 

My method of doing this is as follows:
 ```sh
 sudo mkdir /efi
 # Edit the fstab entry so that the ESP points at /efi
 sudo vim /etc/fstab
 sudo umount /boot
 sudo systemctl daemon-reload
 sudo mount -a
 ls /efi
 ```

Everything that was in `/boot` should now be in `/efi` and `/boot` should be empty.  If not, something went wrong.

```sh
sudo mv /efi/*.img /boot
sudo mv /efi/vmlinuz-linux /boot
sudo rm -rf /efi/grub

# Install a grub in the removable spot just in case
sudo grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB --removable
# But I prefer to have it via normal UEFI
sudo grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB

# Generate the config 
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

