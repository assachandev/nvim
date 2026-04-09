<div align="center">

# Neovim — Local Config

**A minimal, fast, and opinionated Neovim setup built from scratch in Lua.**

Catppuccin Mocha · lazy-loaded · LSP-first · full feature set for local use.

![Neovim](https://img.shields.io/badge/Neovim-0.10%2B-57A143?style=flat-square&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/Lua-5.1-2C2D72?style=flat-square&logo=lua&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue?style=flat-square)
![Branch](https://img.shields.io/badge/branch-main%20(local)-green?style=flat-square)

</div>

> **Using over SSH / remote server?** → see the [`server`](../../tree/server) branch for a lightweight version without heavy UI plugins.

---

## 🔌 Plugins

| Plugin | Description |
|--------|-------------|
| **[LSP](lua/plugins/lsp.lua)** | Mason + mason-lspconfig + nvim-lspconfig — Python, Lua, Bash, C/C++ |
| **[Completion](lua/plugins/cmp.lua)** | nvim-cmp · LuaSnip · friendly-snippets |
| **[Treesitter](lua/plugins/treesitter.lua)** | Parser-based highlighting + treesitter-context (sticky scope) |
| **[Telescope](lua/plugins/telescope.lua)** | FZF-native fuzzy finder — files, grep, buffers, history |
| **[Formatter](lua/plugins/conform.lua)** | conform.nvim — format on save (black, stylua, shfmt, clang-format) |
| **[Git](lua/plugins/gitsigns.lua)** | Gitsigns — hunks, inline blame, stage/reset |
| **[File Explorer](lua/plugins/neo-tree.lua)** | Neo-tree sidebar + [Yazi](lua/plugins/yazi.lua) TUI file manager |
| **[UI & Theme](lua/plugins/ui.lua)** | Catppuccin · Noice · Bufferline · Lualine · Fidget |
| **[Editor](lua/plugins/pairs.lua)** | mini.pairs · [Comment.nvim](lua/plugins/comment.lua) · [nvim-surround](lua/plugins/surround.lua) · Flash · mini.cursorword · undo-glow |
| **[Diagnostics](lua/plugins/trouble.lua)** | Trouble.nvim — diagnostics panel, location list, quickfix |
| **[Tmux](lua/plugins/tmux-navigator.lua)** | vim-tmux-navigator — seamless navigation between Neovim splits and tmux panes |

---

## 🌐 LSP & Language Support

| Language | Server | Formatter |
|----------|--------|-----------|
| Python | `pyright` | `black` |
| Lua | `lua_ls` | `stylua` |
| Bash | `bashls` | `shfmt` |
| C / C++ | `clangd` | `clang-format` |

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

## 🚀 Installation

### Option 1 — Arch Linux (recommended)

```bash
bash <(curl -s https://raw.githubusercontent.com/AssachanDev/nvim/main/install.sh)
```

Installs all system dependencies, clones the config, then launch `nvim` to let lazy.nvim do the rest.

### Option 2 — Manual

**System requirements:**

| Package | Why |
|---------|-----|
| `neovim 0.10+` | Core requirement |
| `git`, `base-devel`, `make` | Plugin building (telescope-fzf-native) |
| `nodejs` + `npm` | Required for `pyright` and `bashls` LSP servers |
| `python` | Required for `pyright` to function |
| `clang` | `clangd` LSP + `clang-format` formatter |
| `fzf` | Telescope native fuzzy finder |
| Nerd Font | Icons — e.g. `ttf-jetbrains-mono-nerd` |

```bash
# Arch Linux
sudo pacman -S neovim git base-devel make nodejs npm python clang fzf ttf-jetbrains-mono-nerd

# Clone
git clone https://github.com/AssachanDev/nvim ~/.config/nvim

# Launch — lazy.nvim + Mason install everything on first start
nvim
```

> Mason will auto-install all LSP servers and formatters on first launch.

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
