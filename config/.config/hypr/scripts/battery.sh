#!/usr/bin/bash

BATTERY=$(cat /sys/class/power_supply/BAT0/capacity)
if [[ $(cat /sys/class/power_supply/BAT0/status) == "Discharging" ]]; then
	ICON="󰁹"
	if (($BATTERY > 30)); then
		COLOR="\$green"
	elif (($BATTERY > 20)); then
		COLOR="\$yellow"
	else
		COLOR="\$red"
	fi
else
	ICON=""
	COLOR="\$green"
fi

echo "$ICON $BATTERY"
echo "\$batteryColor = $COLOR" >~/.config/hypr/batteryColor.conf
