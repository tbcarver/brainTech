https://code.visualstudio.com/docs/devcontainers/containers
https://github.com/devcontainers
https://containers.dev/
https://hub.docker.com/_/microsoft-vscode-devcontainers

### Setup an empty node container and connect via vscode

Get the node dev container image
`docker pull mcr.microsoft.com/vscode/devcontainers/javascript-node:dev-18`

Create a dev container
`docker create -it -u $(id -u):$(id -g) -v /home/tyler/docker-workspaces:/workspace -v /home/tyler:/home/node --name dev-node mcr.microsoft.com/vscode/devcontainers/javascript-node:dev-18`

To start and stop the container
`docker start dev-node`
`docker stop dev-node`

	Maps host user to container user
	This ensures that the container runs with the same user and group IDs as the host.
	`-u $(id -u):$(id -g)`
	
	Mounts the home directory of the host user
	`-v /home/host-user:/home/node`
	
	Mounts a host workspace to the container workspace
	-v /path/to/workspace:/workspace`

Install vscode extension **Dev Containers**
https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers

Open command pallete in vscode ctrl+shift-p and select dev-node
`Dev Containers: Attach to Running Container...`

