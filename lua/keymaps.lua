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
