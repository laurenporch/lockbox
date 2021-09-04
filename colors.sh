#!/bin/bash

# Default values
MESSAGE_1="Clean"
MESSAGE_2="Slate"
COLOR1=51
COLOR2=118
COLOR3=118
COLOR4=160

MONTH="$(cut -d' ' -f2 <<< "$(date)")"

if [ "$MONTH" == "Jan" ]; then
    MESSAGE_1="Happy"
    MESSAGE_2="New Year"
    COLOR1=195
    COLOR2=81
    COLOR3=33
    COLOR4=255
elif [ "$MONTH" == "Feb" ]; then
    MESSAGE_1="Valentine's"
    MESSAGE_2="Day"
    COLOR1=213
    COLOR2=199
    COLOR3=225
    COLOR4=129
elif [ "$MONTH" == "Mar" ]; then
    MESSAGE_1="Leprechaun"
    MESSAGE_2="Luck"
    COLOR1=28
    COLOR2=64
    COLOR3=40
    COLOR4=226
elif [ "$MONTH" == "Apr" ]; then
    MESSAGE_1="April"
    MESSAGE_2="Showers"
    COLOR1=33
    COLOR2=45
    COLOR3=243
    COLOR4=37
elif [ "$MONTH" == "May" ]; then
    MESSAGE_1="May"
    MESSAGE_2="Flowers"
    COLOR1=46
    COLOR2=51
    COLOR3=226
    COLOR4=207
elif [ "$MONTH" == "Jun" ]; then
    MESSAGE_1="Summer's"
    MESSAGE_2="Here!"
    COLOR1=39
    COLOR2=220
    COLOR3=253
    COLOR4=198
elif [ "$MONTH" == "Jul" ]; then
    MESSAGE_1="Celebrate"
    MESSAGE_2="Independence"
    COLOR1=39
    COLOR2=160
    COLOR3=255
    COLOR4=21
elif [ "$MONTH" == "Aug" ]; then
    MESSAGE_1="Beach"
    MESSAGE_2="Time"
    COLOR1=33
    COLOR2=227
    COLOR3=50
    COLOR4=208
elif [ "$MONTH" == "Sep" ]; then
    MESSAGE_1="Summer's"
    MESSAGE_2="End"
    COLOR1=28
    COLOR2=166
    COLOR3=38
    COLOR4=53
elif [ "$MONTH" == "Oct" ]; then
    MESSAGE_1="SpOo ~"
    MESSAGE_2="~ OoKy"
    COLOR1=28
    COLOR2=202
    COLOR3=128
    COLOR4=252
elif [ "$MONTH" == "Nov" ]; then
    MESSAGE_1="Turkey"
    MESSAGE_2="Time"
    COLOR1=220
    COLOR2=202
    COLOR3=130
    COLOR4=196
elif [ "$MONTH" == "Dec" ]; then
    MESSAGE_1="MERRY"
    MESSAGE_2="CHRISTMAS!"
    COLOR1=28
    COLOR2=196
    COLOR3=214
    COLOR4=153
fi

export MESSAGE_1=$MESSAGE_1 MESSAGE_2=$MESSAGE_2 COLOR1=$COLOR1 COLOR2=$COLOR2 COLOR3=$COLOR3 COLOR4=$COLOR4