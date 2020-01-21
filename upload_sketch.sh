FQBN=esp32:esp32:esp32doit-devkit-v1
SKETCH=$1
DEV=/dev/ttyUSB0
docker run -v $PWD/sketchbook:/sketchbook -it arduino-cli upload -p $DEV --fqbn $FQBN $SKETCH