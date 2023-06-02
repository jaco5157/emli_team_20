#!/bin/bash
while true; do
    plants=$(echo /dev/ttyACM* | tr " " "\n")
    for plant in $plants
    do
        msg=$(cat $plant | head -n 2 | tr -d '[:space:]')
        echo ${msg}

        if [ ${#msg} -gt 0 ]
        IFS=',' read -r -a split <<< "$msg"
        then
            bash /home/pi/emli_team_20/Pi/mqtt_publish.sh $plant plant_water ${split[0]} 
            bash /home/pi/emli_team_20/Pi/mqtt_publish.sh $plant pump_water ${split[1]}
            bash /home/pi/emli_team_20/Pi/mqtt_publish.sh $plant soil_moisture ${split[2]}
            bash /home/pi/emli_team_20/Pi/mqtt_publish.sh $plant ambient_light ${split[3]}
            bash /home/pi/emli_team_20/Pi/led_update.sh ${split[0]} ${split[1]} ${split[2]}
        fi
        bash /home/pi/emli_team_20/Pi/button_control.sh $plant
    done
    bash /home/pi/emli_team_20/Pi/health_monitor/health_monitor.sh
    sleep 2
done