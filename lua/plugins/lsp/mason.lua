-- ~/.config/nvim/lua/plugins/lsp/mason.lua

return {
  "williamboman/mason.nvim",
  cmd = {
    "Mason",
    "MasonInstall",
    "MasonUninstall",
    "MasonUninstallAll",
    "MasonLog",
  },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")

    require("lspconfig.ui.windows").default_options.border = "rounded"

    local servers = {
      -- Add servers you want here, e.g.:
      -- "lua_ls",
      -- "tsserver",
    }

    mason.setup({
      ui = {
        check_outdated_packages_on_open = false,
        border = "single",
        icons = {
          package_installed = "✓",
          package_pending = "",
          package_uninstalled = "➜",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = servers,
    })

    mason_lspconfig.setup_handlers({
      function(server_name)
        if server_name ~= "jdtls" then
          local opts = {
            on_attach = require("plugins.lsp.handlers").on_attach,
            capabilities = require("plugins.lsp.handlers").capabilities,
          }

          local ok, custom_opts = pcall(require, "plugins.lsp.settings." .. server_name)
          if ok then
            opts = vim.tbl_deep_extend("force", custom_opts, opts)
          end

          lspconfig[server_name].setup(opts)
        end
      end,
    })
  end,
}
