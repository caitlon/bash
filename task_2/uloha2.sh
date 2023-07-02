#!/bin/bash
DATE_CHANGE=$(ls -l --time-style=+"%d %H %M" "$UID" | tr -s ' ' | cut -d ' ' -f6,7,8);
CURRENT_DATE=$(echo $DATE_CHANGE | cut -d ' ' -f1);
CURRENT_HOUR=$(echo $DATE_CHANGE | cut -d ' ' -f2);
CURRENT_MIN=$(echo $DATE_CHANGE | cut -d ' ' -f3);
SUM=$((10#$CURRENT_DATE + 10#$CURRENT_HOUR + 10#$CURRENT_MIN));
printf "%s\n%s\n" "$SUM" "(c) $USER" > "$UID";