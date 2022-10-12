FROM jenkins/jenkins:lts-jdk11
#FROM jenkins/jnlp-agent-docker
USER root
RUN apt -y update && apt -y upgrade
RUN apt -y install curl
#RUN apt -y install docker
# RUN apt -y install docker.io
RUN curl https://get.docker.com/ > dockerinstall && chmod 777 dockerinstall && ./dockerinstall
# RUN  systemctl enable docker.service
# RUN  systemctl enable containerd.service
#CMD ["service", "docker", "start"]
CMD service docker start && /bin/bash
# "enable containerd.service"]

kind
--kubernetes
--jenkins image --
--running inside kubernetes
--running and then disapering
----
docker --

kind--

script for setting up kind
--
