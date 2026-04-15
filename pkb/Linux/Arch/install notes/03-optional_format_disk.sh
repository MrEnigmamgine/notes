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

## SAFETY CHECK: Ensure no partitions on this disk are mounted
if lsblk -n -o MOUNTPOINT "$DISK_PATH" | grep -q "."; then
    echo "CRITICAL ERROR: The target disk $DISK_PATH has mounted partitions!"
    echo "Safety abort triggered to prevent data loss."
    echo "Mounted points lfound:"
    lsblk -n -o NAME,MOUNTPOINT "$DISK_PATH" | grep "/"
    exit 1
fi

## Now we can partition the disk
wipefs -a -f "$DISK_PATH"
sfdisk --wipe always "$DISK_PATH" <<EOF
label: gpt
unit: sectors
first-lba: 2048
sector-size: 512

# These sizes are probably excessive for most use cases; adjust as needed.
size=   1G, type=   uefi,     name=  "EFI System Partition"
size=   1G, type=   xbootldr, name=  "Xboot"
size=   8G, type=   swap,     name=  "Swap"
size=   +,  type=   linux,    name=  "Arch Linux"
EOF
partprobe $DISK_PATH
udevadm settle

## After partitioning, format the partitions
echo
echo "Partitioning complete. Formatting partitions..."
mkfs.fat -F32 -n "ESP" "${DISK_PATH}-part1"
mkfs.fat -F32 -n "XBOOT" "${DISK_PATH}-part2"
mkswap "${DISK_PATH}-part3"
mkfs.btrfs -f -L "Arch Linux" "${DISK_PATH}-part4"
udevadm settle