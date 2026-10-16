return {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        branch = "main",
        config = function()
		require("nvim-treesitter").setup({
                        -- A list of parser names, or "all"
			require("nvim-treesitter").install {
                                "vimdoc",
                                "vim",
                                "javascript",
                                "typescript",
                                "json",
				"yaml",
				"toml",
                                "markdown",
                                "markdown_inline",
                                "c",
                                "cpp",
				"python",
                                "lua",
                                "rust",
                                "jsdoc",
                                "bash",
                                "html",
                                "css",
                                "rasi",
                                "dockerfile",
                        },
                })
		vim.api.nvim_create_autocmd('FileType', {
			pattern = { '<filetype>' },
			callback = function() vim.treesitter.start() end,
		})

		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		-- vim.wo[0][0].foldmethod = 'expr'

                vim.api.nvim_create_autocmd('User', {
                        pattern = 'TSUpdate',
                        callback = function()
                                require('nvim-treesitter.parsers').templ = {
                                        install_info = {
                                                url = 'https://github.com/vrischmann/tree-sitter-templ',
                                                branch = 'main', -- or specific branch/tag
                                                queries = 'queries/templ',
                                        },
                                }
                        end
                })

                vim.treesitter.language.register("templ", "templ")
                vim.filetype.add({
			pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
                })
        end
}
