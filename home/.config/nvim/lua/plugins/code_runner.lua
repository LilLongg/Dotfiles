return {
	"CRAG666/code_runner.nvim",
	config = function()
		require("code_runner").setup({
			filetype = {
				cpp = {
					'cd "$dir" &&',
					'g++ -std=c++20 "$fileName" -o "$fileNameWithoutExt" -D__ONLINE_JUDGE && ',
					'"./$fileNameWithoutExt"',
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

		vim.keymap.set("n", "<leader>ef", ":w<CR>:RunFile<CR>", { noremap = true, silent = false })
		vim.keymap.set("n", "<leader>eft", ":w<CR>:RunFile tab<CR>", { noremap = true, silent = false })
	end,
}
