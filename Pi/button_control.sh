button_count=$(curl http://192.168.10.222/button/a/count) 
echo $button_count

for i in $(seq 1 $button_count)
do
    echo "Watering $i"
    bash /home/pi/Portfolio/start_pump.sh $1
    sleep 2s
done