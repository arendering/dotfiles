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
--timecolor="$COLOR_1" \
--datecolor="$COLOR_1" \
--timestr="%H:%M" \
--indicator \
--insidecolor="$COLOR_2" \
--ringcolor="$COLOR_1" \
--insidevercolor="$COLOR_2" \
--ringvercolor="$COLOR_2" \
--linecolor="$COLOR_3" \
--layoutcolor="$COLOR_3" \
--keyhlcolor="$COLOR_3" \
-k -e -i $TMP_SCREENSHOT

rm $TMP_SCREENSHOT
