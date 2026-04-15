```sh
sudo mkdir /mnt/nvme
sudo chown 1000:1000 /mnt/nvme
echo 'UUID=661CB7F11CB7B9FF /mnt/nvme auto defaults,nofail,x-systemd.device-timeout=5,uid=1000,gid=1000,umask=027 0 0' | sudo tee -a /etc/fstab
```
UUID - identifies drive regardless of port/slot
/mnt/nvme - mount point
auto - autodetect filesystem (should be ntfs3, but feels safer to let system decide)
options -
	defaults - kernal defaults (typically rw, suid, dev, exec, auto, nouser, and async)
    nofail - don't throw an error if mounting fails (continue booting)
    x-systemd.device-timeout=5 - only wait 5 seconds
    uid, gid, umask - set owner and permissions of drive