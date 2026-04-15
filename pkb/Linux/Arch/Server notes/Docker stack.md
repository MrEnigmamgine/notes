Container configs live in `/opt/docker`

Installing
```sh
sudo pacman -S docker docker-compose
sudo systemctl enable --now docker.service
sudo systemctl enable --now docker.socket
#sudo usermod -aG docker crux
```


