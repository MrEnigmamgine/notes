#!/bin/sh
## Connect to a Wi-Fi network using iwctl

DEV=wlan0
SSID="MrSquiggles"
PASS="tomato.sauce"


## Scan for available networks and connect
iwctl station "$DEV" scan
sleep 2
iwctl station "$DEV" connect "$SSID" --passphrase "$PASS"
sleep 5
iwctl station "$DEV" show