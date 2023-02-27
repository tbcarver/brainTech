`sudo apt-get install libpam-cracklib`

`sudo nano /etc/pam.d/common-password`

Add before another passowrd requisite line or modify the following line:
`password requisite pam_cracklib.so retry=3 minlen=6 difok=0`

change current users password
`passwd`

pam change with ui selection
`sudo pam-auth-update --force`