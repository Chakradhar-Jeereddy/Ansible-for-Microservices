To list docker images stored locally
```
docker images
```
To list all containers
```
docker ps -a
```
To pull images from remote repository to local repo
```
docker pull <imagename>:tag  [If tag is not used, it defaults to latest]
```
To run container in foreground
```
docker run ubuntu
docker run nginx  [Checks for image in local cache, if not found it will pull it from remote repository]
docker images
```
To check actively running container
```
docker ps
```
To start existing containers
```
docker start <conid/conname>
```
To stop container
```
docker stop <conid/conname>
```
To remove container
```
docker rm <conid/conname>
After removal the resources will be freed
docker ps -a
```
To remove multiple containers
```
docker rm conid1 conid2
```
To run nginx webserver in the backend
```
docker run -d --name web_server -p 80:80 nginx
```
To use filter
```
docker ps -a|grep web_server
docket ps --filter name=web_server
```
To stop all containers
```
docker ps -aq (this will list only container ids)
docker stop $(docker ps -aq)
```
To remove all containers
```
docket rm $(docker ps -aq)
docker ps -a
```
To remove images
```
docker image rm imageid
docker images
```
To check at the time we run logs command
```
docker logs <conid/conname>
```
To check resent logs and wait for new logs
```
docker logs -f web_server
curl http://localhost
```
To execute commands inside container
```
docker exec -it web_server /bin/bash  [-it - interactive shell]
#echo "hello world"
#df -h
#cd /usr/share/nginx/html
#ls -a
#cat index.html
```
To build custome image
```
docker build .  [. is the current directory of a Dockerfile]
vi Dockerfile
FROM ubuntu
CMD ["echo","Hello from my first custom docker image"]
```
To get help for docker cli commands
```
docker --help
docket run --help
What ever comes after image name is interpreted differently.
```
