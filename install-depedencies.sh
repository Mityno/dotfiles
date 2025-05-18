#!/usr/bin/bash

command_exists() {
        if command -v "$1" &>/dev/null; then
                true
        else
                false
        fi
}

# Update existing libraries and packages information
sudo apt update && apt upgrade

sudo apt install zsh, fzf

# Install Oh-My-Zsh
if ! command_exists omz; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install starship
if ! command_exists starship; then
        curl -sS https://starship.rs/install.sh | sh
fi

# Install yazi
if ! command_exists yazi; then
        cargo install --locked yazi-fm yazi-cli
fi

# Show deb installs
echo "Install latest release from the deb packages :"
echo "sudo dpkg -i [debfile].deb"

if ! command_exists bat; then
        echo "bat : https://github.com/sharkdp/bat/releases/tag/v0.25.0"
fi

if ! command_exists delta; then
        echo "delta : https://github.com/dandavison/delta/releases/tag/0.18.2"
fi

echo "---------------------------------------------"
