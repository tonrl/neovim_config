return {
        "lervag/vimtex",
        lazy = false,     -- we don't want to lazy load VimTeX
        init = function()
                -- VimTeX configuration
--                vim.g.vimtex_view_method = "zathura"
                vim.g.vimtex_compiler_method = 'tectonic'

        end
}
