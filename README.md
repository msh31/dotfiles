# dotfiles

A minimal, fast, and keyboard-driven Sway (Wayland) desktop environment setup for **Fedora Sericea**.

This setup includes customized dotfiles and install scripts to get a tiling Wayland session running with Sway, Waybar, and other utilities — all with a clean look and efficient workflow.

![screenshot](https://i.imgur.com/53IeaqQ.png)

## Features

- **Sway** for tiling Wayland window management
- **Waybar** for a sleek and responsive status bar
- Fonts and wallpapers included
- Lightweight and easy to customize

## Getting Started

> ⚠️ Built for **Fedora Sericea** — use at your own risk on other systems.

1. Clone the repository:
   ```bash
   git clone -b fedora-sericea https://github.com/msh31/dotfiles.git
   cd dotfiles
   ```

2. Make the install scripts executable:
   ```bash
   chmod +x install.sh install_fonts.sh
   ```

3. Run the scripts:
   ```bash
   ./install_fonts.sh
   ```

4. Log out and choose the Sway session from your display manager, or run `sway` from a TTY.

## Other customizations installed
- [Spotlight for Rofi](https://github.com/newmanls/rofi-themes-collection?tab=readme-ov-file)

## License

[MIT](./LICENSE)
