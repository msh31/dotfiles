# Symlinks
ln -sf "$(pwd)/.zshrc" ~/.zshrc
ln -sf "$(pwd)/.tmux.conf" ~/.tmux.conf

mkdir -p ~/.config/ghostty
mkdir -p ~/.config/nvim

ln -sf "$(pwd)/config/ghostty/config" ~/.config/ghostty/config
ln -sfn "$(pwd)/config/nvim" ~/.config/nvim
