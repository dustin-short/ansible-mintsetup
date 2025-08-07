# ansible-mintsetup
Ansible playbook for my mint customizations on my msi gs66 stealth.

> running in dual boot Linux Mint 22 and Windows 11

## Roles

| Name  | Description                                                   |
|-------|---------------------------------------------------------------|
| vimrc | Sets the Vim configuration so that the keyboard functions properly |
| ufw | enables ufw and sets ports to open via variable |
| sshd | hardens sshd config if you want to enable ssh |
| bash_audit | The bash audit script is based off of a blog I read written by Francois Scheurer, which I cannot seem to find anywhere. This will create a useraudit.log in /var/log and will track user commands as they switch profiles. |

