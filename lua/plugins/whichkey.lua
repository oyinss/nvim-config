-- ###############################################################################
-- #                                                                              #
-- #                                WHICHKEY CONFIG                               #
-- #                     NOTE: Create key bindings that stick                     #
-- #                                                                              #
-- ################################################################################

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = {
      marks = false,
      registers = false,
      spelling = { enabled = false },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    spec = {
      { "<leader>p", group = "Plugins" },
      { "<leader>l", group = "LSP" },
      { "<leader>t", group = "Terminal" },
      { "<leader>h", group = "Health" },
      { "<leader>W", group = "Window" },
      { "<leader>z", group = "Focus" },
      { "<leader>P", group = "Preview" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ mode = "n", auto = true })
      end,
      desc = "Show Which-Key (Buffer Local)",
    },

    -- File ops
    { "<leader>w", ":w<cr>", desc = "Save" },
    { "<leader>x", ":x<cr>", desc = "Save & Quit" },
    { "<leader>f", function() vim.lsp.buf.format() end, desc = "Format Buffer" },
    { "<leader>s", ":source %<cr>", desc = "Source File" },

    -- Buffer ops
    { "<leader>c", ":bd<cr>", desc = "Close Buffer" },
    { "<leader>Y", ":%d+<cr>", desc = "Delete All Text" },
    { "<leader>y", ":%y+<cr>", desc = "Yank All Text" },

    -- UI Tools
    {
      "<leader>d",
      ":Alpha<cr>",
      desc = "Dashboard",
    },
    {
      "<leader>e",
      ":NvimTreeOpen<cr>",
      desc = "Explorer Open",
    },
    {
      "<leader>3",
      ":NvimTreeToggle<cr>",
      desc = "Explorer Toggle",
    },

    -- Telescope
    {
      "<leader> ",
      ":Telescope find_files<cr>",
      desc = "Find Files",
    },
    {
      "<leader>F",
      ":Telescope live_grep<cr>",
      desc = "Find Text",
    },
    {
      "<leader>r",
      ":Telescope oldfiles<cr>",
      desc = "Recent Files",
    },

    { "<leader>pc", ":Lazy clean<cr>", desc = "Clean" },
    { "<leader>pC", ":Lazy check<cr>", desc = "Check" },
    { "<leader>pd", ":Lazy debug<cr>", desc = "Debug" },
    { "<leader>pi", ":Lazy install<cr>", desc = "Install" },
    { "<leader>ps", ":Lazy sync<cr>", desc = "Sync" },
    { "<leader>pl", ":Lazy log<cr>", desc = "Log" },
    { "<leader>ph", ":Lazy home<cr>", desc = "Home" },
    { "<leader>pH", ":Lazy help<cr>", desc = "Help" },
    { "<leader>pp", ":Lazy profile<cr>", desc = "Profile" },
    { "<leader>pu", ":Lazy update<cr>", desc = "Update" },

    { "<leader>la", ":Lspsaga code_action<cr>", desc = "Code Action" },
    {
      "<leader>lg",
      function()
        require("toggleterm.terminal").Terminal
          :new({ cmd = "lazygit", direction = "float" })
          :toggle()
      end,
      desc = "LazyGit",
    },
    { "<leader>li", ":LspInstall<cr>", desc = "Install" },
    { "<leader>lI", ":LspInfo<cr>", desc = "Info" },
    { "<leader>lo", ":Lspsaga outline<cr>", desc = "Outline" },
    { "<leader>lr", ":Lspsaga rename<cr>", desc = "Rename" },
    { "<leader>ld", ":Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
    { "<leader>lw", ":Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
    { "<leader>ln", ":Lspsaga diagnostic_jump_next<cr>", desc = "Next Diagnostic" },
    { "<leader>lk", ":Lspsaga diagnostic_jump_prev<cr>", desc = "Prev Diagnostic" },
    { "<leader>lm", ":Mason<cr>", desc = "Mason Installer" },
    { "<leader>ls", function() require("persistence").load({ last = true }) end, desc = "Last Session" },
    { "<leader>lx", function() require("persistence").load() end, desc = "Restore Session" },
    { "<leader>le", function() require("persistence").stop() end, desc = "Stop Persistence" },
    { "<leader>lt", ":Telescope lsp_document_symbols<cr>", desc = "Doc Symbols" },
    { "<leader>lT", ":Telescope lsp_workspace_symbols<cr>", desc = "Workspace Symbols" },

    { "<leader>tf", ":ToggleTerm direction=float<cr>", desc = "Float" },
    { "<leader>tb", ":ToggleTerm size=10 direction=horizontal<cr>", desc = "Bottom" },
    { "<leader>ts", ":ToggleTerm size=50 direction=vertical<cr>", desc = "Side" },

    { "<leader>hh", ":checkhealth<cr>", desc = "Check Health" },
    { "<leader>hl", ":checkhealth lazy<cr>", desc = "Lazy Health" },

    { "<leader>zz", ":ZenMode<cr>", desc = "Zen Mode" },
    { "<leader>zt", ":Twilight<cr>", desc = "Twilight" },

    { "<leader>Pm", ":MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },

    { "<leader>C", ":ChatGPT<cr>", desc = "ChatGPT" },
  },
}
