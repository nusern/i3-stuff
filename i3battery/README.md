# i3-battery

A script and associated files to notify the i3 user when the battery is in danger of running out.

## i3battery.sh

A script to notify the user with `i3-nagbar` that the battery needs to be charged.

* `$DEVICE` is the device found in `/sys/class/power_supply/${DEVICE}/`.
* `$PERCENT` is the percentage at which the warnings will begin to be displayed.

## i3battery.timer, i3battery.service

In the absence of *crond*, these can be used with *systemd*.

```
mkdir -p ~/.config/systemd/user
cp i3battery.{timer,service} ~/.config/systemd/user
systemd --user enable i3battery.timer
systemd --user start i3battery.timer
```
