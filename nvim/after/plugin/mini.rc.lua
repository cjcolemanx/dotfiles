local a_status, align = pcall(require, "mini.align")

-- Keybinds
local keys = require("keymaps.plugin.mini").keys

if a_status then
  align.setup({
    mappings = keys.align.mappings,
    -- modifiers = keys.align.modifiers,
    options = {
      split_pattern = '',
      justify_side = 'left',
      merge_delimiter = '',
    },
    steps = {
      pre_split = {},
      split = nil,
      pre_justify = {},
      justify = nil,
      pre_merge = {},
      merge = nil,
    },
    -- Whether to disable showing non-error feedback
    silent = false,
  })
end
