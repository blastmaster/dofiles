
-- Diagnostics
vim.keymap.set('n', '<leader>d', vim.diagnostic.setloclist)

-- Easier navigation between windows
-- see :help wincmd
vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')

-- note: diagnostics are not exclusive to lsp servers
-- so these can be global keybindings
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>') 

-- when jumping between matches, keep the cursor in the middle of the window
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- don't move on *
vim.keymap.set('n', '*', '*<c-o>')

-- clear trailing whitespaces
-- vim.keymap.set('n', '<leader>.', ':%s/\s\+$//<CR>:let @/=\'\'<CR>')
