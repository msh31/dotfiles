# Symlinks
ln -sf "$(pwd)/.zshrc" ~/.zshrc
ln -sf "$(pwd)/.tmux.conf" ~/.tmux.conf
ln -sf "$(pwd)/.aerospace.toml" ~/.aerospace.toml

mkdir -p ~/.config/ghostty
ln -sf "$(pwd)/config/ghostty/config" ~/.config/ghostty/config
ln -sf "$(pwd)/config/ghostty/shaders" ~/.config/ghostty/shaders

ln -sf "$(pwd)/config/nvim" ~/.config/nvim
