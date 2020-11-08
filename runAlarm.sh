#!/bin/bash
echo "Set Alarm Hour: "
read hour
echo "Set Alarm Minute: "
read minute
read -p "Confirm your alarm @ $hour:$minute? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
while true; do
    currHour=$(date +%H)
    currMin=$(date +%M)    
    if [ $currHour -eq $hour ] && [ $currMin -eq $minute ]; then
	number1=$((RANDOM%10))
	number2=$((RANDOM%10))
	product=$(($number1*$number2))
	figlet $number1 x $number2 = ?

	$(mpg123 -q /home/pi/math-alarm/alarm.mp3) &
	read -p "Product: " input && [ $input -eq $product ] && killall mpg123 && echo "$input is right. Have a nice day!" && exit 1 || echo "$input is wrong. Try another question."
	
    fi
    sleep 1
done
