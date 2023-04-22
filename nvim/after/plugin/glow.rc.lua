local status, glow = pcall(require, "glow")
local enabled = true

if not status then return end
if not enabled then return end

local config = {
  border = "shadow",
  style = "dark",
  pager = false,
  width = 80,
  height = 100,
  width_ratio = 0.7,
  height_ratio = 0.7,
}

glow.setup(config)

-- require("keymaps.plugin-maps").glow()
