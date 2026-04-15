#!/bin/sh
set -e

SERIAL='S59HNG0N434336K'
## You can find the serial number of your disk using:
## lsblk -lo name,model,serial,size,partlabel,parttype,mountpoint

## Paths like /dev/disk/by-id/ are more reliable than /dev/sdX names
## because /dev/sdX names can change between reboots or when disks are added or removed.
## So we use the disk's serial number to find the correct disk.
DISK=$(ls /dev/disk/by-id/ \
    | grep "$SERIAL" \
    | grep -v -- '-part' \
    | head -n 1 \
    )
    
## Complain if we didn't find the disk
if [ -z "$DISK" ]; then
    echo "Error: Disk with serial $SERIAL not found."
    echo "You can list available disks with: ls /dev/disk/by-id/"
    echo "Alternatively: lsblk -lo name,model,serial,size"
    exit 1
fi

## Construct the full disk path
DISK_PATH="/dev/disk/by-id/$DISK"
echo "Using disk: $DISK_PATH"

## Mount the partitions to /mnt and subdirectories
mount -o subvol=@,compress=zstd:3 "${DISK_PATH}-part4" /mnt
mkdir -p /mnt/home
mount -o subvol=@home,compress=zstd:3 "${DISK_PATH}-part4" /mnt/home
mkdir -p /mnt/root
mount -o subvol=@root,compress=zstd:3 "${DISK_PATH}-part4" /mnt/root

mkdir -p /mnt/efi
mount "${DISK_PATH}-part1" /mnt/efi
mkdir -p /mnt/xboot
mount "${DISK_PATH}-part2" /mnt/xboot
swapon "${DISK_PATH}-part3"

echo "Partitions mounted successfully."