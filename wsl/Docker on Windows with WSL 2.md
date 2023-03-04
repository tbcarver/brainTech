### To access the docker volumes from Ubuntu terminal

The docker files can be found outside of the Ubuntu or distro folders
`\\wsl$\docker-desktop-data`

The Ubuntu terminal root `\` is mounted to `\\wsl$\Ubuntu`

Mount the windows directory inside of ubuntu
`sudo mount -t drvfs '\\wsl$\docker-desktop-data\data\docker\volumes' /mnt/docker-volumes`