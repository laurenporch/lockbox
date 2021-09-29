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

echo -e ${PASS_COLOR}"~"${ERROR_COLOR}"*"${MAIN_COLOR}${MESSAGE_1} ${ACCENT_COLOR}${MESSAGE_2}${ERROR_COLOR}"*"${PASS_COLOR}"~"${DEFAULT_COLOR}

LS_COLORS=$LS_COLORS:"di=$DI_COLOR::ex=$EX_COLOR::ln=$LN_COLOR:" ; export LS_COLORS

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
git_status_count() {
    if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" == "true" ]; then
        BRANCH_NAME=$(prase_git_branch)
        commit_diff="$(git rev-list --left-right --count ${BRANCH_NAME}...origin/${BRANCH_NAME})"
        ahead="$(cut -d$' ' -f1 <<< $commit_diff)"
        behind="$(cut -d$' ' -f2 <<< $commit_diff)"
        
        up_arrow=$(echo -e "\xE2\x86\x91")
        down_arrow=$(echo -e "\xE2\x86\x93")
        
        STATS=""
        space=""

        if [ $ahead -gt 0 ]; then
            STATS="${ahead}${up_arrow}"
            space=" "
        fi

        if [ $behind -gt 0 ]; then
            STATS="${STATS}${space}${down_arrow}"
        fi
        
        mc=0 dc=0 uc=0 ac=0 sc=0 rc=0 cc=0
        local line status path name
        IFS=''
        while read -r line; do
            [ "$line" ] || continue
            status=${line:0:2}
            path=${line:3}
            case "$status" in
                " M") ((mc++)) ;;
                " D") ((dc++)) ;;
                "D ") ((dc++)) ;;
                "??") ((uc++)) ;;
                "A ") ((ac++)) ;;
                "M ") ((sc++)) ;;
                "R ") ((rc++)) ;;
                "MM")
                    ((sc++))
                    ((mc++)) ;;
                "UU") ((cc++)) ;;
                *) echo "unsupported status on line $line"

        if [ $mc -gt 0 ]; then
            STATS="${STATS}${space}${mc}*"
            space=" "
        fi

        if [ $dc -tg 0 ]; then
            STATS="${STATS}${space}${dc}-"
            space=" "
        fi

        if [ $uc -gt 0 ]; then
            STATS="${STATS}${space}${uc}?"
            space=" "
        fi

        if [ $ac -gt 0 ]; then
            STATS="${STATS}${space}${ac}+"
            space=" "
        fi

        if [ $sc -gt 0 ]; then
            STATS="${STATS}${space}${sc}^"
            space=" "
        fi
        
        if [ $rc -gt 0 ]; then
            STATS="${STATS}${space}${rc}="
            space=" "
        fi
        
        if [ $cc -gt 0 ]; then
            STATS="${STATS}${space}${cc}!"
            space=" "
        fi

        echo "${space}${ERROR_COLOR}${STATS}${DEFAULT_COLOR}"
    fi
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
  echo -e "${MAIN_COLOR}${GCC} $(get_gcc_version)${DEFAULT_COLOR}"
}
OK_TERM() {
  echo -e "${PASS_COLOR}\xE2\x9C\x94${DEFAULT_COLOR}"
}
ERROR_TERM() {
  echo -e "${ERROR_COLOR}\xE2\x9C\x98${DEFAULT_COLOR}"
}
DOMAIN_NAME_TERM() {
    if [ $NICKNAME ]; then
        echo -e "${MAIN_COLOR}${NICKNAME}${DEFAULT_COLOR}"
    else
      echo -e "${MAIN_COLOR}${USER}${DEFAULT_COLOR}${ACCENT_COLOR}@${DEFAULT_COLOR}${ACCENT_COLOR}$(hostname)${DEFAULT_COLOR}"
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
  echo -e "${MAIN_COLOR}$(short_pwd)${DEFAULT_COLOR}"
}
GIT_BRANCH_TERM() {
    if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" == "true" ]; then
        echo -e "${ACCENT_COLOR}$(parse_git_branch)${DEFAULT_COLOR}"
    fi
}

# Symbols for PS1 prompt
joint=$(echo -e "\xE2\x94\x80")
top_corner=$(echo -e "\xE2\x94\x8C")
bottom_corner=$(echo -e "\xE2\x94\x94")
arrow=$(echo -e "\xE2\x96\xB6")
TOP_CORNER=${PASS_COLOR}${top_corner}${joint}[${DEFAULT_COLOR}
INNER_JOINT=${PASS_COLOR}]${joint}${joint}[${DEFAULT_COLOR}
BOTTOM_CORNER="\[\e[1;38;5;${COLOR3}m\]${bottom_corner}${joint}${arrow}\[${DEFAULT_COLOR}\]"
END_CAP="${PASS_COLOR}]${DEFAULT_COLOR}\n"

export PS1="${TOP_CORNER}\`if [ \$? = 0 ]; then echo \$(OK_TERM); else echo \$(ERROR_TERM); fi\`${INNER_JOINT}\$(DOMAIN_NAME_TERM)${INNER_JOINT}\$(WORKING_DIR_TERM)\$(GIT_BRANCH_TERM)${END_CAP}${BOTTOM_CORNER} "
