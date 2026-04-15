
![[Pasted image 20260107105233.png]]

**Table 1.  Load path when running in system mode (--system).**

| **Path**                      | **Description**                                                                                                                         |
| ----------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| /etc/systemd/system.control   | Persistent and transient configuration created using the dbus API                                                                       |
| /run/systemd/system.control   |                                                                                                                                         |
| /run/systemd/transient        | Dynamic configuration for transient units                                                                                               |
| /run/systemd/generator.early  | Generated units with high priority (see _early-dir_ in [systemd.generator(7)](https://man.archlinux.org/man/systemd.generator.7.en))    |
| /etc/systemd/system           | System units created by the administrator                                                                                               |
| /run/systemd/system           | Runtime units                                                                                                                           |
| /run/systemd/generator        | Generated units with medium priority (see _normal-dir_ in [systemd.generator(7)](https://man.archlinux.org/man/systemd.generator.7.en)) |
| /usr/local/lib/systemd/system | System units installed by the administrator                                                                                             |
| /usr/lib/systemd/system       | System units installed by the distribution package manager                                                                              |
| /run/systemd/generator.late   | Generated units with low priority (see _late-dir_ in [systemd.generator(7)](https://man.archlinux.org/man/systemd.generator.7.en))      |


These directories can always be found with the following:
```sh
systemd-analyze unit-paths          # system mode
systemd-analyze unit-paths --user   # user mode
```

### List all unit files
Useful for seeing what's installed
```sh
sudo systemctl list-unit-files
```

### See all services
A view that's a bit like windows service manager
```sh
systemctl list-units --type service --all #--state=enabled
```


### Mapping between SysV runlevels and systemd targets

| SysV init Runlevel | systemd Target    | Notes                                                                                        |
| ------------------ | ----------------- | -------------------------------------------------------------------------------------------- |
| 0                  | poweroff.target   | Halt the system.                                                                             |
| 1, s, single       | rescue.target     | Single user mode.                                                                            |
| 2, 4               | multi-user.target | User-defined/Site-specific runlevels. By default, identical to 3.                            |
| 3                  | multi-user.target | Multi-user, non-graphical. Users can usually login via multiple consoles or via the network. |
| 5                  | graphical.target  | Multi-user, graphical. Usually has all the services of runlevel 3 plus a graphical login.    |
| 6                  | reboot.target     | Reboot                                                                                       |
| emergency          | emergency.target  | Emergency shell                                                                              |

## Some (not exhaustive) components of _systemd_:

- [kernel-install](https://wiki.archlinux.org/title/Kernel-install "Kernel-install") — to automatically move [kernels](https://wiki.archlinux.org/title/Kernel "Kernel") and their respective [initramfs](https://wiki.archlinux.org/title/Initramfs "Initramfs") images to the boot partition;
- [systemd-analyze(1)](https://man.archlinux.org/man/systemd-analyze.1) — may be used to determine boot-up performance, statistics and retrieve other state and tracing information, and to verify the correctness of unit files. It is also used to access special functions useful for advanced debugging.
- [systemd-boot](https://wiki.archlinux.org/title/Systemd-boot "Systemd-boot") — simple UEFI [boot manager](https://wiki.archlinux.org/title/Boot_manager "Boot manager");
- [systemd-creds](https://wiki.archlinux.org/title/Systemd-creds "Systemd-creds") — to securely store and retrieve credentials used by systemd units;
- [systemd-cryptenroll](https://wiki.archlinux.org/title/Systemd-cryptenroll "Systemd-cryptenroll") — Enroll PKCS#11, FIDO2, TPM2 token/devices to LUKS2 encrypted volumes;
- [systemd-firstboot](https://wiki.archlinux.org/title/Systemd-firstboot "Systemd-firstboot") — basic system setting initialization before first boot;
- [systemd-homed](https://wiki.archlinux.org/title/Systemd-homed "Systemd-homed") — portable human-user [accounts](https://wiki.archlinux.org/title/Users_and_groups "Users and groups");
- [systemd-logind(8)](https://man.archlinux.org/man/systemd-logind.8) — [session management](https://dvdhrm.wordpress.com/2013/08/24/session-management-on-linux/);
- [systemd-networkd](https://wiki.archlinux.org/title/Systemd-networkd "Systemd-networkd") — [network configuration](https://wiki.archlinux.org/title/Network_configuration "Network configuration") management;
- [systemd-nspawn](https://wiki.archlinux.org/title/Systemd-nspawn "Systemd-nspawn") — light-weight namespace container;
- [systemd-repart](https://wiki.archlinux.org/title/Systemd-repart "Systemd-repart") — creates partition tables, adds or grows partitions;
- [systemd-resolved](https://wiki.archlinux.org/title/Systemd-resolved "Systemd-resolved") — network [name resolution](https://wiki.archlinux.org/title/Domain_name_resolution "Domain name resolution");
- [systemd-run(1)](https://man.archlinux.org/man/systemd-run.1) / [run0](https://wiki.archlinux.org/title/Systemd/run0 "Systemd/run0") — Temporarily and interactively acquire elevated or different privileges.
- [systemd-stub(7)](https://man.archlinux.org/man/systemd-stub.7) — a UEFI boot stub used for creating [unified kernel images](https://wiki.archlinux.org/title/Unified_kernel_image "Unified kernel image");
- [systemd-sysusers(8)](https://man.archlinux.org/man/systemd-sysusers.8) — creates system users and groups and adds users to groups at package installation or boot time;
- [systemd-timesyncd](https://wiki.archlinux.org/title/Systemd-timesyncd "Systemd-timesyncd") — [system time](https://wiki.archlinux.org/title/System_time "System time") synchronization across the network;
- [systemd/Journal](https://wiki.archlinux.org/title/Systemd/Journal "Systemd/Journal") — system logging;
- [systemd/Timers](https://wiki.archlinux.org/title/Systemd/Timers "Systemd/Timers") — monotonic or realtime timers for controlling _.service_ files or events, reasonable alternative to [cron](https://wiki.archlinux.org/title/Cron "Cron").