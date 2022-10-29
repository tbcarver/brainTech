- Install powerlevel10k **MesloLGS NF** fonts
  [https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)
- Install **Tabby** for the termial https://tabby.sh/
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