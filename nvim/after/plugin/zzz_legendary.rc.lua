-- NOTE: filename zzz_legendary is to force keymaps to be loaded last
local status, legendary = pcall(require, "legendary")

if not status then
  return
end

local keymaps = {}
local functions = {}
-- local commands = {}
-- local autocommands = {}

require('keymaps.plugin.legendary').binds()
local my_maps = require('keymaps.util').getMaps() -- global
-- local my_funcs = require('functions.util').getFuncs() -- global
-- local my_global_maps = require("keymaps.global-map-legend").legend
-- local my_picker_maps = require("ui.pickers").legend

local call_legendary = {
  group = "Legendary",
  keymaps = {
    {
      ";xk",
      "<CMD>Legendary keys<CR>",
      description = "Legendary: Show Keymaps",
      opts = { silent = true },
    },
    --   {
    --     ";lc",
    --     "<CMD>Legendary commands<CR>",
    --     description = "Legendary: Show Commands",
    --     opts = { silent = true },
    --   },
    {
      ";f",
      "<CMD>Legendary functions<CR>",
      description = "Legendary: Show Functions",
      opts = { silent = true },
    },
    --   {
    --     ";la",
    --     "<CMD>Legendary autocmds<CR>",
    --     description = "Legendary: Show Autocommands",
    --     opts = { silent = true },
    --   },
  }
}

for _, v in ipairs(my_maps) do
  table.insert(keymaps, v)
end

for _, v in ipairs(call_legendary) do
  table.insert(keymaps, v)
end

-- FIXME: breaks keymap view
-- for _, v in ipairs(my_funcs) do
--   table.insert(functions, v)
-- end



legendary.setup({
  keymaps = keymaps,
  funcs = functions,
  include_builtin = false,
  include_legendary_commands = false,
})

-- vim.keymap.set("n", ";xk", "<CMD>Legendary keymaps<CR>", { silent = true })
-- vim.keymap.set("n", ";xf", "<CMD>Legendary functions<CR>", { silent = true })
