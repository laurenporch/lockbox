#!/user/local/bin/bash

MONTH="$(cut -d' ' -f2 <<< "$(date)")"

if [ "$MONTH" == "Jan" ]; then
    ADDED=195
    CHANGED=81
    UNTRACKED=33
    UNMERGED=255
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
    ADDED=231
    CHANGED=232
    UNTRACKED=249
    UNMERGED=243
fi

sed -i -e "s/added =.*/added = $ADDED/g" ~/.gitconfig
sed -i -e "s/changed =.*/changed = $CHANGED/g" ~/.gitconfig
sed -i -e "s/untracked =.*/untracked = $UNTRACKED/g" ~/.gitconfig
sed -i -e "s/unmerged =.*/unmerged = $UNMERGED/g" ~/.gitconfig
