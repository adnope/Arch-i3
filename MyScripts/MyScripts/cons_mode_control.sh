#!/bin/bash

# Only used for lenovo laptops which has battery conservation mode

echo "Battery conservation mode control"
echo "[1] Enable"
echo "[2] Disable"

echo -n "Enter your choice: "
read confirm

while [[ "$confirm" != "1" ]] && [[ "$confirm" != "2" ]]
do
	echo "That's not a choice wtf?"
	read confirm
done

if [ "$confirm" == "1" ]; then
	echo 1 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode > /dev/null
	echo "Conservation Mode: on"
	
elif [ "$confirm" == "2" ]; then
	echo 0 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode > /dev/null
	echo "Conservation Mode: off"
fi
