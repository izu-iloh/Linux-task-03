# Command Guide — Linux Task 03

Run these in your authorized Linux lab, not in Git Bash. Git Bash is for GitHub upload steps only.

## Part 1 — Create and enter `forensic01`

```bash
sudo useradd -m -s /bin/bash forensic01
sudo usermod -aG sudo forensic01
sudo passwd forensic01
su - forensic01
whoami
id
```

If `forensic01` already exists, inspect it rather than creating a duplicate. `su - forensic01` will prompt for that user's password.

## Create the logs directory and mock log file

```bash
mkdir -p /home/forensic01/logs
cd /home/forensic01/logs
cat > sys_events.log <<'EOF'
2026-10-25 08:00:01 INFO system boot completed
2026-10-25 08:01:12 INFO user01 logged in
2026-10-25 08:02:45 WARNING failed login attempt for user01
2026-10-25 08:03:09 ERROR authentication service timeout
2026-10-25 08:04:21 INFO root ran scheduled maintenance
2026-10-25 08:05:32 INFO network interface initialized
2026-10-25 08:06:40 ERROR disk check returned a warning
2026-10-25 08:07:11 INFO user01 opened a session
2026-10-25 08:08:25 WARNING unusual permission change detected
2026-10-25 08:09:33 INFO root reviewed system status
2026-10-25 08:10:44 ERROR service restart failed
2026-10-25 08:11:05 INFO backup process started
2026-10-25 08:12:19 WARNING disk usage above threshold
2026-10-25 08:13:27 INFO user01 accessed training directory
2026-10-25 08:14:38 ERROR invalid configuration value
2026-10-25 08:15:49 INFO root checked audit logs
2026-10-25 08:16:52 INFO firewall rules loaded
2026-10-25 08:17:06 WARNING repeated login failures for user01
2026-10-25 08:18:17 ERROR application could not open file
2026-10-25 08:19:28 INFO system health check completed
2026-10-25 08:20:39 INFO root ended maintenance session
2026-10-25 08:21:40 WARNING temporary storage nearly full
EOF
wc -l sys_events.log
```

The log entries are mock training data, not real system events. If your instructor requires use of both `cat` and `echo`, you can add a line with `echo '2026-10-25 08:22:00 INFO extra mock event' >> sys_events.log`.

## Part 2 — Filter and inspect logs

```bash
grep "ERROR" sys_events.log
grep -E "root|user01" sys_events.log
grep "ERROR" sys_events.log | less
grep -E "root|user01" sys_events.log | less
grep "ERROR" sys_events.log > error_report.txt
head -n 5 sys_events.log
tail -n 5 sys_events.log
cat sys_events.log
```

Press `q` to exit `less`. Redirection (`>`) creates or overwrites `error_report.txt`; use `>>` to append instead. Check the report with `cat error_report.txt` and `wc -l error_report.txt`.

## Part 3 — Permissions and ownership

```bash
cd /home/forensic01/logs
touch confidential.txt
chmod 600 confidential.txt
ls -l confidential.txt
sudo chown root confidential.txt
ls -l confidential.txt
cat confidential.txt
printf 'Test edit\\n' >> confidential.txt
```

`chmod 600` gives the owner read/write permission and gives group and others no permissions. After `chown root`, the owner becomes `root`; with mode `600`, `forensic01` should normally be unable to read or write the file. Because the file is empty, a successful `cat` may show no content; use `cat confidential.txt` and `printf ... >> confidential.txt` to observe permission errors. Do not use `sudo` for these access tests, because that would test root access instead.

## Part 4 — Temporary user management

Run these from an account with sudo privileges:

```bash
sudo useradd -m -s /bin/bash guest1
sudo useradd -m -s /bin/bash guest2
sudo usermod -aG sudo guest1
id guest1
getent passwd guest2
sudo userdel -r guest2
getent passwd guest2
```

`userdel -r guest2` removes `guest2` and its home directory. Confirm the account no longer appears. If either account already exists, inspect it first and do not blindly rerun creation commands.

## Verification

```bash
id forensic01
getent passwd forensic01
ls -l /home/forensic01/logs
ls -l /home/forensic01/logs/confidential.txt
id guest1
getent passwd guest2
```

Record the exact commands actually used in `commands_used.txt` and capture genuine outputs in `screenshots/`.
