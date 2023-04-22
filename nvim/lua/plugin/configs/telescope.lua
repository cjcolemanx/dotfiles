return {
	{
		"nvim-telescope/telescope.nvim", -- Search Interface
		requires = {
			"nvim-lua/popup.nvim", -- Pop-Up Windows
			"nvim-lua/plenary.nvim", -- Utilities
		},
	},
	{ "nvim-telescope/telescope-file-browser.nvim", requires = { "nvim-telescope/telescope.nvim" } }, -- File Browser
	{ "nvim-telescope/telescope-frecency.nvim",     requires = { "nvim-telescope/telescope.nvim" } }, -- Frequent + Recent
	{ "nvim-telescope/telescope-ui-select.nvim",    requires = { "nvim-telescope/telescope.nvim" } }, -- TScope Native Selection
}
