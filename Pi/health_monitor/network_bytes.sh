#!/bin/bash
# Number of bytes transferred for a network interface (change 'eth0' to your desired interface)
network_interface="eth0"
network_bytes=$(cat /sys/class/net/$network_interface/statistics/rx_bytes)
bash /home/pi/emli_team_20/Pi/mqtt_publish.sh /pi network_bytes $network_bytes

echo "Network bytes transferred ($network_interface): $network_bytes bytes"