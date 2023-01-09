Speed up scrolling for google chrome

install
`sudo apt install imwheel/jammy`

.imwheelrc
```
"^google-chrome$"
    None, Up, Button4, 3
    None, Down, Button5, 3
```

command
`imwheel -d -b "4 5"`

imwheel.service
```
[Unit]
Description=IMWheel  
After=network.target  
StartLimitIntervalSec=0

[Service]
Type=simple  
Restart=always  
RestartSec=1  
User=tyler
ExecStart=/usr/bin/imwheel -d -b "4 5"
ExecStop=/usr/bin/pkill imwheel

[Install]
WantedBy=multi-user.target
```