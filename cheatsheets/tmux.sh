#!/bin/zsh

CHEATSHEET=$(cat <<'EOF'
tmux Cheatsheet

# Prefix key (default): Ctrl + b

# Session Management
Prefix + s        # List sessions
Prefix + $        # Rename current session
Prefix + d        # Detach from session (keep running in background)
tmux attach       # Reattach to last session

# Window Management
Prefix + c        # Create new window
Prefix + ,        # Rename current window
Prefix + w        # List windows
Prefix + &        # Kill current window

# Pane Management
Prefix + %        # Split pane vertically
Prefix + "        # Split pane horizontally
Prefix + o        # Switch to next pane
Prefix + ;        # Toggle between current and last pane
Prefix + x        # Kill current pane
Prefix + z        # Toggle zoom on current pane (maximize/minimize)

# Pane Resizing (hold prefix, then use arrow keys)
Prefix + Up/Down/Left/Right

# Copy Mode (for scrolling and copy/paste)
Prefix + [        # Enter copy mode
  - Move with arrow keys, page up/down, or vim keys (h,j,k,l)
  - Space to start selection
  - Enter to copy selection
Prefix + ]        # Paste buffer

# Miscellaneous
Prefix + t        # Show current time
Prefix + ?        # List all key bindings
Prefix + r        # Reload tmux config file (if you have one)

# Exiting
exit              # Exit shell in pane (closes pane/window)
q (in programs)   # Quit many CLI programs (e.g., LazyGit)

EOF
)

echo $CHEATSHEET