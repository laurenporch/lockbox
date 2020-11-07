#!/usr/local/opt/bash

# To use GNU bash commands, from [https://stackoverflow.com/questions/57972341/how-to-install-and-use-gnu-ls-on-macos]
export PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"

export TERM=xterm-256color
function EXT_COLOR () { echo -ne "\e[$1;38;5;$2m"; }     # REQUIRED FOR GETTING 256 COLORS IN PS1 PROMPT!!! KEEP!!!!

MONTH="$(cut -d' ' -f2 <<< "$(date)")"

if [ "$MONTH" == "Jan" ]; then
    MESSAGE_1="Happy"
    MESSAGE_2="New Year"
    MAIN_COLOR=`EXT_COLOR 1 195`
    DI_COLOR="1;38;5;195"
    ACCENT_COLOR=`EXT_COLOR 1 81`
    EX_COLOR="1;38;5;81"
    PASS_COLOR=`EXT_COLOR 1 33`
    LN_COLOR="1;38;5;33"
    ERROR_COLOR=`EXT_COLOR 1 255`
elif [ "$MONTH" == "Nov" ]; then
    MESSAGE_1="Turkey"
    MESSAGE_2="Time"
    MAIN_COLOR=`EXT_COLOR 1 220`
    DI_COLOR="1;38;5;220"
    ACCENT_COLOR=`EXT_COLOR 1 202`
    EX_COLOR="1;38;5;202"
    PASS_COLOR=`EXT_COLOR 1 130`
    LN_COLOR="1;38;5;130"
    ERROR_COLOR=`EXT_COLOR 1 196`
elif [ "$MONTH" == "Dec" ]; then
    MESSAGE_1="MERRY"
    MESSAGE_2="CHRISTMAS!"
    MAIN_COLOR=`EXT_COLOR 1 46`
    DI_COLOR="1;38;5;46"
    ACCENT_COLOR=`EXT_COLOR 1 196`
    EX_COLOR="1;38;5;196"
    PASS_COLOR=`EXT_COLOR 1 220`
    LN_COLOR="1;38;5;220"
    ERROR_COLOR=`EXT_COLOR 1 250`
else # Default colors
    MESSAGE_1="Clean"
    MESSAGE_2="Slate"
    MAIN_COLOR=`EXT_COLOR 1 231`
    DI_COLOR="1;38;5;231"
    ACCENT_COLOR=`EXT_COLOR 1 232`
    EX_COLOR="1;38;5;232"
    PASS_COLOR=`EXT_COLOR 1 249`
    LN_COLOR="1;38;5;249"
    ERROR_COLOR=`EXT_COLOR 1 243`
fi

DEFAULT_COLOR="\e[0m"

echo -e $PASS_COLOR"~"$ERROR_COLOR"*"$MAIN_COLOR$MESSAGE_1 $ACCENT_COLOR$MESSAGE_2$ERROR_COLOR"*"$PASS_COLOR"~$DEFAULT_COLOR"

LS_COLORS=$LS_COLORS:"di=$DI_COLOR::ex=$EX_COLOR::ln=$LN_COLOR:" ; export LS_COLORS

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
OK_TERM() {
  echo -e "$PASS_COLOR\xE2\x9C\x94$DEFAULT_COLOR"
}
ERROR_TERM() {
  echo -e "$ERROR_COLOR\xE2\x9C\x98$DEFAULT_COLOR"
}
DOMAIN_NAME_TERM() {
  echo -e "$MAIN_COLOR$USER$ACCENT_COLOR@$(hostname)$DEFAULT_COLOR"
}
short_pwd() {
  echo $(pwd) | sed "s/\/Users\/$USER\//~\//"
}
WORKING_DIR_TERM() {
  echo -e "$MAIN_COLOR$(short_pwd)$DEFAULT_COLOR"
}
GIT_BRANCH_TERM() {
  echo -e "$ACCENT_COLOR$(parse_git_branch)$DEFAULT_COLOR"
}
export PS1=$PASS_COLOR"┌─[\`if [ \$? = 0 ]; then echo \$(OK_TERM); else echo \$(ERROR_TERM); fi\`$PASS_COLOR]───[\$(DOMAIN_NAME_TERM)$PASS_COLOR]───[\$(WORKING_DIR_TERM)\$(GIT_BRANCH_TERM)$PASS_COLOR]\n└───▶\[$DEFAULT_COLOR\] "
