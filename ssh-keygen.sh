#!/bin/bash

BL=$(echo "\033[01;36m") # Cyan foreground
RD=$(echo "\033[01;31m") # Red foreground
GN=$(echo "\033[1;32m") # Green foreground
CL=$(echo "\033[m") # Default, No Color

# Abort, no parameter provided
abort() {
  echo -e "${RD}[Abort]${GN} no parameter specified, try e.g.:${CL}\n${CL} sh ssh-keygen.sh id_rsa_backup_via_ssh${CL}"
  exit 1
}

# Detecting the user's home directory
SSH_DIR="$HOME/.ssh"

[ -z "$1" ] && abort
echo "${BL}[Info]${GN} Generating Key In:${CL} $SSH_DIR/$1"
ssh-keygen -t rsa -b 4096 -f "$SSH_DIR/$1" -C "$(whoami)@$(hostname -f)" -q -N ""

# Set directory permissions
chmod 700 $SSH_DIR

# Set public/private key permissions
chmod 600 $SSH_DIR/$1
chmod 644 $SSH_DIR/$1.pub

echo "${BL}[Info]${GN} Don't forget to copy the SSH key to your remote server${CL}"
echo "${BL}[Info]${GN} As shown below, this is just an example.${CL}"
echo "${CL} ssh-copy-id -i $HOME/.ssh/$1.pub user@host${CL}"
