#!/bin/bash
# This is a script that toggles rotation of the screen through xrandr,
# and also toggles rotation of the stylus, eraser and cursor through xsetwacom

# Check orientation
orientation=`/usr/bin/xrandr --verbose -q | grep LVDS | awk '{print $6}'`
# Rotate the screen and stylus, eraser and cursor, according to your preferences.
if [ "$1" = "normal" ]; then
    if [ "$orientation" = "normal" ]; then
	/usr/bin/xrandr --output LVDS1 --rotate right
	/usr/bin/xsetwacom set "Wacom Serial Penabled 2FG Touchscreen Pen stylus" Rotate cw
	/usr/bin/xsetwacom set "Wacom Serial Penabled 2FG Touchscreen Pen eraser" Rotate cw
	/usr/bin/xsetwacom set "Wacom Serial Penabled 2FG Touchscreen Finger touch" Rotate cw
    else
	/usr/bin/xrandr --output LVDS1 --rotate normal
	/usr/bin/xsetwacom set "Wacom Serial Penabled 2FG Touchscreen Pen stylus" Rotate none
	/usr/bin/xsetwacom set "Wacom Serial Penabled 2FG Touchscreen Pen eraser" Rotate none
	/usr/bin/xsetwacom set "Wacom Serial Penabled 2FG Touchscreen Finger touch" Rotate none
    fi
elif [ "$1" = "invert" ]; then
    if [ "$orientation" = "normal" ]; then
	/usr/bin/xrandr --output LVDS1 --rotate inverted
	/usr/bin/xsetwacom set "Wacom Serial Penabled 2FG Touchscreen Pen stylus" Rotate half
	/usr/bin/xsetwacom set "Wacom Serial Penabled 2FG Touchscreen Pen eraser" Rotate half
	/usr/bin/xsetwacom set "Wacom Serial Penabled 2FG Touchscreen Finger touch" Rotate half
    elif [ "$orientation" = "inverted" ]; then
	/usr/bin/xrandr --output LVDS1 --rotate normal
	/usr/bin/xsetwacom set "Wacom Serial Penabled 2FG Touchscreen Pen stylus" Rotate none
	/usr/bin/xsetwacom set "Wacom Serial Penabled 2FG Touchscreen Pen eraser" Rotate none
	/usr/bin/xsetwacom set "Wacom Serial Penabled 2FG Touchscreen Finger touch" Rotate none
    elif [ "$orientation" = "right" ]; then
	/usr/bin/xrandr --output LVDS1 --rotate left
	/usr/bin/xsetwacom set "Wacom Serial Penabled 2FG Touchscreen Pen stylus" Rotate ccw
	/usr/bin/xsetwacom set "Wacom Serial Penabled 2FG Touchscreen Pen eraser" Rotate ccw
	/usr/bin/xsetwacom set "Wacom Serial Penabled 2FG Touchscreen Finger touch" Rotate ccw
    elif [ "$orientation" = "left" ]; then
	/usr/bin/xrandr --output LVDS1 --rotate right
	/usr/bin/xsetwacom set "Wacom Serial Penabled 2FG Touchscreen Pen stylus" Rotate cw
	/usr/bin/xsetwacom set "Wacom Serial Penabled 2FG Touchscreen Pen eraser" Rotate cw
	/usr/bin/xsetwacom set "Wacom Serial Penabled 2FG Touchscreen Finger touch" Rotate cw
    fi
fi
