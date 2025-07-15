-- lua/plugins/none-ls.lua
return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvimtools/none-ls-extras.nvim" },
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local eslint_d  = require("none-ls.diagnostics.eslint_d")
    local augroup   = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
      border  = "single",
      sources = {
        formatting.prettierd.with({ extra_filetypes = { "svelte", "astro" } }),
        formatting.stylua,
        eslint_d,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group   = augroup,
            buffer  = bufnr,
            callback= function() vim.lsp.buf.format({ async = false }) end,
          })
        end
      end,
    })
  end,
}

