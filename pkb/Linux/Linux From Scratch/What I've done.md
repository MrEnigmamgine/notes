Downloading each package from the sources suggested in the documentation often led to me running into an issue where the host was down and wget would stall.  To work around this issue I downloaded directly from an LFS mirror:

```sh
wget --recursive --no-parent --no-host-directories --cut-dirs=4 https://lfs.gnlug.org/pub/lfs/lfs-packages/12.4/
```


### How I've been backing up.
```sh
tar -cJp --file=/mnt/nvme/backups/lfs-$(date --rfc-3339=date).tar.xz /mnt/lfs/
```
## Not done

### Ch9.
- Skipped making custom udev rules (except for script generate eno1)
- 