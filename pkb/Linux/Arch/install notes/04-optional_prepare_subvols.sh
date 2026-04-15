#!s/bin/sh
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

# create btrfs subvolumes in tempdir
TEMP_MOUNT="/mnt/temp_btrfs_mount"
mkdir -p "$TEMP_MOUNT"
mount "${DISK_PATH}-part4" "$TEMP_MOUNT"
btrfs subvolume create "$TEMP_MOUNT/@"
btrfs subvolume create "$TEMP_MOUNT/@home"
btrfs subvolume create "$TEMP_MOUNT/@root"

mkdir -p "$TEMP_MOUNT/@/var/lib/libvirt"
btrfs subvolume create "$TEMP_MOUNT/@/var/lib/libvirt/images"
chattr +C "$TEMP_MOUNT/@/var/lib/libvirt/images"

umount "$TEMP_MOUNT"
rmdir "$TEMP_MOUNT"
echo "Btrfs subvolumes created successfully."