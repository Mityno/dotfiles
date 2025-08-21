# Shells config (directly in the HOME folder)
ln -fs --backup ~/dotfiles/.zshrc ~/dotfiles/.bashrc ~/dotfiles/.bash_profile ~/dotfiles/.zprofile ~/dotfiles/.gitconfig ~

# Other config (inside .config)
ln -fs --backup ~/dotfiles/kitty ~/dotfiles/nvim ~/dotfiles/neovide ~/dotfiles/yazi ~/dotfiles/starship.toml ~/.config/
