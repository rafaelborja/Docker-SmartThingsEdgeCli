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
RUN wget https://github.com/SmartThingsCommunity/smartthings-cli/releases/download/v0.0.0-pre.32/smartthings-linux.zip -P /tmp/
RUN unzip /tmp/smartthings-linux.zip -d /usr/smartthings
RUN ln -s /usr/smartthings/smartthings /usr/bin/smartthings

## Config
RUN mkdir -p ~/.config/@smartthings/cli
COPY config/cli/config.yaml /root/.config/\@smartthings/cli/
ARG SMARTTHINGS_TOKEN
#RUN sed "s/SMARTTHINGS_TOKEN/${SMARTTHINGS_TOKEN}/g" /root/.config/\@smartthings/cli/config.yaml
#RUN echo "THIS IS A TEST ${SMARTTHINGS_TOKEN} "
# COMPOSE IS BETTER
# ADD config/cli/ /root/.config/cli

RUN wget https://github.com/SmartThingsCommunity/SmartThingsEdgeDrivers/releases/download/apiv0_40/lua_libs-api_v0_OPEN_BETA_40x.tar.gz -P /root/
RUN LUA_PATH=/root/lua_libs-api_vX/?.lua;/path/to/lua_libs-api_vX/?/init.lua;./?.lua;./?/init.lua;

# Autocomplete
RUN printf "$(smartthings autocomplete:script bash)" >> ~/.bashrc; source ~/.bashrc

## Sample drivers
RUN git clone -- https://github.com/SmartThingsDevelopers/SampleDrivers.git /root/SampleDrivers
