#!/usr/bin/env bash

BATTERY=$(cat /sys/class/power_supply/BAT1/capacity)
if [[ $(cat /sys/class/power_supply/BAT1/status) == "Discharging" ]]; then
	ICON="󰁹"
	if (($BATTERY > 30)); then
		COLOR="rgb(34ec23)"
	elif (($BATTERY > 20)); then
		COLOR="rgb(ffcc00)"
	else
		COLOR="rgb(e92d4d)"
	fi
else
	ICON=""
	COLOR="rgb(34ec23)"
fi

echo "$ICON $BATTERY%"
echo "\$batteryColor = $COLOR" >"$XDG_CONFIG_HOME/hypr/batteryColor.conf"
