
https://cloud.google.com/architecture/chrome-desktop-remote-on-compute-engine#kde-plasma


chatGPT
`sudo apt-get update`
sudo apt-get install chrome-remote-desktop

sudo groupadd chrome-remote-desktop
`sudo usermod -a -G chrome-remote-desktop <username>`
`sudo usermod -a -G chrome-remote-desktop tyler`

sudo systemctl enable chrome-remote-desktop@tyler.service

sudo systemctl start chrome-remote-desktop@<username>.service
sudo systemctl start chrome-remote-desktop@tyler.service

sudo systemctl status chrome-remote-desktop@tyler.service

file: ~/.chrome-remote-desktop-session
#!/bin/bash
export DESKTOP_SESSION=plasma
exec /usr/bin/startkde