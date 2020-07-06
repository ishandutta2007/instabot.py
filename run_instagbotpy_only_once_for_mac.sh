#!/bin/bash

# This is a script to mitigate possibility of multiple parallel cron jobs being triggered(discussed here: https://github.com/timgrossmann/InstaPy/issues/1235)
# The connecting is an example of a cron scheduled every 12 hours
# 0 */12 * * * bash /path/to/LinkedinPy/run_linkedinpy_only_once_for_mac.sh /path/to/LinkedinPy/quickstart.py $USERNAME $PASSWORD

CONFIG_NAME=$1
if [ -z "$1" ]
then
   echo "Error: Missing arguments"
   echo "Usage: bash $0 <config-name>"
   exit 1
fi

if ps aux | grep $CONFIG_NAME | awk '{ print $11 }' | grep python
then
   echo "$CONFIG_NAME is already running"
else
   echo "Starting $CONFIG_NAME"
   instabot-py --ignore-updates -c $CONFIG_NAME
fi
