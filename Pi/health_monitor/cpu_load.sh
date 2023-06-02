#!/bin/bash
# CPU load in percent
cpu_load=$(uptime | awk -F 'average:' '{print $2}' | awk -F ',' '{print $1}' | awk '{printf "%.0f", $NF}' | tr -d ' ')
bash /home/pi/emli_team_20/Pi/mqtt_publish.sh /pi cpu_load_percent $cpu_load

echo "CPU load: $cpu_load%"