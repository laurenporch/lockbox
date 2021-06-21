monthcolors () {
   PSCRIPT=/NFS/home/lporch/terminalSetupScripts/setPromptColors.sh
   TMP_PSCRIPT=~/setPromptColorsTemp.sh
   GSCRIPT=/NFS/home/lporch/terminalSetupScripts/setGitColors.sh
   TMP_GSCRIPT=~/setGitColorsTemp.sh

   if [ -f $PSCRIPT ]; then
     cp $PSCRIPT $TMP_PSCRIPT
     sed -i 's/MONTH=".*"/MONTH="'$1'"/' $TMP_PSCRIPT
     source $TMP_PSCRIPT
     rm $TMP_PSCRIPT
   fi
   if [ -f $GSCRIPT ]; then
     cp $GSCRIPT $TMP_GSCRIPT
     sed -i 's/MONTH=".*"/MONTH="'$1'"/' $TMP_GSCRIPT
     source $TMP_GSCRIPT
     rm $TMP_GSCRIPT
   fi
}