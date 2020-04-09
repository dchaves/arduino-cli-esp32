#!/bin/sh -l
HOME=/root
ACTION=$1
shift
SKETCH=$1
shift
BOARD=$1
shift

cd /sketchbook
ln -s /github/workspace /sketchbook/$SKETCH

if [ "$ACTION" = "compile" ]; then
	LIBRARIES="$@"
	if [ ! -z "$LIBRARIES" ]; then 
		for lib in "$@"; do
			/arduino/bin/arduino-cli lib install "$lib"
		done
	fi
	/arduino/bin/arduino-cli $ACTION --fqbn $BOARD $SKETCH
elif [ "$ACTION" = "upload" ]; then
	DEV=$1
	shift
	LIBRARIES="$@"
	if [ ! -z "$LIBRARIES" ]; then 
		for lib in "$@"; do
			/arduino/bin/arduino-cli lib install "$lib"
		done
	fi
	/arduino/bin/arduino-cli $ACTION -p $DEV --fqbn $BOARD $SKETCH
else
	echo "Unknown action"
	exit 1
fi
