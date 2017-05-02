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
RUN apt-get install -y lsb-release apt-transport-https build-essential libssl-dev python git

# install node

RUN curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
RUN  apt-get install -y nodejs

# install net core
RUN sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
RUN apt-get update

RUN apt-get install -y dotnet-dev-1.0.3

RUN npm i -g node-gyp
