#!/bin/bash

# Process name
PROCESS="test"
# URL to check
MONITOR_URL="https://test.com/monitoring/test/api"
# File for logs
LOG_FILE="/var/log/monitoring.log"
# Get current pid and start date of process
CURRENT_PID=$(ps -eo pid,lstart,cmd | grep -m 1 "$PROCESS")

#if process exactly matched
if pgrep -x "$PROCESS" > /dev/null
then
    # if process ever started
    if [ -f /var/run/test_process ]
    then
        # get started pid and date
        GET_START=$(cat /var/run/monitoring)
        # compare them
        if [ "$GET_START" != "$CURRENT_PID" ]
        then
            #if restarted write log and write new pid and date
            echo "$(date) : The 'test' process has been restarted." >> $LOG_FILE
            echo "$CURRENT_PID" > /var/run/monitoring
        fi
    else
        echo "$CURRENT_PID" > /var/run/monitoring
    fi

    # checking if server is available
    if !(curl --silent --fail "$MONITOR_URL" > /dev/null)
    then
        # if server is unavailable write log
        echo "$(date) Process server is unavailable." >> $LOG_FILE
    fi
fi

