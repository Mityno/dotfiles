git clone https://github.com/Lxtharia/minegrub-world-sel-theme.git ~/dotfiles/ignore/minegrub-theme
sudo cp -ruv ~/dotfiles/ignore/minegrub-theme /boot/grub/themes/

echo "-----------------------------------------------------"
echo "Update the following settings in /etc/default/grub"
echo "GRUB_TERMINAL_OUTPUT=gfxterm"
echo "GRUB_THEME=/boot/grub/themes/minegrub-theme/theme.txt"
echo "Then run : sudo update-grub"
