return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({})

	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
	vim.keymap.set("n", "<leader>pd", function()
		local cwd = vim.b.netrw_curdir or vim.fn.getcwd()
		require("telescope.builtin").find_files({ cwd = cwd })
	end, { desc = "find files in current netrw directory" })
	vim.keymap.set("n", "<c-p>", builtin.git_files, {})
	vim.keymap.set("n", "<leader>pws", function()
		local word = vim.fn.expand("<cword>")
		builtin.grep_string({ search = word })
	end)
	vim.keymap.set("n", "<leader>pws", function()
		local word = vim.fn.expand("<cword>")
		builtin.grep_string({ search = word })
	end)
	vim.keymap.set("n", "<leader>ps", function()
		builtin.grep_string({ search = vim.fn.input("grep > ") })
	end)
	vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
    end
}

