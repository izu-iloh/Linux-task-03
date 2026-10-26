#!/usr/bin/env bash
set -euo pipefail

TARGET="/home/forensic01/logs/sys_events.log"

if [[ "$(id -un)" != "forensic01" ]]; then
  echo "Run this script as forensic01 so the lab file is owned by that user." >&2
  exit 1
fi

mkdir -p "$(dirname "$TARGET")"
cat > "$TARGET" <<'EOF'
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

echo "Created $TARGET"
echo "Line count:"
wc -l "$TARGET"
