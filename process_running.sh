#!/bin/bash
CHECK='CommuniGate fail2ban supervisor'

for app in $CHECK;
	do
		service $app status >/dev/null 2>&1
		
		case $? in
			0) echo "0 Service_$app - $app is running" ;;
			1) echo "2 Service_$app - $app is not running" ;;
			2) echo "2 Service_$app - $app is not running" ;;
			*) echo "2 Service_$app - $app could not be checked" ;;
		esac
done
