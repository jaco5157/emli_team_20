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
            bash /home/pi/Portfolio/mqtt_publish.sh ${split[0]} ${split[1]} ${split[2]} ${split[3]} $plant
            bash /home/pi/Portfolio/led_update.sh ${split[0]} ${split[1]} ${split[2]}
        fi
        bash /home/pi/Portfolio/button_control.sh $plant
    done
    sleep 2
done