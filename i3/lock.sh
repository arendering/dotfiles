#!/usr/bin/bash

TMP_SCREENSHOT="/tmp/screen.png"

# make original screenshot
scrot $TMP_SCREENSHOT

# make screenshot fuzzy
convert $TMP_SCREENSHOT -scale 10% -scale 1000% $TMP_SCREENSHOT

COLOR_1="ffb52aff" # orange
COLOR_2="38495bb4" # grey 
COLOR_3="0faceaff" # blue

i3lock \
--keylayout 2 \
--time-color="$COLOR_1" \
--date-color="$COLOR_1" \
--time-str="%H:%M" \
--indicator \
--inside-color="$COLOR_2" \
--ring-color="$COLOR_1" \
--insidever-color="$COLOR_2" \
--ringver-color="$COLOR_2" \
--line-color="$COLOR_3" \
--layout-color="$COLOR_3" \
--keyhl-color="$COLOR_3" \
-k -e -i $TMP_SCREENSHOT

rm $TMP_SCREENSHOT
