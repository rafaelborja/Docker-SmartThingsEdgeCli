FROM ubuntu
RUN apt-get update

# Install dependencies
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y \
       unzip \
       wget \
       vim \
       lua5.3 \
       git 

## NodeJS
ENV NODE_VERSION=12.6.0
RUN apt-get install -y curl dirmngr apt-transport-https lsb-release ca-certificates
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get -y install nodejs


# Smartthings cli
RUN wget https://github.com/SmartThingsCommunity/smartthings-cli/releases/download/v0.0.0-pre.32/smartthings-linux.zip
RUN unzip smartthings-linux.zip -d /usr/smartthings
RUN ln -s /usr/smartthings/smartthings /usr/bin/smartthings

## Config
RUN mkdir -p ~/.config/@smartthings/cli
COPY config/cli/config.yaml /root/.config/\@smartthings/cli/
# ADD config/cli/ /root/.config/cli


## Sample drivers
RUN git clone -- https://github.com/SmartThingsDevelopers/SampleDrivers.git /root/SampleDrivers
