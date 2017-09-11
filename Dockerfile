FROM spybyte/rpi-homebridge:latest 
EXPOSE 2001 5353 9090 51900

RUN apt-get update && apt-get install -y cmake libudev-dev libxrandr-dev python-dev swig 
RUN git clone https://github.com/Pulse-Eight/platform.git
RUN mkdir platform/build
WORKDIR "platform/build"
RUN cmake ..
RUN make
RUN make install
WORKDIR "../../"
RUN git clone https://github.com/Pulse-Eight/libcec.git
RUN mkdir libcec/build
WORKDIR "libcec/build"
RUN sed -i '191,199d' ../src/libcec/cmake/CheckPlatformSupport.cmake
RUN cmake -DRPI_INCLUDE_DIR=/opt/vc/include -DRPI_LIB_DIR=/opt/vc/lib ..
RUN make -j4
RUN make install
RUN ldconfig
WORKDIR "../../"
RUN git clone https://github.com/patlux/node-cec.git 
WORKDIR "node-cec"
RUN npm install -g
WORKDIR ".."
RUN git clone https://github.com/rooi/homebridge-cec.git
WORKDIR "homebridge-cec"
RUN npm install -g
ADD config.json /root/.homebridge/config.json
WORKDIR "/usr/local/homebridge"
