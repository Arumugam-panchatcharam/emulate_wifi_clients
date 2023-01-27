#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Please provide SSID and Password"
    exit -1
fi

SSID=$1
PSK=$2
TIMEOUT=${3:-10}

echo "SSID is $SSID"
echo "PSK is $PSK"
echo "TIMEOUT is $TIMEOUT"

# disconnect previous connection
sudo iw dev wlan0 disconnect

# get list of available Stations
ESP_STA_LIST=$(sudo iw dev wlan0 scan | grep ESP_STA | awk '{print $2}')

echo "getting list of available stations..."
for STA in $ESP_STA_LIST; do
    echo $STA
done

echo " "

for STA in $ESP_STA_LIST; do
    # disconnect previous connection
    sudo iw dev wlan0 disconnect
    echo Connecting $STA to $SSID
    ret=$(sudo iw wlan0 connect -w $STA)
    status=$(echo $ret | awk '{print $4}')

    if [ "$status" = "connected" ]; then
        echo "connected to $STA Post SSID and PSK"
        curl -v -k -L -X POST http://192.168.4.1/setwifi \
            -H "Content-Type: application/x-www-form-urlencoded" \
            -d "aplist=Select+a+Network...&wifi_ssid=${SSID}&wifi_password=${PSK}&timeout=${TIMEOUT}"
        sleep 10
    else
        echo "Failed to connect with $ret"
    fi
    sleep 1
done
