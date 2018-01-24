#!/usr/bin/bash

DEVICE="BAT0"
PERCENT=9

DISCHARGING=$(grep Discharging /sys/class/power_supply/${DEVICE}/status)
CAPACITY=$(cat /sys/class/power_supply/${DEVICE}/capacity)

if [[ $CAPACITY -le $PERCENT && $DISCHARGING ]]; then
	pgrep -x i3 && DISPLAY=:0 i3-nagbar -m "Charge your battery!" 2>&1 > /dev/null
fi
