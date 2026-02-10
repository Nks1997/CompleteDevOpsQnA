#!/bin/bash
# Script Name: devops_demo.sh
# Author: Naveen kumar shetty
# Date: 2026-01-12
# Purpose: Demo of common Linux commands for DevOps interviews

echo "----- DevOps Shell Script Demo -----"

# -------------------------------
# Variables
# -------------------------------
NAME="Alice"
DATE=$(date '+%Y-%m-%d %H:%M:%S')
echo "Script run by $NAME on $DATE"

# -------------------------------
# Directory and File Operations
# -------------------------------
echo "Creating directories and files..."
mkdir -p /tmp/devops_test
touch /tmp/devops_test/file1.txt /tmp/devops_test/file2.txt
echo "File1 contents" > /tmp/devops_test/file1.txt
echo "File2 contents" > /tmp/devops_test/file2.txt

echo "Listing files in /tmp/devops_test:"
ls -l /tmp/devops_test

# -------------------------------
# If-Else Example
# -------------------------------
FILE_COUNT=$(ls /tmp/devops_test | wc -l)
if [ $FILE_COUNT -gt 1 ]; then
    echo "There are multiple files in /tmp/devops_test"
else
    echo "Only one or no file exists"
fi

# -------------------------------
# For Loop Example
# -------------------------------
echo "Iterating over files:"
for file in /tmp/devops_test/*; do
    echo "Processing $file"
done

# -------------------------------
# While Loop Example
# -------------------------------
echo "Counting from 1 to 5 using while loop:"
i=1
while [ $i -le 5 ]; do
    echo "Count: $i"
    i=$((i+1))
done

# -------------------------------
# Case Statement Example
# -------------------------------
echo "Enter a number between 1 and 3:"
read choice
case $choice in
    1) echo "You selected One";;
    2) echo "You selected Two";;
    3) echo "You selected Three";;
    *) echo "Invalid choice";;
esac

# -------------------------------
# Functions Example
# -------------------------------
greet_user() {
    local user=$1
    echo "Hello, $user! Welcome to DevOps scripting."
}

greet_user "Alice"

# -------------------------------
# Process Management
# -------------------------------
echo "Listing running bash processes:"
ps -ef | grep bash | awk '{print $1, $2, $8}'

# -------------------------------
# Disk and Memory Usage
# -------------------------------
echo "Disk usage:"
df -h

echo "Memory usage:"
free -h

# -------------------------------
# Text Processing Examples
# -------------------------------
echo "Searching for 'File1' in files:"
grep "File1" /tmp/devops_test/*

echo "Printing first column of ps output using awk:"
ps -ef | awk '{print $1}' | head -5

# -------------------------------
# Command Substitution Example
# -------------------------------
CURRENT_DIR=$(pwd)
echo "Current working directory is $CURRENT_DIR"

# -------------------------------
# Cleanup
# -------------------------------
echo "Cleaning up test files..."
rm -rf /tmp/devops_test

echo "Script execution completed."

# -------------------------------
# Process Management: Kill Example
# -------------------------------
echo "Starting a background sleep process..."
sleep 60 &
SLEEP_PID=$!
# $? - last exit code status - status code 0, 1
echo "Background process started with PID: $SLEEP_PID"

# Confirm the process is running
ps -p $SLEEP_PID

killing the process
echo "Killing the process $SLEEP_PID..."
kill $SLEEP_PID

# Confirm it has been killed
if ps -p $SLEEP_PID > /dev/null; then
    echo "Process $SLEEP_PID is still running"
else
    echo "Process $SLEEP_PID successfully terminated"
fi

# -------------------------------
# Linux Commands Cheat Sheet
# -------------------------------

# -------------------------------
# Hard Link
# -------------------------------
# A hard link points to the same inode (file content)
# Cannot link directories or cross file systems
# Usage: ln <source_file> <hardlink_name>

ln file1.txt file1_hard.txt

# -------------------------------
# Soft Link (Symbolic Link)
# -------------------------------
# A soft link points to the file name (path)
# Can link directories and cross file systems
# Becomes broken if the original file is deleted
# Usage: ln -s <source_file> <symlink_name>

ln -s file1.txt file1_soft.txt

# -------------------------------
# Linux Signals
# -------------------------------
# SIGINT  (2) - Interrupt a process (Ctrl+C)
kill -2 <PID>
# SIGTERM (15) - Terminate gracefully (default)
kill -15 <PID> or kill <PID>
# SIGKILL (9) - Force kill (cannot be trapped)
kill -9 <PID>
# SIGHUP  (1) - Hangup, reload config
kill -1 <PID>
# SIGQUIT (3) - Quit process (Ctrl+\)
kill -3 <PID>
# SIGSTOP (19) - Stop (pause) process
kill -STOP <PID>
# SIGCONT (18) - Continue a stopped process
kill -CONT <PID>
# SIGTSTP (20) - Terminal stop (Ctrl+Z)
kill -TSTP <PID>
# List all signals:
kill -l

# -------------------------------
# sort command
# -------------------------------
# Basic alphabetical sort
# sort <filename>
sort names.txt

# Reverse sort (Z-A)
# sort -r <filename>
sort -r names.txt

# Numeric sort
# sort -n <filename>
sort -n numbers.txt

# Sort by specific column/field
# sort -k<field_number> <filename>
sort -k2 data.txt

# Sort by column with a separator
# sort -t<separator> -k<field_number> <filename>
sort -t: -k3 data.txt

# Remove duplicate lines
# sort -u <filename>
sort -u names.txt

# Sort and save to a file
# sort <filename> -o <output_file>
sort names.txt -o sorted_names.txt

# Numeric reverse sort
# sort -nr <filename>
sort -nr numbers.txt

# -------------------------------
# jq command (JSON processor)
# -------------------------------

# Basic usage: parse and pretty-print JSON
# jq '.' <file.json>
 jq '.' data.json

# Extract a specific key from JSON
# jq '.key' <file.json>
 jq '.name' data.json

# Extract nested keys
# jq '.parent.child' <file.json>
 jq '.user.name' data.json

# Extract array elements
# jq '.array[0]' <file.json>
 jq '.users[0].name' data.json

# Loop over array elements
# jq '.array[]' <file.json>
 jq '.users[] | .name' data.json

# Filter JSON objects
# jq 'select(.key=="value")' <file.json>
 jq '.users[] | select(.age > 25)' data.json

# Combine multiple keys
# jq '{name: .name, age: .age}' <file.json>
 jq '{name: .user.name, age: .user.age}' data.json

# Output raw strings instead of JSON quotes
# jq -r '.key' <file.json>
 jq -r '.user.name' data.json

# Read JSON from a pipe
# cat file.json | jq '.key'
 curl -s https://api.example.com/users | jq '.[] | .name'

#!/bin/bash
# -------------------------------
# File Name: demo_commands.sh
# Purpose: Demonstrate apt, echo, overwrite, and append commands
# -------------------------------

# -------------------------------
# 1. APT Commands
# -------------------------------
echo "----- APT Commands Demo -----"

# Update package lists
sudo apt update

# Upgrade all packages
sudo apt upgrade -y

# List installed packages
dpkg --get-selections

# -------------------------------
# 2. Echo Command
# -------------------------------
echo "----- Echo Command Demo -----"

# Simple message
echo "Hello, World!"

# Message with newline using -e
echo -e "Line1\nLine2"

# -------------------------------
# 3. Overwrite (>) Operator
# -------------------------------
echo "----- Overwrite Demo -----"

# Overwrite a file with content
echo "This will overwrite previous content" > overwrite_file.txt
echo "Content overwritten in overwrite_file.txt"

# Overwrite file with command output
dpkg --get-selections > installed_packages.txt
echo "Installed packages saved to installed_packages.txt (overwrite)"

# -------------------------------
# 4. Append (>>) Operator
# -------------------------------
echo "----- Append Demo -----"

# Append a line to a file
echo "This is an appended line" >> overwrite_file.txt
echo "Line appended to overwrite_file.txt"

# Append command output to a file
sudo apt list --installed >> installed_packages.txt
echo "APT installed packages appended to installed_packages.txt"
