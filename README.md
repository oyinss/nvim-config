<!-- BADGE START -->
<div class="badges-container" align="center">

  <!-- Open Source Badges -->
  <div class="open-source-badges">
    <!-- Open Source Love -->
    <a href="#"><img src="https://badges.frapsoft.com/os/v1/open-source.svg?v=103&style=for-the-badge" alt="Open Source Love" height="30px"></a>
    <!-- MIT License -->
    <a href="#"><img src="https://badges.frapsoft.com/os/mit/mit.svg?v=103&style=for-the-badge" alt="MIT License" height="30px"></a>
    <!-- Awesome -->
    <a href="#"><img src="https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg" alt="Awesome" height="30px"></a>
  </div>

  <!-- Activities -->
  [![Made with Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?v=103&logo=lua&style=for-the-badge)](#)
  [![Linux](https://img.shields.io/badge/Linux-%23.svg?v=103&logo=linux&color=FCC624&logoColor=black&style=for-the-badge)](#)
  [![macOS](https://img.shields.io/badge/macOS-%23.svg?v=103&logo=apple&color=000000&logoColor=white&style=for-the-badge)](#)
  [![Windows](https://img.shields.io/badge/Windows-%23.svg?v=103&logo=windows&color=0078D6&logoColor=white&style=for-the-badge)](#)
  [![Neovim minimum version](https://img.shields.io/badge/Neovim-0.8+-blueviolet.svg?v=103&color=000F10&logo=Neovim&logoColor=green&labelColor=302D41&style=for-the-badge)](https://github.com/neovim/neovim/releases/tag/stable)
  [![Top languages](https://img.shields.io/github/languages/top/Oyinbra/nvim-config?svg?v=103&style=for-the-badge)](https://github.com/Oyinbra/nvim-config/search?l=vim-script)
  [![Commit Activity](https://img.shields.io/github/commit-activity/m/Oyinbra/nvim-config?svg?v=103&style=for-the-badge)](https://github.com/Oyinbra/nvim-config/graphs/commit-activity)
  [![Last commit](https://img.shields.io/github/last-commit/Oyinbra/nvim-config?svg?v=103&logo=git&color=000F10&logoColor=darkorange&labelColor=302D41&style=for-the-badge)](#)
  [![Contributors](https://img.shields.io/github/contributors/Oyinbra/nvim-config?svg?v=103&style=for-the-badge)](https://github.com/Oyinbra/nvim-config/graphs/contributors)
  [![Repository Size](https://img.shields.io/github/repo-size/Oyinbra/nvim-config?svg?v=103&style=for-the-badge)](#)
  
</div>
<!-- BADGE END -->

    
![Screenshot (1423)](https://github.com/Oyinbra/img/raw/main/nvim-img/img-001.png)

</div>

# ⚡️ Introduction

This repo hosts my Neovim configuration and its using Lazy plugin manager.

My setups are well-documented to ensure the greatest clarity. You can clone the whole repo and use it like that or you can choose whatever plugins and configurations that you want and add it to yours as i made sure all settings are separated and easily managed.

# ✨ Features

- Plugin management via [lazy.nvim](https://github.com/folke/lazy.nvim).
- Better usabilty via whichkey plugins so you don't have to forget your keys [which-key.nvim](https://github.com/folke/which-key.nvim).
- Auto-completionCode via [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).
- Language server protocol (LSP) support via [mason](https://github.com/williamboman/mason.nvim).
- Git integration via [lazy-git].

# 📦 Usability

## Which-key with space bar as leader key, then you can choose from the following options to quit, save file, format and save a file plus many other options to choose from

<p align="center">
<img src="https://github.com/Oyinbra/img/raw/main/nvim-img/img-002.png" width="800">
</p>

## File or Text search using Telescope

<p align="center">
<img src="https://github.com/Oyinbra/img/raw/main/nvim-img/img-005.png" width="800">
</p>

# 🚀 Installation and setup

- Backup up your current neovim setup

```
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

- Clone the stater park into your .config folder

```
git clone https://github.com/Oyinbra/nvim-config.git ~/.config/nvim
```

- Then start Neovim

```
nvim
```

- All plugins will be loaded automatically.
- Quit neovim and restart it to start using it.
- Run health check on lazy and if you migrated from parker plugin manager, you might have to remove some left over setup from parker.

```
rm /home/$USER/.local/share/nvim/site/pack/packer
rm /home/$USER/.config/nvim/plugin/packer_compiled.lua
```

# 🛠️ Symlink-based Configuration (For Multi-user Setup)

To install and share this Neovim config securely among multiple users, simply:

1. Clone the repo into your home directory:

```bash
git clone https://github.com/Oyinbra/nvim-config.git ~/nvim
```

2. Run the included installation script:

```bash
bash ~/nvim/install_nvim.sh
```

The script will handle cloning (if needed), setting permissions, and creating symlinks for your user, root, and optionally other users.

# 🐞 Find a bug?

If you found an issue or would like to submit an improvement to this project, please submit an issue using the issue tab above. If you would love to submit a PR with a fix, reference the issue you created.



