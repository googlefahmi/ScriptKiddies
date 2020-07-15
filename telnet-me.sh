#!/bin/bash
#######################################################################################
# Purpose : Telnet to another server
# Info    : Use this script to check server port target accessible or not
# Usage   : telnet-me.sh <Filename> <Port> / telnet-me.sh <IP> <Port>
# Version : 1.0 | Stable
########################################################################################

SERVER=$1
PORT=$2
if [ $# -eq 0 ]; then
 echo "No arguments provided"
 echo "Usage : $0 <Filename> <Port> / $0 <IP> <Port>"
 exit 1
elif [ -f $1 ]; then
 cat $SERVER | while read output
 do
         </dev/tcp/$output/$PORT 2>&1
         if [ "$?" -ne 0 ]; then
                 echo "Telnet to $output on port $PORT FAILED"
         else
                 echo "Telnet to $output on port $PORT OK"
         fi
 done
else
        </dev/tcp/$SERVER/$PORT 2>&1
        if [ "$?" -ne 0 ]; then
                echo "Connection to $SERVER on port $PORT FAILED"
        else
                echo "Connection to $SERVER on port $PORT OK"
        fi
fi
exit 0