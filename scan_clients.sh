#!/bin/bash

# get list of available Stations
ESP_STA_LIST=$(sudo iw dev wlan0 scan | grep ESP_STA | awk '{print $2}')

echo "getting list of available stations..."
for STA in $ESP_STA_LIST; do
    echo $STA
done
