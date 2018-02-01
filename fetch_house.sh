#!/bin/bash

#ip=192.168.1.112
#pid="P11"

start=140
end=0

homeDir=~/Downloads/Hub-v1/$2
mkdir -p $homeDir/House

filename="${2}_house.json"

## Fetch devices (disable this if devices data have been fetched)
url="http://localhost:2999/house"
ssh pi@$1 curl "'"$url"'" > $homeDir/house/$filename
sleep 2


echo "\nCreated $homeDir/House/* \n\n"