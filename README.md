# What is this?
Docker image and utilities to compile and upload esp32 binaries using [arduino-cli](https://github.com/arduino/arduino-cli)

# Usage
1. Install dependencies (Docker version 19.03.5)
2. Run ./build_docker.sh
3. Create an sketch. If you want to create a stub sketch, you can run `docker run -v $PWD/[SKETCHBOOK_PATH]:/sketchbook -it arduino-cli sketch new [SKETCH_NAME]`
3. Run ./build_sketch.sh [SKETCHBOOK_PATH_RELATIVE_TO_CURRENT_DIR] [SKETCH_NAME]
4. Run ./upload_sketch.sh [SKETCHBOOK_PATH_RELATIVE_TO_CURRENT_DIR] [SKETCH_NAME]
