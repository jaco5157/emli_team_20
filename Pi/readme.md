# How to set up your gardening system

Add the package routing commands and serial_read.sh file to your boot.sh file:
```
#!/bin/bash
sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo bash /home/pi/emli_team_20/Pi/serial_read.sh
```

Add the following to you crontab using the ``crontab -e`` command:

```
#!/bin/bash
52 */1 * * * /bin/bash /home/pi/emli_team_20/Pi/hourly_pump.sh
0 */12 * * * /bin/bash /home/pi/emli_team_20/Pi/start_pump.sh
```

