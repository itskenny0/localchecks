#!/bin/bash
CHANGED=`date +'%s' -r /var/log/apiraw.txt`
NOW=`date +'%s'`
DIFF=`expr $NOW - $CHANGED`

if [ $DIFF -gt 30 ]; then
	echo "2 API_Pipe - Log file not refreshed in $DIFF seconds old"
else
	echo "0 API_Pipe - Everything is fine - file refreshed $DIFF seconds ago."
fi
