# Neovim Config for Python

This repository contains a lightweight and functional Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) as a plugin manager.

## Requirements
- **Neovim** (recommended version: 0.9+)
- **Git** (for downloading `lazy.nvim`)
- **Node.js & npm** (for LSP servers like `pyright`)
- **Python** (for running Python-based plugins)

### Install Neovim (if not installed)
#### Debian/Ubuntu
```sh
sudo apt update && sudo apt install neovim -y
```

### Install Plugin Manager (`lazy.nvim`)
```sh
git clone --depth=1 https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim
```

### Install Node.js & npm
`pyright` (the Python LSP server) requires `npm`. If you don’t have it installed, install Node.js, which includes `npm`:
```sh
sudo apt install nodejs npm -y
```
Check if Node.js and npm are installed:
```sh
node -v
npm -v
```

### Install `pyright` (Python LSP server)
To enable Python autocompletion, linting, and more, install `pyright`:
```sh
npm install -g pyright
```
Verify the installation:
```sh
pyright --version
```

### Fuzzy Finder (`fzf`)
To enable file searching with `:Files`, make sure you have `fzf` installed:
```sh
sudo apt install fzf -y
```

### Configure Neovim
Copy the provided `init.lua` file to your Neovim config directory:
```sh
mkdir -p ~/.config/nvim
cp init.lua ~/.config/nvim/init.lua
```
Or manually open and edit:
```sh
nvim ~/.config/nvim/init.lua
```
Paste the content from the `init.lua` file in this repository.

### Install Plugins
After opening Neovim, run:
```vim
:Lazy sync
```
Then press `i` to install all configured plugins.

---

### Tips

>**Tip** : For quick access to files, you can use the shortcut `Ctrl + P`. This is bound to the `:Files` command, which allows you to search and open files efficiently within your project.
---

Happy coding buddy.
