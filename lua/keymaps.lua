vim.keymap.set('n', '<C-d>', '<C-d>zz') -- Center after half-page down
vim.keymap.set('n', '<C-u>', '<C-u>zz') -- Center after half-page up
vim.keymap.set('n', 'n', 'nzzzv') -- Center after next result
vim.keymap.set('n', 'N', 'Nzzzv') -- Center after previous result
vim.keymap.set('x', '<leader>p', [["_dP]]) -- Paste without losing register
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]]) -- Yank to OS clipboard
vim.keymap.set('n', '<leader>Y', [["+Y]]) -- ????
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]]) -- Delete without overwriting register

-- Harpoon
require('which-key').register {
  ['<leader>m'] = { name = 'Harpoon', _ = 'which_key_ignore' },
}

-- Delete buffer
vim.keymap.set('n', '<leader>b', ':bd<CR>', { desc = 'Delete [b]uffer' })

-- Adjust split size
vim.keymap.set('n', '<C-Left>', ':vertical resize +3<CR>', { desc = 'Resize Pane Vertically <-' })
vim.keymap.set('n', '<C-Right>', ':vertical resize -3<CR>', { desc = 'Resize Pane Vertically ->' })

-- Move line up and down
vim.keymap.set('v', '<M-Up>', ":m '>+1<CR>gv=gv", { desc = 'Move line up' })
vim.keymap.set('v', '<M-Down>', ":m '>-2<CR>gv=gv", { desc = 'Move line down' })
