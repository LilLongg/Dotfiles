vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
vim.opt.autoread = true

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

vim.keymap.set("n", "<C-q>", ":belowright vsplit<CR>")
vim.keymap.set("n", "<C-a>", ":belowright split<CR>")
vim.keymap.set("n", "<C-x>", ":q<CR>")
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("n", "<C-`>", ":belowright 10split<CR><esc>:term<CR>")
vim.keymap.set("n", "<C-e>", ":tabnew<CR>")
vim.keymap.set("n", "<TAB>", ":tabnext<CR>")
vim.keymap.set("n", "<S-TAB>", ":tabprev<CR>")

vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])

vim.g.mapleader = " "
