#!/bin/bash

#sed -i -e 's/$TEXT_TO_FIND.*/$TEXT_TO_PUT/g' ~/.gitconfig
sed -i -e "s/added =.*/added = $COLOR1/g" ~/.gitconfig
sed -i -e "s/changed =.*/changed = $COLOR2/g" ~/.gitconfig
sed -i -e "s/untracked =.*/untracked = $COLOR3/g" ~/.gitconfig
sed -i -e "s/unmerged =.*/unmerged = $COLOR4/g" ~/.gitconfig