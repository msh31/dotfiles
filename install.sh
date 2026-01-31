# Symlinks
ln -sf "$(pwd)/.zshrc" ~/.zshrc
ln -sf "$(pwd)/.tmux.conf" ~/.tmux.conf

mkdir -p ~/.config/ghostty
ln -sf "$(pwd)/config/ghostty/config" ~/.config/ghostty/config
ln -sf "$(pwd)/config/ghostty/shaders" ~/.config/ghostty/shaders

ln -sf "$(pwd)/config/nvim" ~/.config/nvim

ln -sf "$(pwd)/config/hyprpanel" ~/.config/hyprpanel

rm -rf ~/.config/hypr
ln -sf "$(pwd)/config/hypr" ~/.config/hypr

ln -sf "$(pwd)/config/wofi" ~/.config/wofi
ln -sf "$(pwd)/config/foot" ~/.config/foot

ln -sf "$(pwd)/config/gtk-3.0" ~/.config/gtk-3.0
ln -sf "$(pwd)/config/gtk-4.0" ~/.config/gtk-4.0

ln -sf "$(pwd)/config/xdg-desktop-portal" ~/.config/xdg-desktop-portal
ln -sf "$(pwd)/config/xdg-desktop-portal-hyprland" ~/.config/xdg-desktop-portal-hyprland

ln -sf "$(pwd)/config/scripts" ~/.config/scripts

ln -sf "$(pwd)/config/awesome" ~/.config/awesome

ln -sf "$(pwd)/config/wireplumber" ~/.config/wireplumber

sudo mkdir -p /etc/keyd
sudo ln -sf "$(pwd)/service-configs/keyd/semico.conf" /etc/keyd/semico.conf

sudo ln -sf "$(pwd)/config/gamemode" ~/.config/gamemode
ln -sf "$(pwd)/config/quickshell" ~/.config/quickshell
