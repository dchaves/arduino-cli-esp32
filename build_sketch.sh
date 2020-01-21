FQBN=esp32:esp32:esp32doit-devkit-v1
SKETCH=$1
docker run -v $PWD/sketchbook:/sketchbook -it arduino-cli compile --fqbn $FQBN $SKETCH