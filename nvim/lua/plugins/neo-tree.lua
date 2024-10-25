return {
    "nvim-neo-tree/neo-tree.nvim",
    --branch = "v3.x",
    tag = "3.26",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    cmd = 'Neotree',
    keys = {
        {'<leader><leader>', ':Neotree toggle reveal position=right reveal_force_cwd<CR>', desc = 'Neotree reveal' },
        {'<leader>fs', ':Neotree filesystem current toggle<CR>', desc = 'Neotree toggle file system browser' },
    },
    opts = {
        filesystem = {
            window = {
                mappings = {
                    ['<leader><leader>'] = 'close_window',
                },
            },
        },
    },
}


