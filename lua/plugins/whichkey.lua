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
    { "<leader>q", ":q<cr>", desc = "Quit" },
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

    -- Group: Plugins
    {
      "<leader>p",
      name = "Plugins",
      c = { ":Lazy clean<cr>", "Clean" },
      C = { ":Lazy check<cr>", "Check" },
      d = { ":Lazy debug<cr>", "Debug" },
      i = { ":Lazy install<cr>", "Install" },
      s = { ":Lazy sync<cr>", "Sync" },
      l = { ":Lazy log<cr>", "Log" },
      h = { ":Lazy home<cr>", "Home" },
      H = { ":Lazy help<cr>", "Help" },
      p = { ":Lazy profile<cr>", "Profile" },
      u = { ":Lazy update<cr>", "Update" },
    },

    -- Group: LSP
    {
      "<leader>l",
      name = "LSP",
      a = { ":Lspsaga code_action<cr>", "Code Action" },
      g = {
        function()
          require("toggleterm.terminal").Terminal
            :new({ cmd = "lazygit", direction = "float" })
            :toggle()
        end,
        "LazyGit",
      },
      i = { ":LspInstall<cr>", "Install" },
      I = { ":LspInfo<cr>", "Info" },
      o = { ":Lspsaga outline<cr>", "Outline" },
      r = { ":Lspsaga rename<cr>", "Rename" },
      d = { ":Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
      w = { ":Telescope diagnostics<cr>", "Workspace Diagnostics" },
      n = { ":Lspsaga diagnostic_jump_next<cr>", "Next Diagnostic" },
      k = { ":Lspsaga diagnostic_jump_prev<cr>", "Prev Diagnostic" },
      m = { ":Mason<cr>", "Mason Installer" },
      s = { function() require("persistence").load({ last = true }) end, "Last Session" },
      x = { function() require("persistence").load() end, "Restore Session" },
      e = { function() require("persistence").stop() end, "Stop Persistence" },
      t = { ":Telescope lsp_document_symbols<cr>", "Doc Symbols" },
      T = { ":Telescope lsp_workspace_symbols<cr>", "Workspace Symbols" },
    },

    -- Group: Terminal
    {
      "<leader>t",
      name = "Terminal",
      f = { ":ToggleTerm direction=float<cr>", "Float" },
      b = { ":ToggleTerm size=10 direction=horizontal<cr>", "Bottom" },
      s = { ":ToggleTerm size=50 direction=vertical<cr>", "Side" },
    },

    -- Group: Health
    {
      "<leader>h",
      name = "Health",
      h = { ":checkhealth<cr>", "Check Health" },
      l = { ":checkhealth lazy<cr>", "Lazy Health" },
    },

    -- Group: Window
    { "<leader>W", name = "Window" },

    -- Group: Focus
    {
      "<leader>z",
      name = "Focus",
      z = { ":ZenMode<cr>", "Zen Mode" },
      t = { ":Twilight<cr>", "Twilight" },
    },

    -- Group: Markdown Preview
    {
      "<leader>P",
      name = "Preview",
      m = { ":MarkdownPreviewToggle<cr>", "Markdown Preview" },
    },

    -- ChatGPT
    {
      "<leader>C",
      ":ChatGPT<cr>",
      desc = "ChatGPT",
    },
  },
}

