#!/bin/zsh

echo "Installing Marco's dotfiles..."

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Link dotfiles
echo "Linking $DOTFILES_DIR/.zshrc to $HOME/.zshrc"
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

echo "Dotfiles installation complete!"
echo "Restart your terminal or run 'source ~/.zshrc' to apply changes."