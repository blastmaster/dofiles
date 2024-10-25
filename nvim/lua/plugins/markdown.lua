--[[ return {
  "tadmccorkle/markdown.nvim",
  event = "VeryLazy",
  opts = {
    -- configuration here or empty for defaults
  },
}
]]

return {
  "preservim/vim-markdown",
  -- "gabrielelana/vim-markdown",
  branch = "master",
  require = {"godlygeek/tabular"},

  ft = "markdown", -- or 'event = "VeryLazy"'
  opts = {
    -- configuration here or empty for defaults
  },
  config = function(...) end,
}

