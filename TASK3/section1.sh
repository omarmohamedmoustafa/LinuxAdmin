#!/bin/bash

# Check if .bashrc file exists in the user's home directory
if [ -f "$HOME/.bashrc" ]; then
  # Append new environment variables to the .bashrc file
  echo "export HELLO=\$HOSTNAME" >> "$HOME/.bashrc"
  echo "LOCAL=\$(whoami)" >> "$HOME/.bashrc"
  echo "New environment variables HELLO and LOCAL have been added to .bashrc."
else
  echo ".bashrc file does not exist in the home directory."
fi

# Open a new terminal window (this command works for GNOME terminal)
gnome-terminal &
