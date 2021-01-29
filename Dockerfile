FROM ubuntu:18.04
MAINTAINER Maximilian Schuele <m.schuele@tum.de>

ENV DEBIAN_FRONTEND noninteractive

# Install node and some tools
RUN apt-get update && apt-get install -y git nodejs npm tmux unzip wget htop g++ make basex openjdk-11-jdk libjing-java libxml-commons-resolver1.1-java libjline-java

# Install src and modules
ADD . /src
RUN cd /src/ && npm install && make && make install

# Run rest as non root user
RUN useradd -ms /bin/bash xquery
USER xquery
WORKDIR /home/xquery

# Run
EXPOSE 8080
ENV TERM=xterm
CMD ["/src/startup.sh"]
