- Run your first container
   - Use nginx webserver image from dockerhub
   -  docker pull nginx (this will download nginx latest certified image from docker hub to local image cache on docker host)
   -  docker images  (this will list the images stored in local cache of docker host)
     REPOSITORY        TAG       IMAGE ID       CREATED         SIZE
      grafana           chakri    30814e876499   34 hours ago    495MB
      grafana/grafana   latest    c0b69935a246   12 days ago     486MB
      nginx             latest    66f8bdd3810c   2 weeks ago     192MB
      hello-world       latest    d2c94e258dcb   19 months ago   13.3kB

   -  docker run nginx (dockerdeamon will use image from local repo and launch container in foreground)
   -  docker ps (this will list the containers that are active)
   -  docker run -d --name webserver -p 8080:80 nginx
      The above command runs container in detached mode with name webserver and port 8080 is mapped to port 80 of container.
   - docker ps and access the webserver from browser "http://localhost:8080
   - docker logs webserver(container name)   

- Understand container lifecycle
   - Dicuss the different states a container can be in
   - docker ps -a (This will show available containers including those not running)
   - dokcer rm container (remove container and its contents)
   - docker inspect/logs containter(to inspect logs and container configuration)
   - Understand which CLI commands result in which states
-
- Explore the docker CLI
   - Demonstrate essential Docker CLI commands for managing container and images.
   - Explain container behavior and Docker's managment for short-lived vs peristent containters.
   - Demonstrate commands for logging, running commands within container and executing shells.
   - Introduce the docker build process by creating a simple Dockerfile and building a custom
   - docket image.
   - Get help with CLI

  
