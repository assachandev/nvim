<div align="center">

# Neovim — Server Config

**A lightweight Neovim setup optimized for SSH / remote server use.**

Fast startup · no build dependencies · no animations · core editing features only.

![Neovim](https://img.shields.io/badge/Neovim-0.11%2B-57A143?style=flat-square&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/Lua-5.1-2C2D72?style=flat-square&logo=lua&logoColor=white)
![Branch](https://img.shields.io/badge/branch-server-orange?style=flat-square)

</div>

> **For the full local config** (with Noice, Bufferline, Yazi, animations, etc.) → see the [`main`](../../tree/main) branch.

---

## 🆚 What's different from `main`

| Feature | Local (`main`) | Server (this branch) |
|---------|:--------------:|:--------------------:|
| Noice (fancy UI) | ✅ | ❌ removed |
| Bufferline | ✅ | ❌ removed |
| Yazi file manager | ✅ | ❌ removed |
| mini.animate (animations) | ✅ | ❌ removed |
| treesitter-context | ✅ | ❌ removed |
| undo-glow | ✅ | ❌ removed |
| fzf-native (Telescope) | ✅ (requires `make`) | ❌ removed |

---

## 🔌 Plugins

| Plugin | Description |
|--------|-------------|
| **[LSP](lua/plugins/lsp.lua)** | Mason + mason-lspconfig + nvim-lspconfig — Python, Lua, Bash, C/C++ |
| **[Completion](lua/plugins/cmp.lua)** | nvim-cmp · LuaSnip · friendly-snippets |
| **[Treesitter](lua/plugins/treesitter.lua)** | Parser-based syntax highlighting |
| **[Telescope](lua/plugins/telescope.lua)** | Fuzzy finder — files, grep, buffers, history |
| **[Formatter](lua/plugins/conform.lua)** | conform.nvim — format on save (black, stylua, shfmt, clang-format) |
| **[Git](lua/plugins/gitsigns.lua)** | Gitsigns — hunks, inline blame, stage/reset |
| **[File Explorer](lua/plugins/neo-tree.lua)** | Neo-tree sidebar |
| **[UI & Theme](lua/plugins/ui.lua)** | Catppuccin · Dressing · mini.indentscope · Lualine · Fidget |
| **[Editor](lua/plugins/pairs.lua)** | mini.pairs · [Comment.nvim](lua/plugins/comment.lua) · [nvim-surround](lua/plugins/surround.lua) · Flash · mini.cursorword |
| **[Diagnostics](lua/plugins/trouble.lua)** | Trouble.nvim — diagnostics panel, location list, quickfix |
| **[Tmux](lua/plugins/tmux-navigator.lua)** | vim-tmux-navigator — seamless navigation between Neovim splits and tmux panes |

---

## 🌐 LSP & Language Support

| Language | Server | Formatter | Install method |
|----------|--------|-----------|----------------|
| Python | `pyright` (Mason) | `black` | `pip3 install black --break-system-packages` |
| Lua | `lua_ls` (Mason) | `stylua` | Mason |
| Bash | `bashls` (Mason) | `shfmt` | Mason |
| C / C++ | `clangd` (Mason) | `clang-format` | `sudo apt install clang-format` |

---

## ⌨️ Keymaps

`<leader>` is set to `Space`. Press `<leader>` and wait for the **Which-Key** popup.

<details>
<summary><b>General</b></summary>

<br>

| Key | Action |
|-----|--------|
| `<leader>w` | Save file |
| `<leader>q` | Quit |
| `<leader>Q` | Force quit all |
| `jk` | Exit insert mode |
| `<Esc>` | Clear search highlight |

</details>

<details>
<summary><b>Navigation</b></summary>

<br>

| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Move between windows / tmux panes |
| `<C-↑/↓/←/→>` | Resize window |
| `<S-h>` / `<S-l>` | Previous / Next buffer |
| `<leader>bd` | Delete buffer |
| `<C-d>` / `<C-u>` | Scroll (cursor centered) |
| `<leader>sv` | Vertical split |
| `<leader>sh` | Horizontal split |

</details>

<details>
<summary><b>Telescope</b></summary>

<br>

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Find buffers |
| `<leader>fr` | Recent files |
| `<leader>fh` | Help tags |
| `<leader>fc` | Commands |

</details>

<details>
<summary><b>LSP</b></summary>

<br>

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | References |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>d` | Line diagnostics |
| `[d` / `]d` | Previous / Next diagnostic |

</details>

<details>
<summary><b>Commenting</b></summary>

<br>

| Key | Action |
|-----|--------|
| `gcc` | Toggle line comment |
| `gbc` | Toggle block comment |
| `gc` / `gb` | Comment (visual / motion) |

</details>

---

## 🚀 Installation on Server

**Requirements:** Neovim **0.11+**, Git, `npm`, `python3-pip`

> [!NOTE]
> mason-lspconfig requires Neovim 0.11+. The `apt` package on Ubuntu is usually too old — install via snap instead.

> [!NOTE]
> No Nerd Font required — Telescope and Lualine work fine with plain text symbols too.

```bash
# 1. Install Neovim 0.11+ (Ubuntu apt is too old)
sudo snap install nvim --classic

# 2. Install runtime dependencies for Mason
sudo apt install npm python3-pip -y

# 3. Install formatters that Mason cannot install on Ubuntu Server
pip3 install black --break-system-packages          # Python formatter
sudo apt install clang-format -y                    # C/C++ formatter

# 4. Install stylua binary (Mason handles this, but if it fails do it manually)
curl -L https://github.com/JohnnyMorganz/StyLua/releases/latest/download/stylua-linux-x86_64.zip \
  -o /tmp/stylua.zip
unzip /tmp/stylua.zip -d ~/.local/bin/
chmod +x ~/.local/bin/stylua

# 5. Make sure ~/.local/bin is in PATH
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc && source ~/.bashrc

# 6. Clone config
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || true
git clone -b server https://github.com/AssachanDev/nvim ~/.config/nvim

# 7. Launch — lazy.nvim + Mason install the rest on first start
nvim
```

Mason will auto-install LSP servers (`pyright`, `lua_ls`, `bashls`, `clangd`) and `stylua`/`shfmt` on first launch.

---

## 📁 Structure

```
~/.config/nvim/
├── init.lua                  # Entry point
└── lua/
    ├── config/
    │   ├── options.lua       # Vim options
    │   ├── keymaps.lua       # Global keymaps
    │   └── autocmds.lua      # Autocommands
    └── plugins/              # Loaded automatically by lazy.nvim
        ├── lsp.lua
        ├── cmp.lua
        ├── ui.lua
        └── ...
```
