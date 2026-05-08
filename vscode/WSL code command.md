# WSL → VS Code (`code` command without Windows PATH linking)

## Create script

```bash
mkdir -p ~/bin && cat > ~/bin/code <<'EOF'
#!/usr/bin/env bash

wslDistroName="Ubuntu-22.04"

if [ $# -eq 0 ]; then
  targetPath="$(pwd)"
else
  targetPath="$(realpath "$1")"
fi

/mnt/c/Windows/System32/cmd.exe /C code --folder-uri "vscode-remote://wsl+${wslDistroName}${targetPath}"
EOF
chmod +x ~/bin/code

### Validate
which code
code .
code ./some/relative/path
