
vim.opt.number = true

-- indent automatically
vim.opt.autoindent = true
vim.opt.smartindent = true

-- stop highlighting lines longer than 800 chars
vim.opt.synmaxcol = 800

-- configure tabs
-- expand tabs with spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true

-- highlight search results and hightlight during search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.keymap.set('n', '<F10>', "<cmd>nohlsearch<CR>")

-- be case insensitive
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- enable cusorline and colorcolumn at 100
vim.opt.cursorline = true
vim.opt.colorcolumn = "100"

-- leaf 8 lines to bottom
vim.opt.scrolloff = 8

-- enable mouse
vim.opt.mouse = 'a'

-- show cmd thats being typed
vim.opt.showcmd = true
-- not needed to show mode, since its already in the statusbar
vim.opt.showmode = false
-- jump to bracket if one is inserted
vim.opt.showmatch = true

-- Sync between nvim and os clipboard 
-- see :help clipboard
vim.opt.clipboard = 'unnamedplus'

vim.opt.breakindent = true

-- save undo history
vim.opt.undofile = true

-- disable swap files; we have git for such things
vim.opt.swapfile = false

vim.opt.signcolumn = 'yes'

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions as you type
vim.opt.inccommand = 'split'
