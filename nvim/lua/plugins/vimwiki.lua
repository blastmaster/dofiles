return {
    "vimwiki/vimwiki",
    branch = 'dev',
    dependencies = { 'mattn/calendar-vim' },
    init = function()

        vim.g.vimwiki_list = {
            {
                path = "~/Documents/wiki",
                path_html = "~/Documents/wiki/public_html",
                syntax = "markdown",
                ext = ".md",
                links_space_char = "_",
                auto_tags = 1,
                auto_diary_index = 1,
            }
        }

        vim.g.vimwiki_markdown_link_ext = 1
        vim.g.vimwiki_stripsym = ' '
        vim.g.vimwiki_global_ext = 0
        vim.g.vimwiki_hl_headers = 1

        vim.g.vimwiki_syntax_plugins = {
            codeblock = {
                ["```lua"] = { parser = "lua" },
                ["```bash"] = { parser = "bash" },
                ["```python"] = { parser = "python" },
                ["```c"] = { parser = "c" },
                ["```c++"] = { parser = "c++" },
                ["```rust"] = { parser = "rust" },
                ["```go"] = { parser = "go" },
                ["```html"] = { parser = "html" },
            },
        }
    end,
}
