FROM ubuntu:latest

# update apt-get
RUN apt-get update -y && apt-get -y upgrade

# install curl
RUN apt-get install curl -y

# install sudo
RUN apt-get install sudo -y

RUN mkdir /devvol
VOLUME /devvol

RUN apt-get update

# install dependencies
RUN apt-get install -y lsb-release apt-transport-https build-essential libssl-dev python

# install nvm
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
RUN export NVM_DIR="$HOME/.nvm"
RUN [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
RUN [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 

# install node
RUN nvm install 7.8.0

# install net core
RUN sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
RUN apt-get update

RUN apt-get install -y dotnet-dev-1.0.3

RUN npm i -g node-gyp
