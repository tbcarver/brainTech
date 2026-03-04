## Grant all policies

`sudo nano /var/lib/polkit-1/localauthority/10-vendor.d/com.ubuntu.desktop.pkla`

```
[Allow your_username to perform Polkit actions without authentication]
Identity=unix-user:tyler
Action=*
ResultAny=yes
ResultInactive=yes
ResultActive=yes
```

`sudo systemctl restart polkit`

## System policy prevents control of network connections

may not be necessary: (test without) `sudo usermod -aG netdev,tty tyler`

`sudo nano /etc/polkit-1/localauthority/50-local.d/10-network-manager.pkla`

```
[Allow User to Control Network Manager]
Identity=unix-user:tyler
Action=org.freedesktop.NetworkManager.*
ResultAny=yes
ResultInactive=no
ResultActive=yes
```

## Authentication is required to suspend the system

This custom policy didn't work where the grant all did
`sudo nano /etc/polkit-1/localauthority/50-local.d/99-custom.pkla`
```
[Custom Policy to Suspend the System Without Password]
Identity=unix-user:tyler
Action=org.freedesktop.login1.suspend
ResultActive=yes
```