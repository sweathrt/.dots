#!/bin/sh

layout=$(hyprctl devices -j | gojq -r '.keyboards | .[] | select(.name == "at-translated-set-2-keyboard") | .active_keymap')

if [ "$layout" == "English (US)" ]; then
    echo "us"
elif [ "$layout" == "Russian" ]; then
    echo "ru"
else
    echo "ua"
fi
