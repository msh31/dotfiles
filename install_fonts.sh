#!/usr/bin/env bash
mkdir -p ~/.local/share/fonts/

echo "Downloading JetBrains Mono Nerd Font..."
wget -O /tmp/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
mkdir -p ~/.local/share/fonts/JetBrainsMono
unzip -o /tmp/JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono/
rm /tmp/JetBrainsMono.zip

# Rebuild font cache
fc-cache -f -v

echo "Font installation complete!"