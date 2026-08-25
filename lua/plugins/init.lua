return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.opt.timeoutlen
      delay = 0,
      icons = {
        mappings = true,
        keys = {},
      },

      -- Document existing key chains
      spec = {
        { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },

  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback',
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff_format' },
        javascript = { 'biome' },
        typescript = { 'biome' },
        json = { 'biome' },
      },
      formatters = {},
    },
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    main = 'nvim-treesitter', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    init = function()
      -- auto-install parsers
      local ensureInstalled = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
      }
      local alreadyInstalled = require('nvim-treesitter.config').get_installed()
      local parsersToInstall = vim
        .iter(ensureInstalled)
        :filter(function(parser)
          return not vim.tbl_contains(alreadyInstalled, parser)
        end)
        :totable()
      require('nvim-treesitter').install(parsersToInstall)

      -- configure highlighting
      vim.api.nvim_create_autocmd('FileType', {
        callback = function()
          -- Enable treesitter highlighting and disable regex syntax
          pcall(vim.treesitter.start)
          -- Enable treesitter-based indentation
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },

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
    dependencies = {
      'lewis6991/async.nvim',
    },
    lazy = false,
  },

  -- Edit files/directories as a buffer
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-mini/mini.nvim' },
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
      icons = false,
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
    'danymat/neogen',
    config = function()
      require('neogen').setup { snippet_engine = 'nvim' }
    end,
    keys = {
      { '<leader>cf', "<cmd>lua require('neogen').generate({ type = 'func'})<cr>", desc = 'Generate [f]unc docs' },
      { '<leader>cd', "<cmd>lua require('neogen').generate()<cr>", desc = 'Generate [d]ocs' },
    },
  },

  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = 'default' },
      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = { documentation = { auto_show = true } },
      signature = { window = { show_documentation = true }, enabled = true },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    opts_extend = { 'sources.default' },
  },
}
