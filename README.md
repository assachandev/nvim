**A minimal, fast, and opinionated Neovim setup built from scratch in Lua.**

[![Neovim](https://img.shields.io/badge/Neovim-0.12%2B-57A143?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io)
[![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)](https://lua.org)
[![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)](LICENSE)
[![Branch](https://img.shields.io/badge/branch-main-green?style=for-the-badge&logo=git&logoColor=white)](../../tree/main)

*Tokyo Night · lazy-loaded · LSP-first · tmux-ready*

</div>

---

## Plugins

| Category | Plugin | Description |
|----------|--------|-------------|
| **LSP** | [lsp.lua](lua/plugins/lsp.lua) | Mason · mason-lspconfig · nvim-lspconfig |
| **Completion** | [blink.lua](lua/plugins/blink.lua) | blink.cmp · LuaSnip · friendly-snippets |
| **Syntax** | [treesitter.lua](lua/plugins/treesitter.lua) | Highlighting · indentation · textobjects |
| **Search** | [telescope.lua](lua/plugins/telescope.lua) | FZF-native fuzzy finder |
| **Format** | [conform.lua](lua/plugins/conform.lua) | Format on save — black · stylua · shfmt · clang-format |
| **Git** | [gitsigns.lua](lua/plugins/gitsigns.lua) | Hunks · inline blame · stage/reset |
| **Files** | [yazi.lua](lua/plugins/yazi.lua) | Yazi TUI file manager |
| **UI** | [ui.lua](lua/plugins/ui.lua) | Tokyo Night · Noice · Lualine · Fidget · mini.indentscope · mini.animate |
| **Editor** | [surround.lua](lua/plugins/surround.lua) | nvim-surround · Flash |
| **Markdown** | [render-markdown.lua](lua/plugins/render-markdown.lua) | Rendered headings · code blocks · checkboxes |
| **Nav** | [tmux-navigator.lua](lua/plugins/tmux-navigator.lua) | Seamless Neovim ↔ tmux pane navigation |

---

## Language Support

| Language | LSP Server | Formatter |
|----------|-----------|-----------|
| Python | `pyright` | `black` |
| Lua | `lua_ls` | `stylua` |
| Bash | `bashls` | `shfmt` |
| C / C++ | `clangd` | `clang-format` |
| Rust | `rust_analyzer` | — |
| Grammar | `ltex` | — |

> Mason auto-installs all LSP servers and formatters on first launch.

---

## Keymaps

`<leader>` = `Space` — press and hold to open **Which-Key** hints.

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
| `<leader>e` | File explorer (Yazi) |
| `<C-d>` / `<C-u>` | Scroll — cursor stays centered |
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
| `<leader>fb` | Buffers |
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
| `<leader>lr` | Rename symbol |
| `<leader>la` | Code action |
| `<leader>ld` | Line diagnostics |
| `<leader>lx` | Toggle virtual text |
| `<leader>ll` | Toggle hover float mode |
| `[d` / `]d` | Prev / next diagnostic |

</details>

<details>
<summary><b>Git</b></summary>

<br>

| Key | Action |
|-----|--------|
| `]h` / `[h` | Next / prev hunk |
| `<leader>gp` | Preview hunk |
| `<leader>gb` | Blame line |
| `<leader>gr` | Reset hunk |
| `<leader>gd` | Diff this |

</details>

<details>
<summary><b>Textobjects</b></summary>

<br>

| Key | Mode | Action |
|-----|------|--------|
| `vaf` / `vif` | visual | Select outer / inner function |
| `vaa` / `via` | visual | Select outer / inner argument |
| `vac` / `vic` | visual | Select outer / inner class |
| `]f` / `[f` | normal | Next / prev function |
| `]a` / `[a` | normal | Next / prev argument |

</details>

<details>
<summary><b>Spell / Grammar</b></summary>

<br>

| Key | Action |
|-----|--------|
| `<leader>St` | Toggle spell check |
| `<leader>Sf` | Fix suggestion |
| `<leader>Sa` | Add word to dictionary |
| `<leader>Sx` | Mark word as wrong |
| `]s` / `[s` | Next / prev misspelled word |

</details>

---

## Installation

### Arch Linux — one-liner

```bash
bash <(curl -s https://raw.githubusercontent.com/assachandev/nvim/main/install.sh)
```

Installs all system dependencies, clones the config, then launch `nvim` to let lazy.nvim handle the rest.

### Manual

```bash
# Install dependencies
sudo pacman -S neovim git base-devel make nodejs npm python clang fzf yazi ttf-jetbrains-mono-nerd jre-openjdk-headless

# Clone
git clone https://github.com/assachandev/nvim ~/.config/nvim

# Launch — lazy.nvim + Mason install everything on first start
nvim
```

**Requirements**

| Package | Purpose |
|---------|---------|
| `neovim 0.12+` | Core requirement |
| `git` · `base-devel` · `make` | Plugin building (fzf-native) |
| `nodejs` · `npm` | `pyright` and `bashls` LSP servers |
| `python` | `pyright` runtime |
| `clang` | `clangd` LSP + `clang-format` |
| `fzf` | Telescope native sorter |
| `yazi` | TUI file manager |
| `jre-openjdk-headless` | `ltex` LSP (grammar check) runtime |
| Nerd Font | Icons — e.g. `ttf-jetbrains-mono-nerd` |

> For Rust LSP, install the Rust toolchain:
> ```bash
> curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
> ```

---

## Structure

```
~/.config/nvim/
├── init.lua                  # Entry point — bootstraps lazy.nvim
├── after/
│   └── ftplugin/
│       └── markdown.lua      # Markdown heading colors
└── lua/
    ├── config/
    │   ├── options.lua       # Vim options
    │   ├── keymaps.lua       # Global keymaps
    │   └── autocmds.lua      # Autocommands
    └── plugins/              # One file per plugin, auto-loaded by lazy.nvim
        ├── lsp.lua
        ├── blink.lua
        ├── ui.lua
        └── ...
```
