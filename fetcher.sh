#!/usr/bin/env bash

###############################################
# ip = pi's IP address
# pid = participant's id

# Run to fetch all devices, events and house json files from pi
###############################################

ip=192.168.1.112
pid="P11"

echo "Fetching devices for $pid...\n"
sh ./fetch_devices.sh $ip $pid

echo "Fetching events for $pid...\n"
sh ./fetch_events.sh $ip $pid

echo "Fetching house for $pid...\n"
sh ./fetch_house.sh $ip $pid

###############################################
# ssh to pi to run following                  #
###############################################
#sudo tar -czvf ~/hub-domoticz.tar.gz /var/lib/domoticz/
#sudo tar -czvf ~/hub-api.tar.gz /var/lib/serenity-hub-api/database


#scp pi@$ip:/home/pi/hub-domoticz.tar.gz ~/Downloads/Hub-v1/$pid/Domoticz
#scp pi@$ip:/home/pi/hub-api.tar.gz ~/Downloads/Hub-v1/$pid/Hub-api