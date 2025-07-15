-- ################################################################################
-- #                                                                              #
-- #                                   INIT ROOT                                  #
-- #                                                                              #
-- ################################################################################

-- LazyVim setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set space bar as Leader Key and termguicolors as true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.termguicolors = true

-- Neovide font fix
vim.opt.guifont = { "FiraCode Nerd Font:h7" }

-- 🛠️ Ensure Neovim sees system-wide tools like eslint
vim.env.PATH = vim.env.PATH .. ':/usr/bin'

-- Lazy plugins
require('lazy').setup('plugins')

-- Themes settings
require('theme')

-- Options
require('options.options')

-- Keybindings
require('keymaps.keymaps')

-- Autocmds
require('autocmds.autocmds')

