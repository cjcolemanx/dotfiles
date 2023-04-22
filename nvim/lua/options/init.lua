require("options.misspellings").setup_misspellings() -- autocorrect

local cmd = vim.cmd
local o = vim.o     -- Global
local opt = vim.opt -- some stuff
local wo = vim.wo   -- Window
-- local bo = vim.bo   -- Buffer
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
-- local in_wsl = os.getenv('WSL_DISTRO_NAME') ~= nil

------------------------------
-- Options
------------------------------
-- cmd("autocmd!")

o.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- o.cursorline = true
wo.number = true
wo.rnu = true

o.mouse = "a"
o.title = true
o.autoindent = true
o.smartindent = true
o.hlsearch = true
o.backup = false
o.showcmd = true
o.cmdheight = 1
o.laststatus = 2
o.expandtab = true
o.scrolloff = 10
o.inccommand = "split"
o.ignorecase = true
o.smarttab = true
o.breakindent = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.wrap = false
o.undofile = true
o.timeoutlen = 500
o.breakindent = true
o.textwidth = 80
o.showtabline = 2
o.termguicolors = true
o.colorcolumn = "80"

opt.splitright = true
opt.ttyfast = true
opt.splitright = false
opt.viewoptions = "cursor,folds,slash,unix"
opt.path:append({ "**" }) -- Search Subfolders
opt.wildignore:append({ "*/node_modules/*", "*/.git/*" })
opt.formatoptions:append({ "" })
opt.clipboard:prepend({ "unnamed", "unnamedplus" })

-- Buggy?
cmd([[set whichwrap+=< whichwrap+=> whichwrap+=h whichwrap+=l]])

-- Clipboard
-- if in_wsl then
--   vim.g.clipboard = {
--     name = 'wsl clipboard',
--     copy = {
--       ["+"] = { "clip.exe" },
--       ["*"] = { "clip.exe" }
--     },
--     paste = {
--       ["+"] = { "nvim_paste" },
--       ["*"] = { "nvim_paste" }
--     },
--     cache_enabled = true
--   }
-- end

-- StatusColumn
------------------------------
-- opt.fillchars:append("fold: ,foldclose:,foldsep: ,foldopen:,")
-- opt.foldcolumn = "3"
-- opt.foldlevel = 99
-- opt.foldlevelstart = 99
-- opt.foldenable = true
opt.signcolumn = "yes:1"
-- opt.signcolumn = "no"
-- opt.statuscolumn = "%-3.3r %-0.1C"
-- opt.statuscolumn = "%3.3r %-1.1C"

-- Autocommands
------------------------------

-- Automatically show and remove current line highlight
autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
	group = augroup("CursorLine", { clear = false }),
	once = false,
	callback = function()
		cmd([[setlocal cursorline]])
	end,
})

autocmd("WinLeave", {
	group = augroup("CursorLine", { clear = false }),
	once = false,
	callback = function()
		cmd([[setlocal nocursorline]])
	end,
})

-- Turn off autocomments
cmd([[autocmd! FileType * set formatoptions-=c formatoptions-=r formatoptions-=o]])
