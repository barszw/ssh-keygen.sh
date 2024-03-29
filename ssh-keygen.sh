#!/usr/bin/env bash
# If you have problem, use this #!/bin/bash

function header_info() {
  clear
}

header_info

# Bash Color Basics: Coloring Text with Escape Sequences
source "$(dirname "$0")/bash_color.conf"

# Abort, no parameter provided
abort() {
  echo -e "$PRINT_ERROR No parameter specified, try e.g.:\n$BOLD bash ssh-keygen.sh id_rsa_backup_via_ssh "$NO_COLOR""
  exit 1
}

[ -z "$1" ] && abort

# Detecting the user's home directory
SSH_DIR="$HOME/.ssh"

echo -e "$PRINT_INFO Generating Key In: $SSH_DIR/$1 $BOLD"
 ssh-keygen -t rsa -b 4096 -f "$SSH_DIR/$1" -C "$(whoami)@$(hostname -f)" -q -N ""

# Set directory permissions
chmod 700 $SSH_DIR

# Set public/private key permissions
chmod 600 $SSH_DIR/$1
chmod 644 $SSH_DIR/$1.pub

echo -e "$PRINT_INFO Don't forget to copy the SSH key to your remote server"
echo -e "$PRINT_INFO As shown below, this is just an example e.g.:"
echo -e ""$BOLD"ssh-copy-id -i $HOME/.ssh/$1.pub user@host"$NO_COLOR""
