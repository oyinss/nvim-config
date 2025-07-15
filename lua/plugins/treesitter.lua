
-- ############################################################
-- NOTE: ~/.config/nvim/lua/plugins/lsp/treesitter.lua
-- NOTE: TREE SITTER – Better text highlighting
-- ############################################################

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "HiPhish/rainbow-delimiters.nvim",
      "windwp/nvim-ts-autotag",
      "windwp/nvim-autopairs",
    },
    config = function()
      local ok, ts_config = pcall(require, 'nvim-treesitter.configs')
      if not ok then return end

      ts_config.setup {
        ensure_installed = {
          'json', 'query', 'tsx', 'yaml', 'c', 'html',
          'rust', 'typescript', 'vim', 'vimdoc', 'regex',
          'bash', 'markdown', 'markdown_inline', 'css', 'scss',
        },
        sync_install = false,
        auto_install = true,

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },

        indent = {
          enable = true,
          disable = { 'python' },
        },

        autotag = { enable = true },
        autopairs = { enable = true },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
          },
        },

        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            -- swap_next = { ['<leader>a'] = '@parameter.inner' },
            -- swap_previous = { ['<leader>A'] = '@parameter.inner' },
          },
        },
      }

      -- Modern diagnostics handler (Nvim 0.12+ safe)
      vim.diagnostic.config({
        underline = true,
        virtual_text = {
          spacing = 5,
          severity = { min = vim.diagnostic.severity.WARN },
        },
        update_in_insert = true,
      })
    end,
  },
}
