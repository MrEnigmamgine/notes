There is an issue with my motherboard where the GPP bridge to the NVME drive makes it wake up immediately after sleeping.
[https://wiki.archlinux.org/title/Power_management/Wakeup_triggers#Instantaneous_wakeup_after_suspending](https://wiki.archlinux.org/title/Power_management/Wakeup_triggers#Instantaneous_wakeup_after_suspending "https://wiki.archlinux.org/title/Power_management/Wakeup_triggers#Instantaneous_wakeup_after_suspending").

```sh
touch /etc/systemd/system/wakeup-disable_GPP0.service

sudo tee /etc/systemd/system/fix-suspend.service > /dev/null << 'EOF'
[Unit]
Description=Fix suspend by disabling GPP0 sleepstate thingie

[Service]
ExecStart=/bin/bash -c "echo GPP0 >> /proc/acpi/wakeup"

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable fix-suspend.service
sudo systemctl status fix-suspend.service

```