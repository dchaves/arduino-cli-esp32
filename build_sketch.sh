FQBN=esp32:esp32:esp32doit-devkit-v1
SKETCKBOOK=$1
SKETCH=$2
docker run -v $PWD/$SKETCHBOOK:/sketchbook -it arduino-cli compile --fqbn $FQBN $SKETCH
