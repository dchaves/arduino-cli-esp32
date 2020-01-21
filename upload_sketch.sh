FQBN=esp32:esp32:esp32doit-devkit-v1
SKETCKBOOK=$1
SKETCH=$2
DEV=/dev/ttyUSB0
docker run -v $PWD/$SKETCHBOOK:/sketchbook -it arduino-cli upload -p $DEV --fqbn $FQBN $SKETCH