# Symlinks
ln -sf "$(pwd)/.zshrc" ~/.zshrc
ln -sf "$(pwd)/.tmux.conf" ~/.tmux.conf

mkdir -p ~/.config/ghostty
ln -sf "$(pwd)/config/ghostty/config" ~/.config/ghostty/config
ln -sf "$(pwd)/config/ghostty/shaders" ~/.config/ghostty/shaders

ln -sf "$(pwd)/config/nvim" ~/.config/nvim

ln -sf "$(pwd)/config/waybar" ~/.config/waybar
ln -sf "$(pwd)/config/hypr" ~/.config/hypr
