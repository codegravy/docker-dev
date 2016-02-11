FROM dev_base

RUN mkdir /workdir
WORKDIR /workdir

RUN mkdir /git

ADD https://get.docker.com/builds/Linux/i386/docker-latest /usr/bin/docker
RUN chmod +x /usr/bin/docker

ENV DOCKER_HOST='tcp://docker:2375'

ADD ./initGit /git
ADD ./cloneGit /git
ADD ./setup /git
ADD ./teardown /git

ADD ./privKey /root/.ssh/id_rsa
ADD ./privKey.pub /root/.ssh/id_rsa.pub

ADD ./known_hosts /root/.ssh/known_hosts

CMD ['/bin/bash']
