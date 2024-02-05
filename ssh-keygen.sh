#!/bin/bash

# Abort, no parameter provided
abort() {
  echo -e "Abort, no parameter specified, try e.g.:\nsh ssh-keygen.sh id_rsa_backup_via_ssh"
  exit 1
}

# Detecting the user's home directory
SSH_DIR="$HOME/.ssh"

[ -z "$1" ] && abort
echo "-===== Generating Key In: $SSH_DIR/$1 =====-"
ssh-keygen -t rsa -b 4096 -f "$SSH_DIR/$1" -C "$(whoami)@$(hostname -f)" -q -N ""

echo "-===== Don't forget to copy the SSH key to your remote server =====-"
echo "-============ As shown below, this is just an example. ============-"
echo "ssh-copy-id -i $HOME/.ssh/$1.pub user@host"
