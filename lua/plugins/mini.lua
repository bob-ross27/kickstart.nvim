return { -- Collection of various small independent plugins/modules
  'nvim-mini/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- Simple and easy statusline.
    require('mini.statusline').setup { use_icons = true }

    -- Auto pairs
    require('mini.pairs').setup()

    -- Icons
    require('mini.icons').setup()

    require('mini.extra').setup()

    -- Picker
    require('mini.pick').setup { mappings = { choose_marked = '<C-q>' } }
    vim.keymap.set('n', '<leader><leader>', '<Cmd>Pick buffers<CR>', { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>sh', '<Cmd>Pick help<CR>', { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', '<Cmd>Pick keymaps<CR>', { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', '<Cmd>Pick files<CR>', { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sw', '<Cmd>Pick grep pattern="<cword>"<CR>', { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', '<Cmd>Pick grep pattern=""<CR>', { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', '<Cmd>Pick diagnostic scope="all"<CR>', { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', '<Cmd>Pick resume<CR>', { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>ds', '<Cmd>Pick lsp scope="document_symbol"<CR>', { desc = '[D]ocument [S]ymbols' })
    vim.keymap.set('n', '<leader>ws', '<Cmd>Pick lsp scope="workspace_symbol_live"<CR>', { desc = '[W]orkspace [S]ymbols' })
    vim.keymap.set('n', 'gr', '<Cmd>Pick lsp scope="references"<CR>', { desc = '[G]oto [R]eferences' })
  end,
}
