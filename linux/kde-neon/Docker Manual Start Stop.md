# Docker manual start / stop scripts

## Create scripts

```bash
cat << 'EOF' > docker-start.sh && \
chmod +x docker-start.sh && \
cat << 'EOF' > docker-stop.sh && \
chmod +x docker-stop.sh
#!/usr/bin/env sh
sudo systemctl start docker.service
EOF
#!/usr/bin/env sh
sudo systemctl stop docker.service docker.socket containerd.service
EOF
```

## Start Docker

```bash
./docker-start.sh
```

## Stop Docker

```bash
./docker-stop.sh
```

## Verify Docker is stopped

```bash
systemctl status docker.service docker.socket containerd.service
```
