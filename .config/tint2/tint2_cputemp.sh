#!/bin/bash

maxtemp=0

for temp in $(sensors | grep "^Core" | grep -e '+.*C' | cut -f 2 -d '+' | cut -f 1 -d ' ' | sed 's/°C//'); do
	if [ $(echo "$temp > $maxtemp" | bc) -eq 1 ]; then
		maxtemp=$temp
	fi
done

echo $maxtemp | tr -d '[:space:]'
echo "°C"
