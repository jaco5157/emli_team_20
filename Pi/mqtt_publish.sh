#!/bin/bash

# MQTT broker connection details
mqtt_device=$1
mqtt_topic=$2
mqtt_message=$3

mosquitto_pub -h localhost -p 1883 -u my_user -P password -t ${mqtt_device}/${mqtt_topic} -m ${mqtt_message} -r