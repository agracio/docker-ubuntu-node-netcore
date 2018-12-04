FROM ubuntu:bionic

# update apt-get
RUN apt-get -y update > /dev/null
RUN apt-get -y upgrade > /dev/null

# install curl, sudo, wget
RUN apt-get install -y curl sudo wget > /dev/null

RUN mkdir /devvol
VOLUME /devvol

RUN apt-get -y update > /dev/null

# install dependencies
RUN apt-get install -y apt-transport-https build-essential libgconf-2-4 python git libglib2.0-dev software-properties-common python-software-properties  > /dev/null

# install node

RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN apt-get install -y nodejs > /dev/null

# install net core

RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN add-apt-repository universe
RUN apt-get -y update > /dev/null
RUN apt-get -y install dotnet-sdk-2.2

RUN npm i -g node-gyp
