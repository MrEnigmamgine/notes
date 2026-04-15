 ## Setup Nvidia Driver
https://en.opensuse.org/SDB:NVIDIA_drivers

```sh
sudo zypper addrepo --refresh https://download.nvidia.com/opensuse/tumbleweed NVIDIA
sudo zypper install-new-recommends
sleep 300
sudo reboot
```
Check that driver is installed and working
```sh
nvidia-smi
```

