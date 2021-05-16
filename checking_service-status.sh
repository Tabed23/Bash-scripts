#!/bin/bash

read -p "enter the service name:" services
status=$(systemctl status $services | awk 'NR=3 { print $2 }')
echo -e "current status of $service is : \033[92m$status\033[0m"

