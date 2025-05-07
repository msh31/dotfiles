# sway-env

A minimal, fast, and keyboard-driven Sway (Wayland) desktop environment setup for **Ubuntu 24.04**.

This setup includes customized dotfiles and install scripts to get a tiling Wayland session running with Sway, Waybar, and other utilities — all with a clean look and efficient workflow.

![screenshot](https://i.imgur.com/NzYx7Fo.png)

## Features

- **Sway** for tiling Wayland window management
- **Waybar** for a sleek and responsive status bar
- Power and lock tools via **wlogout**, **swaylock**
- Fonts, themes, and wallpapers included
- Lightweight and easy to customize

## Getting Started

> ⚠️ Built for **Ubuntu 24.04** — use at your own risk on other systems.

1. Clone the repository:
   ```bash
   git clone https://github.com/msh31/sway-env.git
   cd sway-env
   ```

2. Make the install scripts executable:
   ```bash
   chmod +x install.sh install_fonts.sh
   ```

3. Run the scripts:
   ```bash
   ./install_fonts.sh
   ./install.sh
   ```

4. Log out and choose the Sway session from your display manager, or run `sway` from a TTY.

## License

[MIT](./LICENSE)
