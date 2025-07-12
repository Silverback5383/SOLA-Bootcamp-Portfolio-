# README

## README

### README

#### README

#!/bin/bash
# Set a timestamp for the audit report name
timestamp=$(date '+%Y-%m-%d_%H-%M-%S')

# Define the path to the Desktop
desktop_path="$HOME/Desktop"

# Create the full path for the output file
report_file="$desktop_path/system_audit_$timestamp.txt"

# Greet the user and begin the report
echo "==========================================" | tee -a "$report_file"
echo "     Basic Linux System Audit Script      " | tee -a "$report_file"
echo "==========================================" | tee -a "$report_file"
echo "Script started at: $(date)" | tee -a "$report_file"
echo "Running as user: $USER" | tee -a "$report_file"
echo "Output file: $report_file" | tee -a "$report_file"
echo "" | tee -a "$report_file"

