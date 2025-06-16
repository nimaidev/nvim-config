return {
    "nvim-telescope/telescope.nvim",
    tag ="0.1.8",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        require('telescope').setup({})
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        
        -- <ctrl-p>shows file tracked by git
        vim.keymap.set("n", "<C-p>", builtin.git_files, {})

        -- <leader>ps: prompts the user for a search string, then greps the project.
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
    end
}

