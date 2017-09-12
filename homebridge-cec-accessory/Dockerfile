FROM dvtoever/cechomebridge:latest

WORKDIR "/usr/local/homebridge"
WORKDIR "homebridge-cec-accessory"
RUN npm uninstall -g homebridge-cec 
RUN npm install -g homebridge-cec-accessory 
ADD config.json /root/.homebridge/config.json
WORKDIR "/usr/local/homebridge"
