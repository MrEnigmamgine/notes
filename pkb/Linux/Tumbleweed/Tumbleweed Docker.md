### Installing Docker & Compose

```sh
sudo zypper install docker docker-compose
sudo usermod -aG docker crux
sudo systemctl enable docker.socket
sudo systemctl enable docker.service
```
Reboot, then docker and compose should be working