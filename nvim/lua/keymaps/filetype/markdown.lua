local opts = { buffer = true, silent = false }
local api = vim.api
local augroup = api.nvim_create_augroup
local aucommand = api.nvim_create_autocmd
local map = vim.keymap.set

local md_group = augroup("MarkdownKeymaps", { clear = false })

aucommand({ "Filetype" }, {
	group = md_group,
	pattern = "markdown",
	callback = function()
		map("n", "<leader>t", function()
			local unchecked = "- [ ]"
			local checked = "- [x]"
			local line = api.nvim_get_current_line()
			local pos = api.nvim_win_get_cursor(0)

			if string.sub(line, 1, 5) == unchecked then
				print("toggle TODO: DONE")
				api.nvim_buf_set_text(0, pos[1] - 1, 0, pos[1] - 1, 5, { checked })
			elseif string.sub(line, 1, 5) == checked then
				print("toggle TODO: INCOMPLETE")
				api.nvim_buf_set_text(0, pos[1] - 1, 0, pos[1] - 1, 5, { unchecked })
			end
		end, opts)
	end
})
