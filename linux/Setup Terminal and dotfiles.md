- (Linux with GUI) Install powerlevel10k **MesloLGS NF** fonts
  [https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)
-
		  sudo apt-get update -yq \
			&& sudo apt-get install -yq fontconfig \
			&& mkdir -p ~/.fonts \
			&& wget -q --show-progress https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P ~/.fonts \
			&& wget -q --show-progress https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P ~/.fonts \
			&& wget -q --show-progress https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P ~/.fonts \
			&& wget -q --show-progress https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P ~/.fonts \
			&& fc-cache -f -v \
			&& fc-list | grep "MesloLGS NF"

- (Linux with GUI)  Install **Tabby** for the termial https://tabby.sh/
	- setting, hotkeys: set copy, paste
	- settings, appearance: set font MesloLGS NF, increase size by 3
	- settings, terminal: Warn on multi-line paste, turn off
	- settings,  hotkeys: (search for space) Toggle terminal window, delete ctrl-space
	- settings,  hotkeys: (search new tab) New tab, set to ctrl-t
- `sudo apt update && sudo apt install zsh yadm keychain`    
- `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k`    
- `yadm clone git@github.com:tbcarver/dotfiles.git`
- Change login shell
  `chsh -s /bin/zsh`

For gnome terminal
-   configure gnome terminal
-   custom font    
-   cut paste shortcuts    
-   cursor