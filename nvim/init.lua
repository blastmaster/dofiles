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


local function getTelescopeOpts(state, path)
  return {
    cwd = path,
    search_dirs = { path },
    attach_mappings = function (prompt_bufnr, map)
      local actions = require "telescope.actions"
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local action_state = require "telescope.actions.state"
        local selection = action_state.get_selected_entry()
        local filename = selection.filename
        if (filename == nil) then
          filename = selection[1]
        end
        -- any way to open the file without triggering auto-close event of neo-tree?
        require("neo-tree.sources.filesystem").navigate(state, state.path, filename)
      end)
      return true
    end
  }
end



require("neo-tree").setup({
  filesystem = {
    window = {
      mappings = {
        ["/"] = "telescope_find",
        ["g"] = "telescope_grep",
      },
    },
  },
  commands = {
    telescope_find = function(state)
      local node = state.tree:get_node()
      local path = node:get_id()
      require('telescope.builtin').find_files(getTelescopeOpts(state, path))
    end,
    telescope_grep = function(state)
      local node = state.tree:get_node()
      local path = node:get_id()
      require('telescope.builtin').live_grep(getTelescopeOpts(state, path))
    end,
  },
})


-- define local options for key-mappigns

local opts = { noremap = true, silent = false }

-- undotree

vim.api.nvim_set_keymap("n", "<leader>ut", "<Cmd>UndotreeToggle<CR>", opts)

