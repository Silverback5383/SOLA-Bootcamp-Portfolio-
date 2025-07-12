#!/bin/bash

# Set timestamp for output file
timestamp=$(date '+%Y-%m-%d_%H-%M-%S')

# Define report destination 
desktop_path="/home/admin1/Desktop"
report_file="$desktop_path/system_audit_$timestamp.txt"

# Function to print headers to screen and file
print_section() {
 echo -e "\n--- $1 -----" | tee -a "$report_file"
}    

# Start Report
echo "==========================================" | tee -a "$report_file"
echo "     Basic Linux System Audit Script      " | tee -a "$report_file"
echo "==========================================" | tee -a "$report_file"
echo "Script started at: $(date)" | tee -a "$report_file"
echo "Running as user: $USER" | tee -a "$report_file"
echo "Output file: $report_file" | tee -a "$report_file"
echo "" | tee -a "$report_file"

echo "---- Disk Usage ----" | tee -a "$report_file"

# Disk Usage Check
print_section "Disk Usage"
threshold=80
df -h --output=source,pcent | tail -n +2 | while read drive percent; do
    usage=${percent%\%}
    echo "$drive is at $usage% usage" | tee -a "$report_file"

    if [ "$usage" -ge "$threshold" ]; then
        echo "WARNING: $drive is over ${threshold}% full!" | tee -a "$report_file"
    fi
done

# Logged In Users 
echo " ---Logged In Users ---" | tee -a "$report_file"
who | tee -a "$report_file"

# Check for empty accounts with empty passwords
echo "" | tee -a "$report_file"
echo "" "Users with empty passwords (security risk):"  | tee -a "$report_file"
awk -F: '($2==""){print $1}' /etc/shadow | tee -a "$report_file"

# Top Consuming Memory 
echo "---- Top Memory-Consuming Processes ----" | tee -a "$report_file"
ps -eo pid,comm,%mem,%cpu --sort=-%mem | head -n 6 | tee -a "$report_file"

# Check Essential Services 
echo "---- Essential Services Status ----" | tee -a "$report_file"
services=(systemd auditd cron systemd-journald ufw)
for service in "${services[@]}"; do
    status=$(systemctl is-active "$service" 2>/dev/null)
    echo "$service: $status" | tee -a "$report_file"
done

# Check Failed Login Attempts 
print_section "Failed Login Attempts"
grep "Failed password" /var/log/auth.log 2> /dev/null | tail -10 | tee -a "$report_file"

echo -e "Audit complete. Report saved to: $report_file" | tee -a "$report_file"

