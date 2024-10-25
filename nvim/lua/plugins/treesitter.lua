
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function ()
        require('nvim-treesitter.install').prefer_git = true
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"awk",
				"bash",
				"bibtex",
				"c",
				"cpp",
				"cmake",
				"diff",
				"dockerfile",
				"dot",
				"doxygen",
				"editorconfig",
				"gitcommit",
				"go",
				"json",
				"julia",
				"latex",
				"lua",
                "luadoc",
				"make",
				"markdown",
                "markdown_inline",
				"norg",
				"python",
				"regex",
				"rust",
				"scheme",
				"strace",
				"vim",
				"vimdoc",
				"javascript",
				"html",
                "query",
			},
			sync_install = false,
			highlight = {
                enable = true,
                additional_vim_regex_highlight = {"markdown"},
            },
			indent = { enable = true },
		})
	end
}
