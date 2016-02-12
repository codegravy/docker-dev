FROM dev_base

RUN mkdir /workdir
WORKDIR /workdir

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

ADD ./privKey /root/.ssh/id_rsa
ADD ./privKey.pub /root/.ssh/id_rsa.pub

CMD ['/bin/bash']
