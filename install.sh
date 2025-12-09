# Symlinks
ln -sf "$(pwd)/.zshrc" ~/.zshrc
ln -sf "$(pwd)/.tmux.conf" ~/.tmux.conf

mkdir -p ~/.config/ghostty
ln -sf "$(pwd)/config/ghostty/config" ~/.config/ghostty/config
ln -sf "$(pwd)/config/ghostty/shaders" ~/.config/ghostty/shaders

ln -sf "$(pwd)/config/nvim" ~/.config/nvim

ln -sf "$(pwd)/config/hyprpanel" ~/.config/hyprpanel
ln -sf "$(pwd)/config/hypr" ~/.config/hypr

ln -sf "$(pwd)/config/wofi" ~/.config/wofi

ln -sf "$(pwd)/config/gtk-3.0" ~/.config/gtk-3.0
ln -sf "$(pwd)/config/gtk-4.0" ~/.config/gtk-4.0
