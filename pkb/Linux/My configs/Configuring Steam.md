
## NTFS Workaround
This hack redirects the compatdata directory away from the NTFS volume (which cannot support filenames with colons in them eg. `c:`).  Using a symbolic link, those files can be stored in the home directory instead.

```sh
mkdir -p ~/.steam/compatdata
ln -sf ~/.steam/compatdata/ /mnt/nvme/SteamLibrary/steamapps/compatdata
```

With this method, my windows and linux installs can share the same library.



## If using flatpak
Note:  I couldn't get games to run using flatpak, some kind of x11 error. I eventually gave up and used the native version.
```
WARNING: discarding _NET_WM_PID 1767 as invalid for X11 window - use specialized XCB_X11_TO_PID function!
```

The sandboxing of flatpak means that Steam can't see other drives on your system, but we can work around this by using flatseal.

Install flatseal (through flatpak is fine), and update the configuration for steam to include the directories we want.
![[Pasted image 20251210171637.png]]