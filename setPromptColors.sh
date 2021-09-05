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
dir_format="1;38;5;"
function EXT_COLOR () { echo -ne "\e[1;38;5;$1m"; }     # Required for getting 256 colors in PS1 prompt

MAIN_COLOR=`EXT_COLOR $COLOR1`
DI_COLOR=$dir_format"$COLOR1"
ACCENT_COLOR=`EXT_COLOR $COLOR2`
EX_COLOR=$dir_format"$COLOR2"
PASS_COLOR=`EXT_COLOR $COLOR3`
LN_COLOR=$dir_format"$COLOR3"
ERROR_COLOR=`EXT_COLOR $COLOR4`

DEFAULT_COLOR="\e[0m"

echo -e $PASS_COLOR"~"$ERROR_COLOR"*"$MAIN_COLOR$MESSAGE_1 $ACCENT_COLOR$MESSAGE_2$ERROR_COLOR"*"$PASS_COLOR"~"$DEFAULT_COLOR

LS_COLORS=$LS_COLORS:"di=$DI_COLOR::ex=$EX_COLOR::ln=$LN_COLOR:" ; export LS_COLORS

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
git_status_count() {
    short_status=$(git status -s 2>/dev/null)
    long_status="$(git status 2> /dev/null)"
    added=$(echo $short_status | grep "A " | wc -l)
    deleted=$(echo $short_status | grep " D" | wc -l)
    modified=$(echo $short_status | grep " M" | wc -l)
    staged=$(echo $short_status | grep "M " | wc -l)
    untracked=$(echo $short_status | grep "??" | wc -l)
    is_ahead=$(echo -n "$long_status" | grep "ahead")
    is_behind=$(echo -n "$long_status" | grep "behind")
    STATS=''

    up_arrow=$(echo -e "\xE2\x86\x91")
    down_arrow=$(echo -e "\xE2\x86\x93")

    if [ ! -z "$is_ahead" ]; then
        local DIST_VAL=$(echo "$is_ahead" | sed 's/[^0-9]*//g')
        STATS="${DIST_VAL}$up_arrow"
    fi

    if [ ! -z "$is_behind" ]; then
        local DIST_VAL=$(echo "$is_behind" | sed 's/[^0-9]*//g')
        STATS="${STATS}${DIST_VAL}$down_arrow"
    fi

    if [ $added != 0 ]; then
        STATS="$added+"
    fi

    if [ $deleted != 0 ]; then
        STATS="$STATS$deleted-"
    fi

    if [ $modified != 0 ]; then
        STATS="$STATS$modified""*"
    fi

    if [ $staged != 0 ]; then
        STATS="$STATS$staged""^"
    fi

    if [ $untracked != 0 ]; then
        STATS="$STATS${untracked}u"
    fi

    echo "$STATS"
}
git_stats=`git_status_count`
GIT_STATS() {
    echo -e "$ERROR_COLOR${git_stats}$DEFAULT_COLOR"
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
    if [ $NICKNAME ]; then
        echo -e "$MAIN_COLOR$NICKNAME$DEFAULT_COLOR"
    else
      echo -e "$MAIN_COLOR$USER$DEFAULT_COLOR$ACCENT_COLOR@$DEFAULT_COLOR$ACCENT_COLOR$(hostname)$DEFAULT_COLOR"
    fi
}
short_pwd() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo $(pwd) | sed -r "s/\/Users\/$USER\/?/~\//"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo $(pwd) | sed -r "s/\/home\/$USER\/?/~\//"
    fi
}
WORKING_DIR_TERM() {
  echo -e "$MAIN_COLOR$(short_pwd)$DEFAULT_COLOR"
}
GIT_BRANCH_TERM() {
  echo -e "$ACCENT_COLOR$(parse_git_branch)$DEFAULT_COLOR"
}

# Symbols for PS1 prompt
joint=$(echo -e "\xE2\x94\x80")
top_corner=$(echo -e "\xE2\x94\x8C")
bottom_corner=$(echo -e "\xE2\x94\x94")
arrow=$(echo -e "\xE2\x96\xB6")
TOP_CORNER=$PASS_COLOR$top_corner$joint[$DEFAULT_COLOR
INNER_JOINT=$PASS_COLOR]$joint$joint[$DEFAULT_COLOR
BOTTOM_CORNER=$PASS_COLOR$bottom_corner$joint$arrow$DEFAULT_COLOR
END_CAP="$PASS_COLOR]\n$DEFAULT_COLOR"

export PS1="$TOP_CORNER\`if [ \$? = 0 ]; then echo \$(OK_TERM); else echo \$(ERROR_TERM); fi\`$INNER_JOINT\$(DOMAIN_NAME_TERM)$INNER_JOINT\$(WORKING_DIR_TERM)\$(GIT_BRANCH_TERM)$END_CAP$BOTTOM_CORNER "
