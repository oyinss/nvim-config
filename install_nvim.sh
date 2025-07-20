#!/bin/bash
set -euo pipefail

REPO_URL="https://github.com/oyinbra/nvim-config"
OWNER_USER="${SUDO_USER:-$USER}"
OWNER_HOME=$(eval echo "~$OWNER_USER")
NVIM_SOURCE_DIR="$OWNER_HOME/nvim"

echo "📦 Setting up Neovim config for main user ($OWNER_USER)..."

# Clone into ~/nvim if missing
if [ ! -d "$NVIM_SOURCE_DIR" ]; then
  echo "📥 Cloning config into $NVIM_SOURCE_DIR..."
  sudo -u "$OWNER_USER" git clone "$REPO_URL" "$NVIM_SOURCE_DIR"
else
  echo "✔️ Config already exists at $NVIM_SOURCE_DIR"
fi

# Ensure ~/.config exists and symlink for main user
mkdir -p "$OWNER_HOME/.config"
ln -sf "$NVIM_SOURCE_DIR" "$OWNER_HOME/.config/nvim"

# Fix home dir permission so others can traverse it
chmod 711 "$OWNER_HOME"

# Ask to install for root
read -p "❓ Install for root user? [y/N]: " install_root
if [[ "$install_root" =~ ^[Yy]$ ]]; then
  echo "🔗 Linking for root..."
  mkdir -p /root/.config
  ln -sf "$NVIM_SOURCE_DIR" /root/.config/nvim
  echo "✔️ Root config linked."
fi

# Ask to install for another user
read -p "❓ Install for another user? [y/N]: " install_other
if [[ "$install_other" =~ ^[Yy]$ ]]; then
  read -p "👤 Enter target username: " SECOND_USER

  if ! id "$SECOND_USER" &>/dev/null; then
    echo "❌ Error: User '$SECOND_USER' does not exist."
    exit 1
  fi

  SECOND_HOME=$(eval echo "~$SECOND_USER")
  echo "🔗 Linking for $SECOND_USER..."
  mkdir -p "$SECOND_HOME/.config"
  ln -sf "$NVIM_SOURCE_DIR" "$SECOND_HOME/.config/nvim"
  chown -h "$SECOND_USER:$SECOND_USER" "$SECOND_HOME/.config/nvim"
  echo "✔️ $SECOND_USER config linked."
fi

echo "✅ Done. Shared config is at: $NVIM_SOURCE_DIR"

