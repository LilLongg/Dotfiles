return {
	"CRAG666/code_runner.nvim",
	config = function()
		require("code_runner").setup({
			filetype = {
				cpp = {
					'cd "$dir" &&',
					'g++ -std=c++20 "$fileName" -o "$fileNameWithoutExt" && ',
					'"./$fileNameWithoutExt"',
				},
				python = {
					'cd "$dir" &&',
					'python -u "$fileName"',
				},
			},

			mode = "float",
			float = {
				border = "rounded",

				height = 0.3,
				width = 0.5,

				anchor = "SW",

				x = 0,
				y = 1,
			},
		})

		vim.keymap.set("n", "<leader>ef", ":RunFile<CR>", { noremap = true, silent = false })
		vim.keymap.set("n", "<leader>eft", ":RunFile tab<CR>", { noremap = true, silent = false })
	end,
}
