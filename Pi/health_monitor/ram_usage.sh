#!/bin/bash
# Available RAM in percent
ram_usage=$(free | awk '/Mem/ {printf("%.0f", $3/$2 * 100)}')
bash /home/pi/emli_team_20/Pi/mqtt_publish.sh /pi ram_usage_percent $ram_usage

echo "RAM usage: $ram_usage%"