#!/bin/sh
export AFSHAR_AUD_PRICE=$(curl -s https://www.afsharex.com.au/ | /usr/local/bin/pup '#comp-l7zbzk3g > h6 > span > span > span > span > span text{}' | awk '{gsub("تومان", "", $0); print}')
echo $AFSHAR_AUD_PRICE
