# Smarthings CLI Docker imaga

This image contains all the requirements for smartthings-cli

Access https://account.smartthings.com/tokens and save your token at session ./config/cli/config.yaml

## Requirements
 - [Docker engine](https://www.docker.com/get-started)
 
## Build
```console
docker build . -t smartthings
```

## Usage

## Run
Execute the following command to access a shell with smartthings cli binnary and all its dependencies installed.

```console
docker run -it smartthings bash
```

## Known issues

