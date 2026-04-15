[https://wiki.archlinux.org/title/Bluetooth](https://wiki.archlinux.org/title/Bluetooth#Dual_boot_pairing)

### Share pairing data in dual-boot

For dual booting Linux systems, as shown in [#Saving the configuration](https://wiki.archlinux.org/title/Bluetooth#Saving_the_configuration) simply ensure all files from `/var/lib/bluetooth/_BT-Adapter-MAC-address_` are identical on each installation, either by copying or symlinking them.

With Windows or macOS, to pair devices on dual boot setups you need to change the pairing keys on your Linux install to match.


### bluetoothctl

```sh
# Scan for devices
bluetoothctl --timeout 15 scan on && bluetoothctl devices

# Set up the pairing
bluetoothctl pair [MAC] 
# Allow auto-connection
bluetoothctl trust [MAC] 
# Connect now
bluetoothctl connect [MAC]
```