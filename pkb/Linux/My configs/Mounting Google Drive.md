## Rclone (Google Drive)
Rclone is a popular command-line program to manage files on cloud storage. It is a feature-rich alternative to cloud vendors' web storage interfaces.  I'm interested in using it to have native access to my google drive and dropbox.

For google drive it relies on an API key which has rate limits imposed.  The utility has its own API key, but it's heavily used and better to make your own.  Follow https://rclone.org/drive/#making-your-own-client-id to make your own.

```sh
sudo zypper install rclone -y
rclone config
```
The config menu will guide you through the process.  Note: despite claiming that the client secret was optional, my Oauth wouldn't work without it. Also, if you don't know what to pick the default is the safest choice. (I made the mistake of saying that I *did* want to go into the advanced config.  There's a lot of options there.)

Verify that the config is working:
```sh
rclone lsd <remote_name>:
```

I store a backup of my rclone config at `/mnt/nvme/_migration/rclone/rclone.conf`

### On-demand mounting of google drive
Create a symlink so that rclone can act as a mount helper for fstab and systemd
```sh
sudo ln -s /usr/bin/rclone /sbin/mount.rclone
```
Prepare the mount-point
```sh
sudo mkdir /mnt/gdrive
sudo chown 1000:1000 /mnt/gdrive
```
Add the following to `/ect/fstab`
```
gdrive:/ /mnt/gdrive rclone rw,noauto,nofail,_netdev,x-systemd.automount,x-systemd.idle-timeout=600,args2env,allow-other,vfs_cache_mode=full,config=/home/crux/.config/rclone/rclone.conf,cache_dir=/var/cache/rclone,uid=1000,gid=1000 0 0
```
Refresh systemctl
```sh
sudo systemctl daemon-reload
sudo systemctl restart remote-fs.target
```

Now, the drive should be mounted automatically whenever you attempt to access the GoogleDrive directory (`ls -l /mnt/gdrive`) and should automatically dismount after 10 minutes of inactivity.