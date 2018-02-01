#!/bin/bash

#ip=192.168.1.112
#pid="P11"

start=140
end=0

homeDir=~/Downloads/Hub-v1/$2
mkdir -p $homeDir/Events

# Vars
for ((i=start; i>end; i--));
do
  yesterday=$(date -v -${i}d '+%Y-%m-%d')
  after=$(date -v -$(($i+1))d '+%Y-%m-%dT09:00:00Z')
  before="${yesterday}T21:00:00Z"
  url="http://localhost:2999/primitive_events?after=$after&before=$before"

  echo $url
  filename="${2}_$yesterday.json"
  echo "Downloading $filename"
  ssh pi@$1 curl "'"$url"'" > $homeDir/events/$filename
  sleep 2
done

echo "\nCreated $homeDir/Events/* \n\n"