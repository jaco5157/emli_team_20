# Initially there are no warnings
warnings=false

if [ $1 = "1" ] || [ $2 = "0" ] # If too much plant water (!$0) or no pump water ($1), turn on the red LED
then
    curl http://192.168.10.222/led/red/on
    warnings=true
else # If water levels are fine, turn off the red LED
    curl http://192.168.10.222/led/red/off
fi

# If moisture level is below 50, turn on LED
if [ $3 -lt "50" ]
then
    curl http://192.168.10.222/led/yellow/on
    warnings=true
else
    curl http://192.168.10.222/led/yellow/off
fi

if [ ${warnings} = true ]
then
    curl http://192.168.10.222/led/green/off
else
    curl http://192.168.10.222/led/green/on
fi