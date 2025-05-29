#!/bin/bash

# Check for logged-in users
logged_in_users=$(who | wc -l)

# If there are no logged-in users, execute the power management command
if [ "$logged_in_users" -eq 0 ]; then
    echo "No users are logged in. Executing power management command."
    power-adm profile powersave
else
    echo "$logged_in_users user(s) are currently logged in. Power management command will not be executed."
fi
