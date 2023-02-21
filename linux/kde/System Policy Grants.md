
## System policy prevents control of network connections

`sudo usermod -aG netdev,tty tyler`

`sudo nano /etc/polkit-1/localauthority/50-local.d/10-network-manager.pkla`

```
[Allow User to Control Network Manager]
Identity=unix-user:tyler
Action=org.freedesktop.NetworkManager.*
ResultAny=yes
ResultInactive=no
ResultActive=yes
```

`sudo nano /etc/polkit-1/localauthority/50-local.d/99-custom.pkla`
```
[Custom Policy to Suspend the System Without Password]
Identity=unix-user:tyler
Action=org.freedesktop.login1.suspend
ResultActive=yes
```