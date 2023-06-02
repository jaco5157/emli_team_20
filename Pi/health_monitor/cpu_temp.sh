#!/bin/bash
# CPU temperature in degrees Celsius
cpu_temp=$(cat /sys/class/thermal/thermal_zone0/temp)
cpu_temp=$(echo $(($cpu_temp/1000)))
bash /home/pi/emli_team_20/Pi/mqtt_publish.sh /pi cpu_temp_degrees $cpu_temp

echo "CPU temperature: $cpu_temp°C"