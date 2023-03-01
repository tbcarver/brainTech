https://code.visualstudio.com/docs/devcontainers/containers
https://github.com/devcontainers
https://containers.dev/
https://hub.docker.com/_/microsoft-vscode-devcontainers

### Setup an empty node container and connect via vscode

`docker pull mcr.microsoft.com/vscode/devcontainers/javascript-node:dev-18`

`docker run -it -u $(id -u):$(id -g) -v /home/tyler/docker-workspaces:/workspace -v /home/tyler:/home/node mcr.microsoft.com/vscode/devcontainers/javascript-node:dev-18`

	add to mount the home directory of the host
	`-v /home/tyler:/home/node`

	This command uses command substitution to get the current user and group IDs on the host (`$(id -u)` and `$(id -g)`, respectively) and passes them to the `-u` option of the `docker run` command. This ensures that the container runs with the same user and group IDs as the host.

	-v /path/to/workspace:/workspace`: This parameter mounts the local directory located at `/path/to/workspace` into the container at the `/workspace` directory. This allows you to share files between the host machine and the container, and work on your project files from within the container.

Install vscode extension **Dev Containers**

Open command pallete in vscode ctrl+shift-p, `Dev Containers: Attach to Running Container...`

