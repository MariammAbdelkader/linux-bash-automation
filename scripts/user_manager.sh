#!/bin/bash

# Usage: ./user_manager.sh username group
USERNAME=$1
GROUP=$2

if [ -z "$USERNAME" ] || [ -z "$GROUP" ]; then
  echo "Usage: $0 username group"
  exit 1
fi

# Create group if it doesn't exist
sudo groupadd $GROUP 2>/dev/null

# Create user and add to group
sudo useradd -m -G $GROUP $USERNAME

echo "User $USERNAME created and added to group $GROUP"
