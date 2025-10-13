#!/usr/bin/bash

command_exists() {
        if command -v "$1" &>/dev/null; then
                true
        else
                false
        fi
}

# Update existing libraries and packages information
sudo apt update && sudo apt upgrade

sudo apt install zsh fzf ripgrep direnv

# Install Oh-My-Zsh
if ! command_exists omz; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
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
        echo "install Catppucin Mocha theme for bat following instructions here : https://github.com/catppuccin/bat"
        echo "also install bat-extras : https://github.com/eth-p/bat-extras/tree/master"
        echo "=> clone the repo, run build.sh and put the bins in ~/application/bin/ or ~/.local/bin/"
fi

if ! command_exists delta; then
        echo "delta : https://github.com/dandavison/delta/releases/tag/0.18.2"
fi

echo "---------------------------------------------"

sudo apt autoremove && sudo apt autoclean
