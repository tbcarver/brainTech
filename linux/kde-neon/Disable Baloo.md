# Disable KDE Baloo Completely

## 1. Disable indexing via config
mkdir -p ~/.config && \
echo -e "[Basic Settings]\nIndexing-Enabled=false" > ~/.config/baloofilerc

## 2. Stop running processes
pkill baloorunner && \
pkill baloo_file

## 3. Prevent autostart (optional but recommended)
mkdir -p ~/.config/autostart && \
cp /etc/xdg/autostart/baloo_file.desktop ~/.config/autostart/ && \
echo "Hidden=true" >> ~/.config/autostart/baloo_file.desktop

## 4. Log out and back in
