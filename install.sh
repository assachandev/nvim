#!/bin/bash
# Neovim config installer for Arch Linux

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
#  Check Arch
# ─────────────────────────────────────────────────────────────
if [[ ! -f /etc/arch-release ]]; then
    error "This script is for Arch Linux only."
fi

# ─────────────────────────────────────────────────────────────
#  Install system dependencies
# ─────────────────────────────────────────────────────────────
info "Installing system dependencies..."
sudo pacman -S --needed --noconfirm \
    neovim \
    git \
    base-devel \
    make \
    nodejs \
    npm \
    python \
    python-pip \
    clang \
    fzf \
    yazi \
    ttf-jetbrains-mono-nerd \
    jre-openjdk-headless \


success "System dependencies installed."

# ─────────────────────────────────────────────────────────────
#  Backup existing nvim config
# ─────────────────────────────────────────────────────────────
if [[ -d "$HOME/.config/nvim" ]]; then
    backup="$HOME/.config/nvim.bak.$(date +%Y%m%d_%H%M%S)"
    warn "Existing nvim config found — backing up to $backup"
    mv "$HOME/.config/nvim" "$backup"
fi

# ─────────────────────────────────────────────────────────────
#  Clone config
# ─────────────────────────────────────────────────────────────
info "Cloning nvim config..."
git clone https://github.com/assachandev/nvim.git "$HOME/.config/nvim"
success "Config cloned."

# ─────────────────────────────────────────────────────────────
#  Done
# ─────────────────────────────────────────────────────────────
echo ""
success "Done! Launch nvim to let lazy.nvim install all plugins."
info "Mason will auto-install LSP servers and formatters on first launch."
echo ""
warn "If icons look broken, make sure your terminal is using a Nerd Font."
info "For Rust LSP (rust_analyzer), make sure rustup is installed:"
info "  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
