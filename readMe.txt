install image in local environment:
> docker run -it <image_name>

check for installed images:
> docker images

check for created containers:
> docker container ls -a

get inside container bash
> docker exec -it `<container_name>||<container_id>` bash

run image with port, environment variable, etc. (there can be many -p and -e flags)
> docker run -it -p <my_port>:<pre_port> -e <key>=<value> <image_name_with_container>




/* Dockerization of Node.js application */

 create a docker file for layers
> touch Dockerfile (where constrains must be in order, can check it online as "install node in ubuntu/debian/etcs")




/* Publish image to hub */

login hub.docker.com
create repo
create an image with the name provided in docker hub <id_name/repo_name>
> docker build -t <id_name/repo_name> .  (here . => current directory)
> docker push <id_name/repo_name>




/* Docker compose */

# if your file required redix and postgres both
then create file, docker-compose.yml
to run all together/stack 
> docker compose up

to stop whole stack
> docker compose down

to run it from background
> docker compose up -d



/* Create your own network (why? so same network container can communicate with each other) */
> docker network create -d bridge <network_name>

to check all available networks:
> docker network ls

to inspect network
> docker network inspect <network_name>

to use network with container:
> docker run -it --network=<network_name> --name <container_name> <image>




/* mapping volumes */
as after deleting an container, it's all memory is deleted, to prevent that we use volumes
> docker run -it -v <storage_path>:<linked_path> <image>




/* multi-stagements */ 