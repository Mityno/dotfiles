# Update existing libraries and packages information
sudo apt update && apt upgrade

sudo apt install zsh, fzf

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Install yazi
cargo install --locked yazi-fm yazi-cli
