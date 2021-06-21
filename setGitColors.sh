#!/bin/bash

MONTH="$(cut -d' ' -f2 <<< "$(date)")"

if [ "$MONTH" == "Jan" ]; then
    ADDED=195
    CHANGED=81
    UNTRACKED=33
    UNMERGED=255
elif [ "$MONTH" == "Feb" ]; then
    ADDED=213
    CHANGED=199
    UNTRACKED=225
    UNMERGED=129
elif [ "$MONTH" == "Mar" ]; then
    ADDED=28
    CHANGED=64
    UNTRACKED=40
    UNMERGED=226
elif [ "$MONTH" == "Apr" ]; then
    ADDED=33
    CHANGED=45
    UNTRACKED=243
    UNMERGED=37
elif [ "$MONTH" == "May" ]; then
    ADDED=46
    CHANGED=51
    UNTRACKED=226
    UNMERGED=207
elif [ "$MONTH" == "Jun" ]; then
    ADDED=39
    CHANGED=220
    UNTRACKED=253
    UNMERGED=198
elif [ "$MONTH" == "Jul" ]; then
    ADDED=39
    CHANGED=160
    UNTRACKED=255
    UNMERGED=21
elif [ "$MONTH" == "Aug" ]; then
    ADDED=33
    CHANGED=227
    UNTRACKED=50
    UNMERGED=208
elif [ "$MONTH" == "Sep" ]; then
    ADDED=28
    CHANGED=166
    UNTRACKED=38
    UNMERGED=53
elif [ "$MONTH" == "Oct" ]; then
    ADDED=28
    CHANGED=202
    UNTRACKED=128
    UNMERGED=252
elif [ "$MONTH" == "Nov" ]; then
    ADDED=220
    CHANGED=202
    UNTRACKED=130
    UNMERGED=196
elif [ "$MONTH" == "Dec" ]; then
    ADDED=28
    CHANGED=196
    UNTRACKED=214
    UNMERGED=153
else # Default colors
    ADDED=118
    CHANGED=87
    UNTRACKED=208
    UNMERGED=213
fi

#sed -i -e 's/$TEXT_TO_FIND.*/$TEXT_TO_PUT/g' ~/.gitconfig
sed -i -e "s/added =.*/added = $ADDED/g" ~/.gitconfig
sed -i -e "s/changed =.*/changed = $CHANGED/g" ~/.gitconfig
sed -i -e "s/untracked =.*/untracked = $UNTRACKED/g" ~/.gitconfig
sed -i -e "s/unmerged =.*/unmerged = $UNMERGED/g" ~/.gitconfig