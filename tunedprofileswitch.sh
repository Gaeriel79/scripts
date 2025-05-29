#!/bin/bash

# Script to toggle tuned profile between 'powersave' and 'network-throughput'

# Ensure running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (with sudo)"
  exit 1
fi

# Get current profile
CURRENT_PROFILE=$(tuned-adm active | grep 'Current active profile:' | awk -F': ' '{print $2}')

if [[ "$CURRENT_PROFILE" == "powersave" ]]; then
  tuned-adm profile network-throughput
  echo "Switched to network-throughput profile."
elif [[ "$CURRENT_PROFILE" == "network-throughput" ]]; then
  tuned-adm profile powersave
  echo "Switched to powersave profile."
else
  # If neither, default to powersave
  tuned-adm profile powersave
  echo "Unknown current profile ('$CURRENT_PROFILE'). Set to powersave profile."
fi
