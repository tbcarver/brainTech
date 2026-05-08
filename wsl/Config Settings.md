# WSL Windows Integration Settings

## Global config (Windows)

Path:
C:\Users\tyler.carver_fashion\.wslconfig

Example:
```ini
[wsl2]
memory=15GB
```

# Controls WSL VM behavior globally (memory, CPU, etc.)
# Does NOT control Windows ↔ WSL app integration

---

## Per-distro config (inside WSL)

Path:
/etc/wsl.conf

Example:
```ini
[network]
generateResolvConf=true

[wsl2]
guiApplications=false

[interop]
appendWindowsPath=false
```

# [interop]
# appendWindowsPath=false → prevents Windows executables from being added to $PATH
# enabled=true (default) → allows manual execution of Windows binaries (cmd.exe, code, etc.)

---

## Behavior summary

- Windows apps NOT in `$PATH`
- Windows interop still works when explicitly called

Example:
```bash
/mnt/c/Windows/System32/cmd.exe
```

---

## Apply changes

```bash
wsl.exe --shutdown
```
