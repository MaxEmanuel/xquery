FROM ubuntu:16.04
MAINTAINER Maximilian Schuele <m.schuele@tum.de>

# Install node and some tools
RUN apt-get update && apt-get install -y git nodejs npm tmux unzip wget htop g++ make basex && ln -s /usr/bin/nodejs /usr/bin/node

# Install src and modules
ADD . /src
RUN cd /src/ && npm install
RUN cd /src/ && make 
RUN cd /src/ && make install

# Run rest as non root user
RUN useradd -ms /bin/bash xquery
USER xquery
WORKDIR /home/xquery

# Run
EXPOSE 8080
ENV TERM=xterm
CMD ["/src/startup.sh"]
