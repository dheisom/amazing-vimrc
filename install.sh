#!/usr/bin/env bash

# Installation script of amazing-vimrc(Dheisom's version)

declare -A DEPENDENCIES=()
DEPENDENCIES['curl']="curl"
DEPENDENCIES['git']="git"
DEPENDENCIES['nvim']="neovim"

function log() {
    local type="$1"
    local message="$2"
    echo "[$type] $message"
}

function check_dependencie() {
    local dep="$1"
    for p in ${PATH//:/ }; do
        if [ -e "$p/$dep" ]; then
            return 0;
        fi
    done
    return 1
}

function missing_dependencie() {
    local cmd="$1"
    local package="${DEPENDENCIES[$cmd]}"
    log "ERROR" "Command ${cmd} not found! Install ${package} package to continue."
    exit 1
}

log "INFO" "amazing-vimrc setup initialized."
log "INFO" "Checking dependencies..."
for d in ${!DEPENDENCIES[@]}; do
    check_dependencie ${d} || missing_dependencie ${d}
done

if [ -d "${HOME}/.config/nvim" ]; then
    log "INFO" "Updating installation..."
    cd ~/.config/nvim
    git pull
else
    log "INFO" "Installing for user $(whoami)..."
    git clone --depth=1 https://github.com/dheisom/amazing-vimrc ~/.config/nvim
    if [ $? != 0 ]; then
        log "ERROR" "Failed to clone GitHub repository, try again if you want this."
        exit 2
    else
        log "INFO" "Installed with success!"
    fi
fi
