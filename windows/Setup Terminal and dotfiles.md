Using Windows Administrative PowerShell:

Install Chocolatey
* Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

Install Git and Git Bash, YADM, Oh My Posh for Git Bash
* choco install git yadm oh-my-posh -y

Copy dot files
- yadm clone git@github.com:tbcarver/dotfiles-windows.git

For gnome terminal
-   configure gnome terminal
-   custom font    
-   cut paste shortcuts    
-   cursor