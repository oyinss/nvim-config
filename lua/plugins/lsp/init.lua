-- ~/.config/nvim/lua/plugins/lsp/init.lua

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    config = function()
      require("neodev").setup({
        library = {
          enabled = true,
          runtime = true,
          types = true,
          plugins = true,
        },
        setup_jsonls = true,
        lspconfig = false,
        pathStrict = true,
      })

      require("plugins.lsp.handlers").setup()
    end,
    dependencies = {
      "folke/neodev.nvim",
    },
  },
}
