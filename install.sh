#!/bin/bash
# Neovim server config installer — Ubuntu / Debian

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

info()    { echo -e "${CYAN}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[OK]${NC} $1"; }
warn()    { echo -e "${YELLOW}[WARN]${NC} $1"; }
error()   { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

# ─────────────────────────────────────────────────────────────
#  Check Ubuntu / Debian
# ─────────────────────────────────────────────────────────────
if ! command -v apt &>/dev/null; then
    error "This script requires apt (Ubuntu / Debian only)."
fi

# ─────────────────────────────────────────────────────────────
#  Install Neovim 0.11+ via snap
# ─────────────────────────────────────────────────────────────
if command -v nvim &>/dev/null; then
    success "Neovim already installed."
else
    info "Installing Neovim 0.11+ via snap..."
    sudo snap install nvim --classic
    success "Neovim installed."
fi

# ─────────────────────────────────────────────────────────────
#  Install runtime dependencies
# ─────────────────────────────────────────────────────────────
info "Installing runtime dependencies..."
sudo apt install -y npm python3-pip git clang-format unzip curl
success "Runtime dependencies installed."

# ─────────────────────────────────────────────────────────────
#  Install Python formatter
# ─────────────────────────────────────────────────────────────
info "Installing black (Python formatter)..."
pip3 install black --break-system-packages 2>/dev/null || pip3 install black
success "black installed."

# ─────────────────────────────────────────────────────────────
#  Install stylua (Lua formatter)
# ─────────────────────────────────────────────────────────────
if command -v stylua &>/dev/null; then
    success "stylua already installed."
else
    info "Installing stylua..."
    mkdir -p "$HOME/.local/bin"
    curl -sL https://github.com/JohnnyMorganz/StyLua/releases/latest/download/stylua-linux-x86_64.zip \
        -o /tmp/stylua.zip
    unzip -o /tmp/stylua.zip -d "$HOME/.local/bin/" stylua
    chmod +x "$HOME/.local/bin/stylua"
    rm /tmp/stylua.zip
    success "stylua installed."
fi

# ─────────────────────────────────────────────────────────────
#  Ensure ~/.local/bin is in PATH
# ─────────────────────────────────────────────────────────────
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    # shellcheck disable=SC2016
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
    warn "Added ~/.local/bin to PATH — run: source ~/.bashrc"
fi

# ─────────────────────────────────────────────────────────────
#  Backup existing nvim config
# ─────────────────────────────────────────────────────────────
if [[ -d "$HOME/.config/nvim" ]]; then
    backup="$HOME/.config/nvim.bak.$(date +%Y%m%d_%H%M%S)"
    warn "Existing nvim config found — backing up to $backup"
    mv "$HOME/.config/nvim" "$backup"
fi

# ─────────────────────────────────────────────────────────────
#  Clone config (server branch)
# ─────────────────────────────────────────────────────────────
info "Cloning nvim server config..."
git clone -b server https://github.com/AssachanDev/nvim.git "$HOME/.config/nvim"
success "Config cloned."

# ─────────────────────────────────────────────────────────────
#  Done
# ─────────────────────────────────────────────────────────────
echo ""
success "Done! Launch nvim to let lazy.nvim install all plugins."
info "Mason will auto-install LSP servers on first launch."
echo ""
warn "If stylua is not found by Mason, it is already at ~/.local/bin/stylua"
