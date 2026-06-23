-- ################################################################################
-- #                                                                              #
-- #                                   KEYMAPS                                    #
-- #                                                                              #
-- #                                                                              #
-- ################################################################################

local M = {}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local keymap = vim.keymap

local function feedkeys(keys)
  local termcodes = vim.api.nvim_replace_termcodes(keys, true, false, true)
  vim.api.nvim_feedkeys(termcodes, "nx", false)
end

-- Better window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)

-- TODO: To yank text out of vim into system clipboard manager
map('n', '<C-S>c', '"+y', opts)
map('v', '<C-S>c', '"+y', opts)
map('i', '<C-S>c', '"+y', opts)

-- NOTE: Press jk or lk to return back to normal mode instead of using the escape key all the time
map('i', 'jk', '<ESC>', opts)
map('i', 'kj', '<ESC>', opts)
map('i', 'JK', '<ESC>', opts)
map('i', 'KJ', '<ESC>', opts)

-- Tree Toggle
-- map('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

map("n", "<C-u>", "<cmd>lua require('keymaps.keymaps').scroll_up()<cr>",
  { noremap = true, silent = true })
map("n", "<C-d>", "<cmd>lua require('keymaps.keymaps').scroll_down()<cr>",
  { noremap = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>Q', vim.diagnostic.setloclist, { desc = "Diagnostics List" })

-- Insert a blank line below or above current line (do not move the cursor),
-- see https://stackoverflow.com/a/16136133/6064933
keymap.set("n", "<space>o", "printf('m`%so<ESC>``', v:count1)", {
  expr = true,
  desc = "insert line below",
})

keymap.set("n", "<space>O", "printf('m`%sO<ESC>``', v:count1)", {
  expr = true,
  desc = "insert line above",
})

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines up and down
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Clear search with <esc>
-- map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  "n",
  "<leader>Wr",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / clear hlsearch / diff update" }
)

-- map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

-- save file
-- map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- windows
map("n", "<leader>Ww", "<C-W>p", { desc = "Other window" })
map("n", "<leader>Wd", "<C-W>c", { desc = "Delete window" })
map("n", "<leader>W-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>W|", "<C-W>v", { desc = "Split window right" })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

function M.scroll_up()
  feedkeys("<C-u>")
end

function M.scroll_down()
  feedkeys("<C-d>")
end

return M
