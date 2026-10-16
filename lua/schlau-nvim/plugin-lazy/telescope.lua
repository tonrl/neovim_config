return {
        "nvim-telescope/telescope.nvim",
        version = '*',

        dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-telescope/telescope-ui-select.nvim",
                'nvim-telescope/telescope-fzf-native.nvim', build = 'make'

        },

        config = function()
                local actions = require('telescope.actions')
                require('telescope').setup({
                        defaults = {
                                layout_config = {
                                        height = 0.7,
                                        prompt_position = "top",
                                },
                                mappings = {
                                        i = {
                                                ["<CR>"] = actions.select_tab,
                                        },
                                        n = {
                                                ["<CR>"] = actions.select_tab,
                                        },
                                }
                        },
                        pickers = {
                                find_files = {
                                        theme = "dropdown",
                                }
                        },
                        extensions = {
                                fzf = {
                                        fuzzy = true,
                                        override_generic_sorter = true,
                                        override_file_sorter = true,
                                        case_mode = "smart_case",
                                },
                                ["ui-select"] = {
                                        require("telescope.themes").get_dropdown {
                                        }
                                }
                        }
                })

                local builtin = require('telescope.builtin')

                vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
                vim.keymap.set('n', '<leader>gg', builtin.grep_string, {})
                vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Telescope live grep' })
                vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Telescope buffers' })



                vim.keymap.set('n', '<leader>ps', function()
                        builtin.grep_string({ search = vim.fn.input("Grep > ") })
                end)
                vim.keymap.set('n', '<leader>sh', builtin.help_tags, {desc = '[S]earch [H]elp'})
                -- Search for Neovim configuration file
                vim.keymap.set('n', '<leader>sn', function()
                        builtin.find_files ({ cwd = vim.fn.stdpath 'config' })
                end, {desc = '[S]earch [N]eovim files'})
                require("telescope").load_extension("ui-select")

        end
}
