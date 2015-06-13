#!/bin/bash
PID=$(pgrep offlineimap)
[[ -n "$PID" ]] && kill $PID
offlineimap -o -u quiet &>/dev/null &
exit 0


#crontab -e
#*/10 * * * * ~/archlinux/shell/offlineimap.sh
