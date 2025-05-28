#!/bin/bash

# Prompt for the SSH key path
read -p "Enter the full path to your SSH key (e.g., /home/user/.ssh/id_rsa.pub): " KEY_PATH

# Check if the file exists
if [[ ! -f "$KEY_PATH" ]]; then
    echo "Error: SSH key not found at $KEY_PATH"
    exit 1
fi

# Prompt for the IP address
read -p "Enter the destination IP address: " IP_ADDR

# Copy the SSH key to the destination IP address
ssh-copy-id -i "$KEY_PATH" "$USER@$IP_ADDR"

if [[ $? -eq 0 ]]; then
    echo "SSH key successfully copied to $IP_ADDR"
else
    echo "Failed to copy SSH key to $IP_ADDR"
    exit 1
fi

# Script written by Copilot and did a good job!
