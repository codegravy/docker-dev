FROM ubuntu:15.10

# Basic setup files
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git vim curl wget unzip tar

RUN mkdir /workdir
WORKDIR /workdir

VOLUME /workdir

RUN mkdir /git

ADD https://get.docker.com/builds/Linux/i386/docker-latest /usr/bin/docker
RUN chmod +x /usr/bin/docker

ENV DOCKER_HOST='tcp://docker:2375'

ADD ./initGit /usr/local/bin
ADD ./cloneGit /usr/local/bin
ADD ./setup /usr/local/bin
ADD ./teardown /usr/local/bin
ADD ./activate /usr/local/bin

ADD ./known_hosts /root/.ssh/known_hosts

CMD ['/bin/bash']
