require("config.lazy")
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- colorscheme settings
local my_colorscheme = 'gruvbox'
vim.cmd.colorscheme(my_colorscheme)
require('lualine').setup {
    options = { theme = my_colorscheme }
}

-- define local options for key-mappigns
local opts = { noremap = true, silent = false }

-- undotree
vim.api.nvim_set_keymap("n", "<leader>ut", "<Cmd>UndotreeToggle<CR>", opts)

-- using gx to open urls with xdg-open
vim.keymap.set("n", "gx", function()
  local url = vim.fn.expand("<cfile>")
  vim.fn.jobstart({ "xdg-open", url }, { detach = true })
end, { desc = "Open URL under cursor with xdg-open", buffer = false, remap = false })

-- this is needed because the command is overwritten by the markdown filetype plugin otherwise
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.keymap.set("n", "gx", function()
      local url = vim.fn.expand("<cfile>")
      if url ~= "" then
        vim.fn.jobstart({ "xdg-open", url }, { detach = true })
      else
        print("No valid URL under cursor")
      end
    end, { buffer = true, desc = "Open URL with xdg-open" })
  end,
})


-- insert today date in the format YYYY-MM-DD
vim.api.nvim_set_keymap("n", "<F2>", "<Cmd>put=strftime('%F')<CR>", opts)
