return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	config = function()
		vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])
		require("nvim-tree").setup({
			filters = {
				dotfiles = false,
			},
			view = {
        side = 'right',
				adaptive_size = true,
			},
      vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true}),
      vim.api.nvim_set_keymap('n', '<leader>o', ':NvimTreeFocus<CR>', {noremap = true, silent = true}),
		})
	end,
}
