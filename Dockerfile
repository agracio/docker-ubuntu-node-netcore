FROM ubuntu:bionic

# update apt-get
RUN apt-get update -qq -y && apt-get -qq -y upgrade

# install curl, sudo, wget
RUN apt-get install curl sudo wget -qq -y

RUN mkdir /devvol
VOLUME /devvol

RUN apt-get update

# install dependencies
RUN apt-get install apt-transport-https build-essential libgconf-2-4 python git libglib2.0-dev -qq -y

# install node

RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN apt-get install nodejs -qq -y

# install net core

RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN add-apt-repository universe
RUN apt-get update -qq -y
RUN apt-get install dotnet-sdk-2.2

RUN npm i -g node-gyp
