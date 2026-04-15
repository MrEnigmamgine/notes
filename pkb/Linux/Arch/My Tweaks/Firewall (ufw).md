**Important Note:** Docker will ignore ufw rules and potentially publish ports globally depending on docker config.  There's a fix for this on the arch-wiki, but I don't understand it and will instead rely on network wide firewalls to manage that access.


Initial configuration:
```sh
sudo pacman -S ufw

sudo ufw default deny
sudo ufw limit ssh
sudo ufw allow from 192.168.1.0/24

sudo systemctl enable --now ufw.service
sudo ufw enable

sudo ufw status
```


App definitions:
```sh
# Defined in /etc/ufw/applications.d/
sudo ufw app list
```

Deleting rules:
```sh
sudo ufw status numbered
sudo ufw delete <rule_number>
```

