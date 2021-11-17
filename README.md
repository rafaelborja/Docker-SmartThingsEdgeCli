Smarthings CLI Docker imaga

This image contains all the requirements for smartthings-cli

Access https://account.smartthings.com/tokens and save your token at session ./config/cli/config.yaml


## Build
docker build . -t smartthings

## Run
winpty docker run -it smartthings bash



