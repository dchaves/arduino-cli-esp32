FQBN=esp32:esp32:esp32doit-devkit-v1
SKETCHBOOK=${PWD}/$1
SKETCH=$2
DEV=/dev/ttyUSB0
docker run -v $SKETCHBOOK:/sketchbook -it arduino-cli upload -p $DEV --fqbn $FQBN $SKETCH
