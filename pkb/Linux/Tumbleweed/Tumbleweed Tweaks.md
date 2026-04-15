## Check repos and update
```sh
sudo zypper repos
sudo zypper refresh
sudo zypper dup -y
```


## Review my general configurations
- [[Automount NVME drive on startup]]
- [[Fix for immediate wake on sleep]]
- [[Mounting Google Drive]]
- [[Firefox - annoying ctrl-f sound]]
- [[Printing]]
- 

## Packman Essentials
https://en.opensuse.org/SDB:Installing_codecs_from_Packman_repositories
```sh
## Add the packman essentials repo
sudo zypper addrepo -cfp 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/Essentials/' packman-essentials

## Refresh to accept gpg key
sudo zypper refresh

## Grab the codecs
sudo zypper install --allow-vendor-change --from packman-essentials ffmpeg gstreamer-plugins-{good,bad,ugly,libav} libavcodec vlc-codecs
```

## Fix piper

> [!NOTE] No longer needed
> By setting my mouse to use hardware profiles using the official Logitech app in windows, the settings no longer get lost when booting between them.

Piper is a utility that can configure gaming mice and other accessories. I'm using it for my G502 Hero from logitech.  Although the functionality is limited compared to the Logitech app on Windows.

```sh
sudo usermod -aG games  $USER
```
Piper wouldn't launch normally for me afterwards, but worked by running `piper` in terminal. The issue seemed to be related to KDE expecting a status code after launch that piper did not provide. To fix, ensure that this checkbox is unchecked:
![[Pasted image 20251206081808.png]]


## Configure apps to open on login
This is most easily done through the system settings. Just search 'autostart'.
However, the relevant files are stored in `~/.config/autostart/`

## Installing VScode
```sh
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo zypper addrepo https://packages.microsoft.com/yumrepos/vscode vscode
sudo zypper refresh
sudo zypper install --from vscode code
sudo zypper install git

```