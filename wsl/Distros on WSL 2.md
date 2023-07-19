Issue with DNS setup, make sure there is a nameserver with an ip that will lookup
cat /etc/resolv.conf
		nameserver 8.8.8.8
Turn off the auto create of /etc/resolv.conf
		sudo sh -c 'echo "[network]" >> /etc/wsl.conf && echo "generateResolvConf = false" >> /etc/wsl.conf'
Restart wsl in powershell
		wsl --shutdown
Update the resolve.conf nameserver
		sudo nano /etc/resolv.conf
		set nameserver to: 8.8.8.8
To test
		mtr google.com
		
Make sure the MTU is the same if not using 1500 on the host (ie VPN using 1400)
		sudo ip link set dev eth0 mtu 1400
		
To terminate a disto
		wsl --terminate Ubuntu

To list runing distros
		wsl --list --running