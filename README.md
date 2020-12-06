# Devcontainer
This repository provides a development container base configuration.

## How to use
On your new vscode project create a folder named ".devcontainer" and add the Dockerfile & devcontainer.json files to it.

## Use pre-builded image
To use this image without re-building the dev container image you can replace the Dockerfile content with:

```dockerfile
FROM sundaeparty/devcontainer:latest
```
