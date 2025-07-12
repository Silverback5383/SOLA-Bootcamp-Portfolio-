# System Audit Script

This Bash script performs a basic health and security check on a Linux machine.

## Features

- Displays hostname, IP address, uptime, and kernel version
- Checks disk usage and warns if it exceeds 80%
- Lists logged-in users and flags accounts with empty passwords
- Shows top memory-consuming processes
- Verifies if essential services are running (systemd, auditd, cron, journald, ufw)
- Scans logs for failed login attempts
- Saves a timestamped report to the Desktop

## How to Run

```bash
chmod +x system_audit.sh
./system_audit.sh



