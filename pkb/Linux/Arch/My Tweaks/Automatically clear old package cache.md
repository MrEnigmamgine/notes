[[Pacman]] stores its downloaded packages in `/var/cache/pacman/pkg/` and does not remove the old or uninstalled versions automatically. This has the benefit of allowing a downgrade without redownloading.

The [paccache(8)](https://man.archlinux.org/man/paccache.8) script, provided within the [pacman-contrib](https://archlinux.org/packages/?name=pacman-contrib) package, deletes all cached versions of installed and uninstalled packages, except for the most recent three by default.

```sh
# Install the script
pacman -S pacman-contrib
# Enable the timer that will run it every week.
systemctl enable paccache.timer
```