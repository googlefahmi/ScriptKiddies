#!/bin/bash
#######################################################################################
# Purpose : Ping to another server
# Info    : Use this script to check server target accessible or not
# Usage   : ping-me.sh <Filename> / ping-me.sh <IP>
# Version : 1.0 | Stable
########################################################################################

SERVER=$1
if [ $# -eq 0 ]; then
 echo "No arguments provided"
 echo "Usage : $0 <Filename> / $0 <IP>"
 exit 1
elif [ -f $1 ]; then
 cat $SERVER | while read output
 do
  ping -c 2 "$output" > /dev/null
  if [ $? -eq 0 ]; then
  echo "Ping to $output OK"
  else
  echo "Ping to $output FAILED"
  fi
 done
else
 ping -c 2 "$SERVER" > /dev/null
 if [ $? -eq 0 ]; then
  echo "Ping to $output OK"
  else
  echo "Ping to $output FAILED"
  fi
fi
exit 0