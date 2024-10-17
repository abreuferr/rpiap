How to Convert a Raspberry Pi 3B into an Access Point Using Docker.

### Management using docker-compose

##### Create and run container (stop with Ctrl+C)
~~~
docker-compose -f wpa2-docker-compose.yml up
~~~
##### Create and run container in the background
~~~
docker-compose -f wpa2-docker-compose.yml up -d
~~~
##### Stop a container in the background
~~~
docker-compose -f wpa2-docker-compose.yml down
~~~
##### Read logs of a container in the background
~~~
docker-compose -f wpa2-docker-compose.yml logs
~~~