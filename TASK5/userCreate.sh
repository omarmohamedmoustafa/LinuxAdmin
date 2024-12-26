#!/bin/bash

# Variables
USER_NAME="yourName"
GROUP_NAME="FamilyName"

# Check if the group exists
if getent group "$GROUP_NAME" > /dev/null 2>&1; then
    echo "Group '$GROUP_NAME' already exists."
else
    echo "Group '$GROUP_NAME' does not exist. Creating it..."
    groupadd "$GROUP_NAME"
    if [ $? -eq 0 ]; then
        echo "Group '$GROUP_NAME' created successfully."
    else
        echo "Failed to create group '$GROUP_NAME'. Exiting..."
        exit 1
    fi
fi

# Check if the user exists
if id "$USER_NAME" > /dev/null 2>&1; then
    echo "User '$USER_NAME' already exists."
else
    echo "User '$USER_NAME' does not exist. Creating it..."
    useradd -m -g "$GROUP_NAME" "$USER_NAME"
    if [ $? -eq 0 ]; then
        echo "User '$USER_NAME' created successfully and added to group '$GROUP_NAME'."
    else
        echo "Failed to create user '$USER_NAME'. Exiting..."
        exit 1
    fi
fi

# Display user and group information
echo
echo "=== User Information ==="
id "$USER_NAME"
echo
echo "=== Group Information ==="
getent group "$GROUP_NAME"

echo "Script execution completed."
