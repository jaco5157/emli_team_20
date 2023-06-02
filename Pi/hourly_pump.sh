#!/bin/bash

plants=$(echo /dev/ttyACM* | tr " " "\n")
for plant in $plants
do
	mosquitto_sub -h localhost -p 1883 -u my_user -P password -t $plant/soil_moisture -C 1 -F "%t %p" | while  read -r payload
	do
		msg=$(echo "$payload" | cut -d ' ' -f 2-)
		#echo "Moisture level: $msg"
		if [ $msg -lt "100" ]
		then
		#	echo "Moisture below threshold for hourly watering"
			bash /home/pi/emli_team_20/Pi/start_pump.sh $plant
		#else
		#	echo "Moisture level above threshold for hourly watering"
		fi
	done
done