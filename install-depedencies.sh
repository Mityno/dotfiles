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

echo
echo "INFO: Installing apt packages"
echo

sudo apt install zsh fzf ripgrep direnv

echo
echo "INFO: Finished installing apt packages"
echo

# Install Oh-My-Zsh
if [ ! -d ~/.oh-my-zsh/ ]; then
        echo "INFO: Installing OmZ..."
        # Install omz
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        # Add syntax highlighting plugin
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        # Add completions plugin
        git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

        echo
fi

# Install starship
if ! command_exists starship; then
        curl -sS https://starship.rs/install.sh | sh
fi

# Install yazi
if ! command_exists yazi; then
        cargo install --locked yazi-fm yazi-cli
fi

# Install zoxide
if ! command_exists zoxide; then
        curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

# Show deb installs
echo "INFO: Install latest release from the deb packages :"
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

echo
echo "INFO: No more deb packages to install"
echo

echo "INFO: Updating apt packages"
echo

sudo apt autoremove && sudo apt autoclean
