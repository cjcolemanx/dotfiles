local dash_status, dash = pcall(require, "dashboard")
if not dash_status then return end


-- Add theme keys here
local dash_themes            = {
  hyper = "hyper",
  doom = "doom"
}

-- NOTE: Set theme key here
local theme                  = dash_themes.doom

-- Header Image
local header
local ascii_status, img_func = pcall(require, "ui.dashboard.ascii")

if not ascii_status then
  header = {}
else
  header = img_func.get_random_image()
end

-- Center Display
local centers      = require("ui.dashboard.centers")

-- Footer Display
-- TODO:
-- local footers      = require("ui.dashboard.footers")

local hyper_config = {
  header = header,
  week_header = {
    enable = true
  },
  shortcut = {
    -- action can be a function type
    { desc = string, group = 'highlight group', key = 'shortcut key', action = 'action when you press key' },
  },
  packages = { enable = true }, -- show how many plugins neovim loaded
  -- limit how many projects list, action when you press key or enter it will run this action.
  -- action can be a functino type, e.g.
  -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
  project = { enable = true, limit = 8, icon = 'your icon', label = '', action = 'Telescope find_files cwd=' },
  mru = { limit = 10, icon = 'your icon', label = '', },
  footer = {}, -- footer
}

local doom_config  = {
  -- header = header,
  week_header = {
    enable = true,
    append = header
  },
  center = centers.doom_centers,
  footer = {}
}

-- Base config object
local config       = {
  theme = theme,
  -- config table added below
  config = {},
  disable_move = false,
  shortcut_type = "letter",
  change_to_vcs_root = false,
  hide = {
    statusline = true,
    tabline = true,
    winbar = true,
  },
  preview = {
    command = "",
    file_path = "",
    file_height = "",
    file_width = "",
  },
}

-- For storing theme config
local _conf

-- Grab the right theme table based on theme
if config.theme == "doom" then
  _conf = doom_config
elseif config.theme == "hyper" then
  _conf = hyper_config
end

config.config = _conf

dash.setup(
  config
)
