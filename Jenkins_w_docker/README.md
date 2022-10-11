# Do the following

## 1. build an image: 
    docker build -t jenkins_with_docker_image .

## 2. run the image in a container that persists the installation and settings when the container is killed
    docker run -p 8080:8080 -p 50000:50000 -d -v jenkins_home:/var/jenkins_home --name jenkins_with_docker jenkins_with_docker_image

## 3 check running containers and verify that jenkins_with_docker is active
    docker ps

## 4 get admin activation password by looking in the logs
    docker logs jenkins_with_docker