#!/bin/bash
# Available disk space in percent
disk_space=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
bash /home/pi/emli_team_20/Pi/mqtt_publish.sh /pi disk_space_percent $disk_space

echo "Disk space: $disk_space%"