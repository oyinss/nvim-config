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

-- Replace deprecated vim.tbl_flatten with a non-deprecated implementation
-- if possible, to avoid deprecation messages from plugins that call it.
do
  if vim.tbl_flatten then
    local ok, _ = pcall(function()
      -- only override if `vim.iter` is available (Neovim 0.10+)
      if vim.iter then
        vim.tbl_flatten = function(t)
          return vim.iter(t):flatten(math.huge):totable()
        end
      end
    end)
    if not ok then
      -- leave existing function in place if override fails
    end
  end
end

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

