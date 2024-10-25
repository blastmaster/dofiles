return {
    "NeogitOrg/neogit",
    tag = 'v0.0.1',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    opts = {},
    config = function()
        local neogit = require('neogit')
        neogit.setup({
            -- disable_prompt_on_change = true,
        })
    end,
}
