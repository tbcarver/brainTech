
add the .config

```
Host *
  AddKeysToAgent yes
  IdentityFile C:/Users/tbcar/.ssh/id_rsa

Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa
```
    
```
git config --global core.sshCommand "C:/Windows/System32/OpenSSH/ssh.exe"
```