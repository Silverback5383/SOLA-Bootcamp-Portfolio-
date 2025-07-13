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
chmod +x Bash-Scripting-Project/ramon_rice_bash-scripting-project.sh
./Bash-Scripting-Project/ramon_rice_bash-scripting-project.sh

## Self-Evaluation

This project was a great way for me to practice Bash scripting and learn how to check the health and security of a Linux system. I tried to go step by step through each requirement and focus on making sure everything worked and was easy to read.

1. Collect and display system information
I included commands to show the hostname, IP address, uptime, and kernel version. This part was pretty simple and helped me get comfortable with using system info commands and writing them into the report in a clear way.

2. Check and display disk usage with alerts
This section was rough at first. I had to figure out how to pull just the percentage numbers from the disk usage and compare them to a warning level. I used df and awk, but getting them to work the right way took some time and testing. Once I figured that out, the alerts worked like I wanted.

3. List logged-in users and flag accounts with empty passwords
Showing logged-in users was easy using the who command. The harder part was trying to check for empty passwords by reading /etc/shadow. It didn’t work unless the script was run with root permissions, so I added a note in the output in case someone runs it without the right access. This part was a little rough but still works for the purpose of the audit.

4. Analyze system processes for top memory usage
This part went well. I used the ps command and sorted the output to show the top memory-using processes. I picked the top six to keep it simple and readable. It helped me understand more about how to use system resource tools in a script.

5. Verify essential services
I checked to make sure systemd, auditd, cron, journald, and ufw were running. I made a loop that goes through each service and shows whether it’s active or not. At first, I had some trouble when a service wasn’t installed or active — the script would show error messages. I fixed this by trying different ways to hide the errors using 2>/dev/null so the output stayed clean.

6. Parse authentication logs for failed login attempts
Once I found the right log file (/var/log/auth.log) and searched for “Failed password,” this part came together. Looking at the results helped me understand what a failed login looks like in the logs. It made sense once I saw real examples while testing.

7. Save output to a timestamped report on the Desktop
This part was one of the easiest. I used the date command to create a unique filename and saved the report to the Desktop. I used tee so that I could see the output in the terminal while also writing it to the report. That made testing and checking results faster. I also made a small function to add section headers so the report would look neat and organized.

Overall, I think this script includes everything the project asked for. It runs well and creates a clean, readable report. The README is short but gives clear instructions. There are a few things I’d like to improve over time — like adding user input or more error messages but I’m proud of how far I’ve come. I learned a lot from writing, fixing, and testing this script, and I feel a little more confident now using Bash to solve real problems with lots and lots of pratice.



