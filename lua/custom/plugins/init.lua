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
    config = function()
      vim.cmd.colorscheme 'catppuccin'
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

  -- Automatic formatting
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'black' },
        javascript = { 'prettierd' },
      },
      formatters = {
        black = {
          prepend_args = { '--preview' },
        },
      },
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
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

  -- Automatic bracket pairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },

  -- Edit files/directories as a buffer
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    opts = {
      skip_confirm_for_simple_edits = true,
    },
    keys = {
      { '<M-b>', '<cmd>Oil<cr>', desc = 'Oil' },
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

  --  Automatically install tools through Mason
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'black',
        'stylua',
        'debugpy',
        'prettierd',
        'eslint',
      },
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

  -- harpoon
  {
    'theprimeagen/harpoon',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>ma', "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = '[m]ark file' },
      { '<leader>md', "<cmd>lua require('harpoon.mark').rm_file()<cr>", desc = '[d]elete file' },
      { '<leader>mt', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = '[t]oggle quick menu' },
      { '<M-h>', "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = 'mark 1' },
      { '<M-j>', "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = 'mark 2' },
      { '<M-k>', "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = 'mark 3' },
      { '<M-l>', "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = 'mark 4' },
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
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = true,
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = true,
    opts = {
      workspaces = {
        {
          name = 'work',
          path = '~/vaults/work',
        },
        {
          name = 'personal',
          path = '~/vaults/personal',
        },
      },
      -- Optional, customize how names/IDs for new notes are created.
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ''
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. '-' .. suffix
      end,
    },
    keys = {
      { '<leader>of', '<cmd>ObsidianQuickSwitch<cr>', desc = 'Obsidian QuickSwitch' },
      { '<leader>og', '<cmd>ObsidianSearch<cr>', desc = 'Obsidian Search' },
      { '<leader>ot', '<cmd>ObsidianTags<cr>', desc = 'Obsidian Tags' },
    },
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
}
