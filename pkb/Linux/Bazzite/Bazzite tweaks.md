## Show init logs during boot:
```sh
sudo plymouth-set-default-theme details
sudo rpm-ostree initramfs --enable
```
> [!NOTE] Caution!
> These commands cause a (delayed) immediate reboot

## NVIDIA bug - graphical glitches after sleep
[NOTE:] This is an issue with my card (GTX 1060) and drivers and has occured consistently for me throughout distributions.  The following kernel module parameter `NVreg_PreserveVideoMemoryAllocations=1` seems to alleviate it.

On bazzite we add the module paramater via kargs rather than through initramfs:
```sh
rpm-ostree kargs --append-if-missing="nvidia.NVreg_PreserveVideoMemoryAllocations=1"
```

