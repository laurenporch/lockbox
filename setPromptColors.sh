#!/bin/bash

# Detecting OS type [https://stackoverflow.com/questions/394230/how-to-detect-the-os-from-a-bash-script]
if [[ "$OSTYPE" == "darwin"* ]]; then
  # To get this ^ to work...
  # 1. Install Homebrew [https://brew.sh/]
  # 2. Install updated bash [https://itnext.io/upgrading-bash-on-macos-7138bd1066ba]

  # To use GNU bash commands
  # 1. run `brew install coreutils` [https://stackoverflow.com/questions/57972341/how-to-install-and-use-gnu-ls-on-macos]
  # 2. The following two directories should now exist and be available to source
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"

  HOME_PATH="\/Users\/"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  HOME_PATH="\/home\/"
fi

# Colors for the terminal:
#   Terminal Background: #2E3436
#   Terminal Text Color: #D3D7CF

export TERM=xterm-256color
function EXT_COLOR () { echo -ne "\e[$1;38;5;$2m"; }     # Required for getting 256 colors in PS1 prompt

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
elif [ "$MONTH" == "Feb" ]; then
    MESSAGE_1="Valentine's"
    MESSAGE_2="Day"
    MAIN_COLOR=`EXT_COLOR 1 213`
    DI_COLOR="1;38;5;213"
    ACCENT_COLOR=`EXT_COLOR 1 199`
    EX_COLOR="1;38;5;199"
    PASS_COLOR=`EXT_COLOR 1 225`
    LN_COLOR="1;38;5;225"
    ERROR_COLOR=`EXT_COLOR 1 129`
elif [ "$MONTH" == "Mar" ]; then
    MESSAGE_1="Leprechaun"
    MESSAGE_2="Luck"
    MAIN_COLOR=`EXT_COLOR 1 28`
    DI_COLOR="1;38;5;28"
    ACCENT_COLOR=`EXT_COLOR 1 64`
    EX_COLOR="1;38;5;64"
    PASS_COLOR=`EXT_COLOR 1 40`
    LN_COLOR="1;38;5;40"
    ERROR_COLOR=`EXT_COLOR 1 226`
elif [ "$MONTH" == "Apr" ]; then
    MESSAGE_1="April"
    MESSAGE_2="Showers"
    MAIN_COLOR=`EXT_COLOR 1 33`
    DI_COLOR="1;38;5;33"
    ACCENT_COLOR=`EXT_COLOR 1 45`
    EX_COLOR="1;38;5;45"
    PASS_COLOR=`EXT_COLOR 1 243`
    LN_COLOR="1;38;5;243"
    ERROR_COLOR=`EXT_COLOR 1 37`
elif [ "$MONTH" == "May" ]; then
    MESSAGE_1="May"
    MESSAGE_2="Flowers"
    MAIN_COLOR=`EXT_COLOR 1 46`
    DI_COLOR="1;38;5;46"
    ACCENT_COLOR=`EXT_COLOR 1 51`
    EX_COLOR="1;38;5;51"
    PASS_COLOR=`EXT_COLOR 1 226`
    LN_COLOR="1;38;5;226"
    ERROR_COLOR=`EXT_COLOR 1 207`
elif [ "$MONTH" == "Jun" ]; then
    MESSAGE_1="Summer's"
    MESSAGE_2="Here!"
    MAIN_COLOR=`EXT_COLOR 1 39`
    DI_COLOR="1;38;5;39"
    ACCENT_COLOR=`EXT_COLOR 1 220`
    EX_COLOR="1;38;5;220"
    PASS_COLOR=`EXT_COLOR 1 253`
    LN_COLOR="1;38;5;253"
    ERROR_COLOR=`EXT_COLOR 1 198`
elif [ "$MONTH" == "Jul" ]; then
    MESSAGE_1="Celebrate"
    MESSAGE_2="Independence"
    MAIN_COLOR=`EXT_COLOR 1 39`
    DI_COLOR="1;38;5;39"
    ACCENT_COLOR=`EXT_COLOR 1 160`
    EX_COLOR="1;38;5;160"
    PASS_COLOR=`EXT_COLOR 1 255`
    LN_COLOR="1;38;5;255"
    ERROR_COLOR=`EXT_COLOR 1 21`
elif [ "$MONTH" == "Aug" ]; then
    MESSAGE_1="Beach"
    MESSAGE_2="Time"
    MAIN_COLOR=`EXT_COLOR 1 33`
    DI_COLOR="1;38;5;33"
    ACCENT_COLOR=`EXT_COLOR 1 227`
    EX_COLOR="1;38;5;227"
    PASS_COLOR=`EXT_COLOR 1 50`
    LN_COLOR="1;38;5;50"
    ERROR_COLOR=`EXT_COLOR 1 208`
elif [ "$MONTH" == "Sep" ]; then
    MESSAGE_1="Who"
    MESSAGE_2="knows..."
    MAIN_COLOR=`EXT_COLOR 1 28`
    DI_COLOR="1;38;5;28"
    ACCENT_COLOR=`EXT_COLOR 1 166`
    EX_COLOR="1;38;5;166"
    PASS_COLOR=`EXT_COLOR 1 38`
    LN_COLOR="1;38;5;38"
    ERROR_COLOR=`EXT_COLOR 1 53`
elif [ "$MONTH" == "Oct" ]; then
    MESSAGE_1="SpOo ~"
    MESSAGE_2="~ OoKy"
    MAIN_COLOR=`EXT_COLOR 1 28`
    DI_COLOR="1;38;5;28"
    ACCENT_COLOR=`EXT_COLOR 1 202`
    EX_COLOR="1;38;5;202"
    PASS_COLOR=`EXT_COLOR 1 128`
    LN_COLOR="1;38;5;128"
    ERROR_COLOR=`EXT_COLOR 1 252`
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
    MAIN_COLOR=`EXT_COLOR 1 28`
    DI_COLOR="1;38;5;28"
    ACCENT_COLOR=`EXT_COLOR 1 196`
    EX_COLOR="1;38;5;196"
    PASS_COLOR=`EXT_COLOR 1 214`
    LN_COLOR="1;38;5;214"
    ERROR_COLOR=`EXT_COLOR 1 153`
else # Default colors
    MESSAGE_1="Clean"
    MESSAGE_2="Slate"
    MAIN_COLOR=`EXT_COLOR 1 51`
    DI_COLOR="1;38;5;51"
    ACCENT_COLOR=`EXT_COLOR 1 118`
    EX_COLOR="1;38;5;118"
    PASS_COLOR=`EXT_COLOR 1 118`
    LN_COLOR="1;38;5;118"
    ERROR_COLOR=`EXT_COLOR 1 160`
fi

DEFAULT_COLOR="\e[0m"

echo -e $PASS_COLOR"~"$ERROR_COLOR"*"$MAIN_COLOR$MESSAGE_1 $ACCENT_COLOR$MESSAGE_2$ERROR_COLOR"*"$PASS_COLOR"~"$DEFAULT_COLOR

LS_COLORS=$LS_COLORS:"di=$DI_COLOR::ex=$EX_COLOR::ln=$LN_COLOR:" ; export LS_COLORS

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
get_gcc_version() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        gcc -dumpversion
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        gcc -dumpfullversion
    fi
}
GCC_TERM() {
  GCC="GCC"
  echo -e "$MAIN_COLOR$GCC $(get_gcc_version)$DEFAULT_COLOR"
}
OK_TERM() {
  echo -e "$PASS_COLOR\xE2\x9C\x94$DEFAULT_COLOR"
}
ERROR_TERM() {
  echo -e "$ERROR_COLOR\xE2\x9C\x98$DEFAULT_COLOR"
}
DOMAIN_NAME_TERM() {
  echo -e "$MAIN_COLOR$USER$DEFAULT_COLOR$ACCENT_COLOR@$DEFAULT_COLOR$ACCENT_COLOR$(hostname)$DEFAULT_COLOR"
}
short_pwd() {
  echo $(pwd) | sed -r "s/\/home\/$USER\/?/~\//"
}
WORKING_DIR_TERM() {
  echo -e "$MAIN_COLOR$(short_pwd)$DEFAULT_COLOR"
}
GIT_BRANCH_TERM() {
  echo -e "$ACCENT_COLOR$(parse_git_branch)$DEFAULT_COLOR"
}
export PS1="$PASS_COLOR""┌─[\`if [ \$? = 0 ]; then echo \$(OK_TERM); else echo \$(ERROR_TERM); fi\`$PASS_COLOR]───[\$(DOMAIN_NAME_TERM)$PASS_COLOR]───[\$(WORKING_DIR_TERM)\$(GIT_BRANCH_TERM)$PASS_COLOR]───[\$(GCC_TERM)$PASS_COLOR]\n└───▶\[$DEFAULT_COLOR\] "
