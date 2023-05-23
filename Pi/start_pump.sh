#!/bin/bash
mosquitto_sub -h localhost -p 1883 -u my_user -P password -t $1/pump_water -C 1 -F "%t %p" | while  read -r payload
do
    pump=$(echo "$payload" | cut -d ' ' -f 2-)
    mosquitto_sub -h localhost -p 1883 -u my_user -P password -t $1/plant_water -C 1 -F "%t %p" | while  read -r payload
    do
        plant=$(echo "$payload" | cut -d ' ' -f 2-)
        if [ $plant = "0" ] && [ $pump = "1" ]
        then
            mosquitto_pub -h localhost -p 1883 -u my_user -P password -t $1/pump_actuation -m 1 -r
            echo "p" > $1
        fi
    done
done