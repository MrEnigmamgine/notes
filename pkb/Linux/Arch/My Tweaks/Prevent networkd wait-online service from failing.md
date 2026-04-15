The `systemd-networkd-wait-online` service will wait for all interfaces to be online and routeable by default (at least when installing with arch-install).  This can slow down boot-up times significantly.

The method I chose to solve this is to replace the service with a template for the specific interface that I expect to be always on:

```
sudo systemctl disable systemd-networkd-wait-online.service
sudo systemctl enable systemd-networkd-wait-online@wlan0.service
```


Additionally, it may be worthwhile to edit the `*.network` files in `/etc/systemd/network`. Specifically  `[Link] -> RequiredForOnline=no`
```toml
# /etc/systemd/network/20-wlan.network
[Match]  
Name=wl*  
  
[Link]  
RequiredForOnline=routable  
  
[Network]  
DHCP=yes  
MulticastDNS=yes  

[DHCPv4]  
RouteMetric=600  
  
[IPv6AcceptRA]  
RouteMetric=600
```