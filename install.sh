# Symlinks
ln -sf "$(pwd)/.zshrc" ~/.zshrc

mkdir -p ~/.config/ghostty
mkdir -p ~/.config/nvim

ln -sf "$(pwd)/config/ghostty/config.toml" ~/.config/ghostty/config.toml
ln -sfn "$(pwd)/config/nvim" ~/.config/nvim
