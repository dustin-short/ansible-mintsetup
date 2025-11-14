#!/bin/bash

# Ensure $USER is set (in case it's not populated)
USER=${USER:-$(whoami)}

# Only run in interactive shells
case "$-" in
    *i*) ;;
    *) return ;;
esac

# Determine the user's bashrc path (only modify if file exists)
BASHRC_PATH=""

if [ "$USER" = "root" ]; then
    for i in /etc/profile /etc/skel/.bashrc /root/.bashrc; do
        if [ -f "$i" ] && ! grep -q ". /etc/bash_audit" "$i"; then
            echo "=== updating $i ==="
            echo "[ -f /etc/bash_audit ] && . /etc/bash_audit" >> "$i"
        fi
    done
elif [ "$USER" = "splunk" ]; then
    BASHRC_PATH="/home/$USER/.bashrc"
    if [ -f "$BASHRC_PATH" ] && ! grep -q ". /etc/bash_splunk" "$BASHRC_PATH"; then
        echo "=== updating $BASHRC_PATH ==="
        echo "[ -f /etc/bash_splunk ] && . /etc/bash_splunk" >> "$BASHRC_PATH"
    fi
elif [ "$USER" = "zeek" ]; then
    BASHRC_PATH="/home/$USER/.bashrc"
    if [ -f "$BASHRC_PATH" ] && ! grep -q ". /etc/bash_zeek" "$BASHRC_PATH"; then
        echo "=== updating $BASHRC_PATH ==="
        echo "[ -f /etc/bash_zeek ] && . /etc/bash_zeek" >> "$BASHRC_PATH"
    fi
else
    BASHRC_PATH="/home/$USER/.bashrc"
    if [ -f "$BASHRC_PATH" ] && ! grep -q ". /etc/bash_audit" "$BASHRC_PATH"; then
        echo "=== updating $BASHRC_PATH ==="
        echo "[ -f /etc/bash_audit ] && . /etc/bash_audit" >> "$BASHRC_PATH"
    fi
fi
