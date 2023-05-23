mosquitto_pub -h localhost -p 1883 -u my_user -P password -t $5/plant_water -m $1 -r
mosquitto_pub -h localhost -p 1883 -u my_user -P password -t $5/pump_water -m $2 -r
mosquitto_pub -h localhost -p 1883 -u my_user -P password -t $5/soil_moisture -m $3 -r
mosquitto_pub -h localhost -p 1883 -u my_user -P password -t $5/ambient_light -m $4 -r