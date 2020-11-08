#!/bin/bash
echo "Set Alarm Hour: "
read hour
echo "Set Alarm Minute: "
read minute
read -p "Confirm your alarm @ $hour:$minute? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
echo "YES"
