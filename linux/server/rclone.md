



printf '#!/bin/bash\n\nflock -n /tmp/rclone-tyler.lock \\\n  rclone sync /data/drives/tyler b2:tyler-01-hp-drives-tyler \\\n  --fast-list \\\n  --transfers 2 \\\n  --checkers 4 \\\n  --retries 3 \\\n  --low-level-retries 10 \\\n  --timeout 1h \\\n  --contimeout 10m \\\n  --log-file /var/log/rclone/rclone-tyler.log \\\n  --log-level INFO\n' > rclone-tyler.sh && chmod +x rclone-tyler.sh

then in crontab -e

0 5 * * * /home/tyler/rclone-tyler.sh >> /var/log/rclone/rclone-tyler-cron.log 2>&1

tyler@tyler-01-hp:~$ cat /home/tyler/.config/rclone/rclone.conf
[b2]
type = b2
account = 005ed1269885b4b0000000001
key =
