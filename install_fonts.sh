#!/usr/bin/env bash
mkdir -p ~/.local/share/fonts/

sudo apt install fonts-font-awesome fonts-noto fonts-noto-color-emoji -y

echo "Downloading JetBrains Mono Nerd Font..."
wget -O /tmp/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
mkdir -p ~/.local/share/fonts/JetBrainsMono
unzip -o /tmp/JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono/
rm /tmp/JetBrainsMono.zip

echo "Downloading Material Design Icons..."
wget -O /tmp/MaterialDesignIcons.zip https://github.com/Templarian/MaterialDesign-Font/archive/master.zip
unzip -o /tmp/MaterialDesignIcons.zip -d /tmp/
mkdir -p ~/.local/share/fonts/MaterialDesignIcons
cp /tmp/MaterialDesign-Font-master/fonts/*.ttf ~/.local/share/fonts/MaterialDesignIcons/
rm -rf /tmp/MaterialDesign-Font-master
rm /tmp/MaterialDesignIcons.zip

# Rebuild font cache
fc-cache -f -v

echo "Font installation complete!"