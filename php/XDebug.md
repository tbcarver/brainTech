configuration
/etc/php/7.3/mods-available/xdebug.ini
```
xdebug.remote_enable = 1
xdebug.remote_autostart = 1
```

vscode launch debug config

``` {
      "name": "Listen for Xdebug",
      "type": "php",
      "request": "launch",
      "port": 9003,
      "log": false,
      "xdebugSettings": {
        "max_data": 8192
      }
    },
```
https://stackoverflow.com/questions/49515059/xdebug-for-vscode-truncates-long-variables-in-preview