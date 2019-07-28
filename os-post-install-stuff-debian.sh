#!/bin/bash

# os-post-install-stuff-debian.sh
#
# Script to automate most of what I need after a debian install

apt-update() {
    apt -y update
}

apt-upgrade() {
    apt -y upgrade
}

install-softwares() {
    #TODO: software names should be listed in a variable
    apt -y install vim git zsh neovim wget curl screen xclip sudo
        #neovim python support only available in debian unstable
        #python-neovim   \
        #python3-neovim  \
}

oh-my-install() {
    # https://github.com/robbyrussell/oh-my-zsh
    # NOTE: I should install it for a normal user too
    echo '-Y' | sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cat << 'EOF' >> ~/.zshrc
    plugins=(
        git
    )
EOF

    chsh -s $(which zsh)
}

create-user() {
    echo '[*] in create-user function : user = '"${1}"
    useradd -m "${1}" && echo '[*] user '"${1} " 'created'
    echo "${1}":"${1}" | chpasswd && echo '[*] password '"${1} "'created'
}

main() {
    #variables
    user=stf                    \
    #to be made as root
    apt-update &&               \
    apt-upgrade &&              \
    install-softwares &&        \
    oh-my-install &&            \
    create-user "${user}" &&    \
    #switch to normal user
    su "${user}"
}

main
