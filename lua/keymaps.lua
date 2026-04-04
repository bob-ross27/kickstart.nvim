-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-d>', '<C-d>zz') -- Center after half-page down
vim.keymap.set('n', '<C-u>', '<C-u>zz') -- Center after half-page up
vim.keymap.set('n', 'n', 'nzzzv') -- Center after next result
vim.keymap.set('n', 'N', 'Nzzzv') -- Center after previous result
vim.keymap.set('x', '<leader>p', [["_dP]]) -- Paste without losing register
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]]) -- Yank to OS clipboard
vim.keymap.set('n', '<leader>Y', [["+Y]]) -- ????
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]]) -- Delete without overwriting register

-- Grapple
require('which-key').add {
  { '<leader>m', group = 'Grapple' },
}

-- Delete buffer
vim.keymap.set('n', '<leader>b', ':bd<CR>', { desc = 'Delete [b]uffer' })

-- Adjust split size
vim.keymap.set('n', '<C-Left>', ':vertical resize +3<CR>', { desc = 'Resize Pane Vertically <-' })
vim.keymap.set('n', '<C-Right>', ':vertical resize -3<CR>', { desc = 'Resize Pane Vertically ->' })

-- Move line up and down
vim.keymap.set('v', '<M-Up>', ":m '>+1<CR>gv=gv", { desc = 'Move line up' })
vim.keymap.set('v', '<M-Down>', ":m '>-2<CR>gv=gv", { desc = 'Move line down' })

-- Jump to the definition of the word under your cursor.
--  This is where a variable was first declared, or where a function is defined, etc.
--  To jump back, press <C-t>.
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })

-- Jump to the implementation of the word under your cursor.
--  Useful when your language has ways of declaring types without an actual implementation.
vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { desc = '[G]oto [I]mplementation' })

-- Jump to the type of the word under your cursor.
--  Useful when you're not sure what type a variable is and you want to see
--  the definition of its *type*, not where it was *defined*.
vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { desc = 'Type [D]efinition' })

-- Rename the variable under your cursor.
--  Most Language Servers support renaming across files, etc.
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })

-- Execute a code action, usually your cursor needs to be on top of an error
-- or a suggestion from your LSP for this to activate.
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })

-- WARN: This is not Goto Definition, this is Goto Declaration.
--  For example, in C this would take you to the header.
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
