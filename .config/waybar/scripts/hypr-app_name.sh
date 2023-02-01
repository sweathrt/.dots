#!/bin/bash

# TODO: rework this shit

active_class=$(hyprctl activewindow -j | gojq -r '.class')
[ ! "${active_class^}" == "Null" ] &&  echo "${active_class^}"
