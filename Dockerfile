FROM ubuntu:bionic

# update apt-get
RUN apt-get update -qq -y && apt-get -qq -y upgrade

# install curl, sudo, wget
RUN apt-get install curl sudo wget -qq -y

RUN mkdir /devvol
VOLUME /devvol

RUN apt-get update

# install dependencies
RUN apt-get install -qq -y apt-transport-https build-essential libgconf-2-4 python git libglib2.0-dev

# install node

RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN apt-get install -y nodejs

# install net core

RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
RUN sudo mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/prod.list 
RUN sudo mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
RUN sudo chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
RUN sudo chown root:root /etc/apt/sources.list.d/microsoft-prod.list

RUN apt-get -qq update
RUN apt-get -qq install -y dotnet-sdk-2.1

RUN npm i -g node-gyp
