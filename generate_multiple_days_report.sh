#!/bin/bash

#########################################################
# Run this script after fetcher.sh                      #
# Change all path values                                #
#########################################################


# Paths
home="/Users/Rudree/Downloads/Hub-v1"
pid="P5004"
devicesPath="$home/$pid/Devices"
dailyEventsPath="$home/$pid/Events"
targetPath="$home/$pid/Reports"

# Create report dir
mkdir -p $targetPath

start=140
end=0

for (( i=$start; i>$end; i-- ));
do
  date=$(date -v -${i}d '+%Y-%m-%d')
  file="${pid}_$date"
  # Copy events from downloaded path to daily folder
  echo "Generating $date report"
  cp "$dailyEventsPath/$pid_$file.json" "$targetPath/$pid_$file.json"
  serenity-events-parser --eventsPath "$targetPath/$pid_$file.json" --devicesPath $devicesPath/${pid}_devices.json
  sleep 1
done

echo "Report for $pid generated"
