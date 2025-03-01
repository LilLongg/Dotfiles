--[[
return {
	"Hrle97/nvim.diagnostic_virtual_text_config",
	config = function()
		require("nvim.diagnostic_virtual_text_config").setup({
			-- your config here...
		})
	end,
}
--]]
return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  vim.diagnostic.config({
    update_in_insert = true,
    virtual_text = false,
    virtual_lines = true,
    float = true,
  }),
  config = function()
    require("lsp_lines").setup()
  end,
}
