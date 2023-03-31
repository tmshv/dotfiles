#!/bin/bash

function install_zsh() {
    sudo apt install -y zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    sudo chsh -s $(which zsh) $USER
    echo "Zsh installed and set as default shell."
}

function install_git() {
    sudo apt install -y git
    echo "Git installed."
}

function install_vim() {
    sudo apt install -y vim
    # Configure vim with a more enhanced config
    echo "syntax on
set number
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set showmatch
set incsearch
set hlsearch
set cursorline
set wildmenu
set laststatus=2
set noshowmode
set background=dark
colorscheme desert" > ~/.vimrc
    echo "Vim installed and configured."
}

function install_tmux() {
    sudo apt install -y tmux
    # Configure tmux with a simple and pretty config
    echo "set-option -g default-shell /bin/zsh
set-option -g mouse on
set-option -g status-bg blue
set-option -g status-fg white
set-option -g status-left-length 50
setw -g window-status-current-bg green" > ~/.tmux.conf
    echo "Tmux installed and configured."
}

# Update the system
sudo apt update && sudo apt upgrade -y

if [[ $# -eq 0 ]]; then
    echo "No arguments provided. Installing all components."
    install_zsh
    install_git
    install_vim
    install_tmux
else
    for arg in "$@"
    do
        case $arg in
            zsh)
                install_zsh
                ;;
            git)
                install_git
                ;;
            vim)
                install_vim
                ;;
            tmux)
                install_tmux
                ;;
            *)
                echo "Invalid option: $arg. Valid options: zsh, git, vim, tmux"
                ;;
        esac
    done
fi

echo "Installation complete. Reboot or log out and log back in to use the new settings."

