-- ################################################################################
-- #                                                                              #
-- #                                  MODULES                                     #
-- #            NOTE: Just to load in other additional plugins                    #
-- #                                                                              #
-- ################################################################################

return {
  { -- Additional text objects via treesitter
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter",
  },
  -- syntax hightlighting for kitty
  { "fladson/vim-kitty" },
  -- visula multi cursor
  { "mg979/vim-visual-multi" },
  -- Old settings
  { "ap/vim-css-color" }, -- CSS Color Preview
  { "wakatime/vim-wakatime" }, -- Time spent on nvim. API key needed
  { "rafi/awesome-vim-colorschemes" }, -- Color Schemes
  { "mattn/emmet-vim" },
  { "airblade/vim-gitgutter" }, -- A Vim plugin which shows git diff markers in the sign column
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter"
  },
  { "p00f/nvim-ts-rainbow", enabled = false },
  {
    "folke/which-key.nvim",
    event = "BufWinEnter",
  },
  { "hrsh7th/cmp-buffer" },
  { "onsails/lspkind-nvim" },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    config = function()
      require("persistence").setup()
    end,
  },
  { "tpope/vim-repeat", event = "VeryLazy" }, -- makes some plugins dot-repeatable like leap
}
