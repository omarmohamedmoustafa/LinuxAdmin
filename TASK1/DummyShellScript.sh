#!/bin/bash

# Step 1: Create "myDirectory" in the home folder
mkdir -p ~/myDirectory

# Step 2: Inside "myDirectory," create "secondDirectory"
mkdir -p ~/myDirectory/secondDirectory

# Step 3: Within "secondDirectory," create a file named "myNotePaper"
touch ~/myDirectory/secondDirectory/myNotePaper

# Step 4: Copy "myNotePaper" to "myDirectory"
cp ~/myDirectory/secondDirectory/myNotePaper ~/myDirectory/

# Step 5: Rename the copied file to "myOldNotePaper"
mv ~/myDirectory/myNotePaper ~/myDirectory/myOldNotePaper

echo "Script executed successfully."
