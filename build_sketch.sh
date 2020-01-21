FQBN=esp32:esp32:esp32doit-devkit-v1
<<<<<<< HEAD
SKETCHBOOK=${PWD}/$1
SKETCH=$2
docker run -v $SKETCHBOOK:/sketchbook -it arduino-cli compile --fqbn $FQBN $SKETCH
=======
SKETCKBOOK=$1
SKETCH=$2
docker run -v $PWD/$SKETCHBOOK:/sketchbook -it arduino-cli compile --fqbn $FQBN $SKETCH
>>>>>>> f20278701e1b5f8250d6957d73a73667cf1a2495
