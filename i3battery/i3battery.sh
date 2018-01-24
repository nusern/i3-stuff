#!/usr/bin/bash

DEVICE="BAT0"
PERCENT=8

DISCHARGING=$(grep Discharging /sys/class/power_supply/${DEVICE}/status)
CAPACITY=$(cat /sys/class/power_supply/${DEVICE}/capacity)
I3PID=$(pgrep -x i3)

if [[ $CAPACITY -le $PERCENT && -n $DISCHARGING && -n $I3PID ]]; then
	DISPLAY=:0 i3-msg fullscreen disable
	DISPLAY=:0 i3-nagbar -m "Charge your battery!"
fi
