
Partition drives:
- ESP 1G
- BTRFS

Flat subvolumes under top-level subvolume @
```sh
btrfs subvolume create {@,@/arch,@/home,@/root,@/virtmachines}
# @ = abstraction sv to act as top-level sv
# arch = /
# home = /home
# root = /root
# virtmachines = /var/lib/machines
```