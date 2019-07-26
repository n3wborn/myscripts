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

main() {
    apt-update &&           \
    apt-upgrade &&          \
    install-softwares &&    \
    oh-my-install
}

main
