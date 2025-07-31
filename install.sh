#!/bin/zsh

echo "🚀 Installing Marco's dotfiles..."

# get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🔗 Linking dotfiles..."
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

echo ""
echo "✨ Dotfiles installation complete!"
echo ""
echo "Restart your terminal or run 'source ~/.zshrc' to apply changes"