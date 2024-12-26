#!/bin/bash

# Variables
USER_NAME="yourName"
GROUP_NAME="FamilyName"

# Check and delete the user
if id "$USER_NAME" > /dev/null 2>&1; then
    echo "User '$USER_NAME' exists. Deleting..."
    userdel -r "$USER_NAME"
    if [ $? -eq 0 ]; then
        echo "User '$USER_NAME' deleted successfully."
    else
        echo "Failed to delete user '$USER_NAME'."
    fi
else
    echo "User '$USER_NAME' does not exist."
fi

# Check and delete the group
if getent group "$GROUP_NAME" > /dev/null 2>&1; then
    echo "Group '$GROUP_NAME' exists. Deleting..."
    groupdel "$GROUP_NAME"
    if [ $? -eq 0 ]; then
        echo "Group '$GROUP_NAME' deleted successfully."
    else
        echo "Failed to delete group '$GROUP_NAME'."
    fi
else
    echo "Group '$GROUP_NAME' does not exist."
fi

echo "Script execution completed."
