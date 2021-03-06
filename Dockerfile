FROM debian:stretch-slim
#RUN apk upgrade --no-cache && apk add --no-cache curl libstdc++
RUN apt-get update && apt-get upgrade -y && apt-get install -y curl python python-serial python3 python3-serial
RUN mkdir -p /arduino
WORKDIR /arduino
RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh
ADD config/arduino-cli.yaml /root/.arduino15/arduino-cli.yaml
RUN /arduino/bin/arduino-cli core update-index 
RUN /arduino/bin/arduino-cli core install esp32:esp32
RUN /arduino/bin/arduino-cli core install esp8266:esp8266
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && mkdir -p /sketchbook
WORKDIR /sketchbook
ENTRYPOINT ["/entrypoint.sh"]
