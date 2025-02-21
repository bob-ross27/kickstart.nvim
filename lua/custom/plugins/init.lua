-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Color scheme
  {
    'catppuccin/nvim',
    lazy = false,
    name = 'catppuccin',
    priority = 1000,
    opts = {
      transparent_background = true,
    },
    init = function()
      vim.cmd.colorscheme 'catppuccin'
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  -- Zen Mode with :ZenMode
  {
    'folke/zen-mode.nvim',
    opts = {
      window = {
        width = 0.80,
      },
    },
    keys = {
      { '<leader>cm', '<cmd>ZenMode<cr>', desc = '[Z]en [M]ode' },
    },
  },

  -- Maintain context (function name/loops) at top of buffer
  'nvim-treesitter/nvim-treesitter-context',

  -- Refactor support with :Refactor
  {
    'ThePrimeagen/refactoring.nvim',
    opts = {},
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
  },

  -- Edit files/directories as a buffer
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    opts = {
      skip_confirm_for_simple_edits = true,
      float = {
        padding = 10,
        max_width = 0,
        max_height = 0,
      },
    },
    keys = {
      { '<M-b>', '<cmd>Oil --float<cr>', desc = 'Oil' },
    },
  },

  -- Searchable command reference with :CheatSheet
  {
    'sudormrfbin/cheatsheet.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    },
  },

  -- Add inline git history in floating windows
  'rhysd/git-messenger.vim',

  -- vim/tmux navigation
  'christoomey/vim-tmux-navigator',

  -- Tint inactive windows
  { 'miversen33/sunglasses.nvim', opts = {
    filter_type = 'SHADE',
    filter_percent = 0.35,
  } },

  {
    'cbochs/grapple.nvim',
    opts = {
      scope = 'git',
    },
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = 'Grapple',
    keys = {
      { '<leader>mm', '<cmd>Grapple toggle<cr>', desc = 'Grapple toggle tag' },
      { '<leader>mt', '<cmd>Grapple toggle_tags<cr>', desc = 'Grapple open tags window' },
      { '<leader>mn', '<cmd>Grapple cycle_tags next<cr>', desc = 'Grapple cycle [n]ext tag' },
      { '<leader>mp', '<cmd>Grapple cycle_tags prev<cr>', desc = 'Grapple cycle [p]revious tag' },
      { '<M-h>', '<cmd>Grapple select index=1<cr>', desc = 'Select first tag' },
      { '<M-j>', '<cmd>Grapple select index=2<cr>', desc = 'Select second tag' },
      { '<M-k>', '<cmd>Grapple select index=3<cr>', desc = 'Select third tag' },
      { '<M-l>', '<cmd>Grapple select index=4<cr>', desc = 'Select fourth tag' },
    },
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },

  -- Telescope UI for Code Actions
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown {},
          },
        },
      }
      require('telescope').load_extension 'ui-select'
    end,
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  },
  {
    'max397574/better-escape.nvim',
    opts = {},
  },
  {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
    opts = {},
    config = function(_, opts)
      require('lsp_signature').setup(opts)
    end,
  },
  {
    'danymat/neogen',
    config = function()
      require('neogen').setup { snippet_engine = 'luasnip' }
    end,
    keys = {
      { '<leader>cf', "<cmd>lua require('neogen').generate({ type = 'func'})<cr>", desc = 'Generate [f]unc docs' },
      { '<leader>cd', "<cmd>lua require('neogen').generate()<cr>", desc = 'Generate [d]ocs' },
    },
  },
}
