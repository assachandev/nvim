#!/bin/bash
# Neovim config installer — Arch Linux & Ubuntu

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
#  Detect OS
# ─────────────────────────────────────────────────────────────
if [[ -f /etc/arch-release ]]; then
    OS="arch"
elif [[ -f /etc/lsb-release ]] && grep -q "Ubuntu" /etc/lsb-release; then
    OS="ubuntu"
else
    error "Unsupported OS. This script supports Arch Linux and Ubuntu only."
fi

info "Detected OS: $OS"

# ─────────────────────────────────────────────────────────────
#  Install system dependencies
# ─────────────────────────────────────────────────────────────
info "Installing system dependencies..."

if [[ "$OS" == "arch" ]]; then
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
        jre-openjdk-headless

elif [[ "$OS" == "ubuntu" ]]; then
    sudo apt-get update -q

    # Remove apt neovim if installed (usually too old)
    if dpkg -l neovim &>/dev/null 2>&1; then
        info "Removing outdated apt neovim..."
        sudo apt-get remove -y neovim
    fi

    # Neovim 0.11+ — install via tarball
    info "Installing Neovim 0.11+ from GitHub releases..."
    NVIM_URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz"
    curl -sL "$NVIM_URL" -o /tmp/nvim.tar.gz
    sudo tar -C /usr/local -xzf /tmp/nvim.tar.gz --strip-components=1
    rm /tmp/nvim.tar.gz

    sudo apt-get install -y \
        git \
        build-essential \
        make \
        nodejs \
        npm \
        python3 \
        python3-pip \
        clang \
        clang-format \
        fzf \
        default-jre-headless

    # yazi — not in apt, install via cargo or binary
    if ! command -v yazi &>/dev/null; then
        info "Installing yazi..."
        YAZI_URL="https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-gnu.zip"
        curl -sL "$YAZI_URL" -o /tmp/yazi.zip
        unzip -q /tmp/yazi.zip -d /tmp/yazi
        sudo mv /tmp/yazi/yazi-x86_64-unknown-linux-gnu/yazi /usr/local/bin/
        rm -rf /tmp/yazi.zip /tmp/yazi
    fi

    warn "On Ubuntu, install a Nerd Font manually and set it in your terminal."
    warn "Download: https://www.nerdfonts.com/font-downloads (JetBrainsMono recommended)"
fi

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
