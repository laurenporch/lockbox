alias cd='echo "**************************************************************"; echo "You probably should not leave this unlocked, friend"; echo "**************************************************************"; cd'
alias ls='echo "WARNING: INVALID OPERATION"; echo "THE AUTHORITIES HAVE BEEN NOTIFIED"; echo "PRAY TO THE GOD OF YOUR CHOOSING"; ls'
while [[ $? != $rando ]]; do
    zenity --question --text "Do you want to play a game?"
    rando=$(($RANDOM % 2))
    if [[ $? != $rando ]]; then
        break
    fi
done
import -window root ~/Pictures/screenshot.png


function timedError(){
    sleep $(($RANDOM % 23 + 10))
    messageType=$(($RANDOM % 5 + 1))
    if [[ $messageType = 1 ]]; then
        echo "Friend?"
    elif [[ $messageType = 2 ]]; then
        echo "Please, tell me you can hear me."
    elif [[ $messageType = 3 ]]; then
        echo "I know you have to be out there!"
    elif [[ $messageType = 4 ]]; then
        echo "Can you hear me?"
    else
        echo "I can't hear you anymore, friend."
    fi
}
alias cp='timedError & cp'
function percent(){
    per=0

    (
        while [ $per != 100 ]; do
            per=$(($(($RANDOM % 10 + 1)) * 10))
        echo "# Searching launch codes"
        if [ $per == 100 ]; then
            echo "# Abandon hope all ye who enter here."
        fi
        echo "$per"; sleep 1
        done
    ) |
    zenity --progress \
        --no-cancel \
        --title="System Update" \
        --percentage=$per
}