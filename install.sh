#!/usr/bin/env bash
title() {
    local color='\033[1;37m'
    local nc='\033[0m'
    printf "\n${color}$1${nc}\n"
}

platform=$(uname)

title "Install Ansible"
if [[ $platform == 'Linux' ]]; then
    sudo apt-get install software-properties-common -y
    sudo apt-add-repository ppa:ansible/ansible -y
    if [ -f /etc/apt/sources.list.d/ansible-ansible-jessie.list ]; then
        sudo sed -i 's/jessie/trusty/g' /etc/apt/sources.list.d/ansible-ansible-jessie.list
    fi
    sudo apt-get update
    sudo apt-get install curl ansible -y
elif [[ $platform == 'Darwin' ]]; then
    sudo pip install ansible
fi


title "Install viasite-ansible.zsh"
ansible-galaxy install viasite-ansible.zsh --force

title "Download playbook to $(pwd)/zsh.yml"
curl https://raw.githubusercontent.com/nathanmlim/ansible-role-zsh/master/playbook.yml > $(pwd)/zsh.yml

#title "Provision playbook for root"
#sudo ansible-playbook -i "localhost," -c local $(pwd)/zsh.yml

title "Provision playbook for $(whoami)"
ansible-playbook -i "localhost," -c local $(pwd)/zsh.yml --extra-vars="zsh_user=$(whoami)"
