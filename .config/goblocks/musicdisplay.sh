#!/usr/bin/env bash
echo $(playerctl metadata --format '{{ artist }} - {{ title }}')
