Run the docker container (--rm to remove container when stopped, -P to map all used ports):
docker run -d --rm --name homebridge --net=host -P dvtoever/homebridge:latest
