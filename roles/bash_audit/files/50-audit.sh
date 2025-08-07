#!/bin/bash
if [ "$USER" = root ]
then
        for i in /etc/profile /etc/skel/.bashrc /root/.bashrc; do
        if ! grep -q ". /etc/bash_audit" "$i"; then
                echo "===updating $i==="
        echo "[ -f /etc/bash_audit ] && . /etc/bash_audit" >>"$i"
        fi
        done
elif [ "$USER" = splunk ]
then
        if ! grep -q ". /etc/bash_splunk" "/home/$USER/.bashrc"; then
                echo "===updating /$USER/.bashrc==="
                echo "[ -f /etc/bash_splunk ] && . /etc/bash_splunk" >>"/home/$USER/.bashrc"
        fi
elif [ "$USER" = zeek ]
then
        if ! grep -q ". /etc/bash_zeek" "/home/$USER/.bashrc"; then
                echo "===updating /$USER/.bashrc==="
                echo "[ -f /etc/bash_zeek ] && . /etc/bash_zeek" >>"/home/$USER/.bashrc"
        fi
else
        if ! grep -q ". /etc/bash_audit" "/home/$USER/.bashrc"; then
                echo "===updating /$USER/.bashrc==="
                echo "[ -f /etc/bash_audit ] && . /etc/bash_audit" >>"/home/$USER/.bashrc"
        fi
fi
