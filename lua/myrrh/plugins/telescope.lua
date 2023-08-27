return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { "nvim-telescope/telescope-fzf-native.nvim", build = 'make' },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    }
                }
            }
        })
        
        telescope.load_extension("fzf")

        local keymap = vim.keymap
        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
        keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Find text in project" })
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Find current string in project" })
        keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Show active buffers" })
        keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Show telescope health tags" })
    end
}
