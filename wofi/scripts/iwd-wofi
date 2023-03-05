#!/bin/bash

# Get device name
device=$(iwctl device list | awk 'FNR==5 {print$2}')

# Check device is powered on
devicePowered=$(iwctl device "${device}" show | awk 'FNR==7{print$4}')
if [ "${devicePowered}" == "off" ]; then
			res=$(printf "Yes\nNo" | wofi -S dmenu -L 3 -p "${device} if off. Power on?")
			[ "${res}" == "No" ] && exit 1
			iwctl device "${device}" set-property Powered on
fi

# Get connection state
state=$(iwctl station "${device}" show | awk 'FNR==6{print$2}')
scan=$(iwctl station "${device}" show | awk 'FNR==5{print$2}')

# Check if connected
if [ "${state}" == "disconnected" ]; then
		# Turn scanning on...
		iwctl station "${device}" scan on

		# Get available networks
		networks=$(iwctl station "${device}" get-networks | awk 'FNR>4 {print$2}')

		# Choose SSID...
		chosen_SSID=$(echo "${networks}" | wofi -idp "Connect to SSID: ")

		# Connect to SSID...
		wofi -S dmenu -idP "Enter the password for ${chosen_SSID}: " | iwctl station "${device}" connect "${chosen_SSID}"
		notify-send " WIFI" "Connected to ${chosen_SSID}" -t 5000
elif [ "${state}" == "connected"; then
		# Prompt to disconnect
		current_SSID=$(iwctl station "${device}" show | awk 'FNR==7{print$3}')
		result=$(echo -e "Yes\nNo" | wofi -idp "Disconnect from ${current_SSID} ?" -L 2 -l "${location}" -W "${width}")
		if [ "${result}" == "Yes" ]; then
			iwctl station "${device}" disconnect
			notify-send " WIFI" "Disconnected from ${current_SSID}" -t 5000
		fi
fi
