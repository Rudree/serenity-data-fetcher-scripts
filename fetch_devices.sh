#!/bin/bash


#ip=192.168.1.112
#pid="P11"

start=140
end=0

cat ~/.ssh/id_rsa.pub | ssh pi@$1 'mkdir -p ~/.ssh && cat >> .ssh/authorized_keys'

homeDir=~/Downloads/Hub-v1/$2
mkdir -p $homeDir/Devices
mkdir -p $homeDir/Hub-api
mkdir -p $homeDir/Domoticz

filename="${2}_devices.json"

## Fetch devices (disable this if devices data have been fetched)
url="http://localhost:2999/devices"
ssh pi@$1 curl "'"$url"'" > $homeDir/devices/$filename
sleep 2

echo "\nCreated $homeDir/Devices/* \n\n"