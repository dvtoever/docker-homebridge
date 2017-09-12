#!/bin/bash
docker run -d --rm --device=/dev/vchiq --name cechomebridge --net=host -P -v ~/.cechomebridge/persist:/root/.homebridge/persist dvtoever/cechomebridge:latest
