Printing in linux is accomplished by CUPS (Commun Unix Printing System)

Cups can be administered using a web interface at https://localhost:631

Firewalls can interfere with printer discovery and configuration.
```sh
sudo firewall-cmd --add-service=mdns --add-service=ipp --permanent
```

