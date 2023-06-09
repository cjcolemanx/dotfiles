-- local status, drop = pcall(require, "drop")
local status = false

if not status then
  return
end

drop.setup({
  ---@type DropTheme|string
  theme = "snow", -- can be one of rhe default themes, or a custom theme
  -- theme = "leaves", -- can be one of rhe default themes, or a custom theme
  -- theme = "stars", -- can be one of rhe default themes, or a custom theme
  max = 40,                    -- maximum number of drops on the screen
  interval = 75,               -- every 150ms we update the drops
  screensaver = 1000 * 60 * 5, -- show after 5 minutes. Set to false, to disable
  -- screensaver = 5000, -- show after 5 minutes. Set to false, to disable
  -- screensaver = 1000,
  -- screensaver = 1000 * 60 * 5,
  -- filetypes = { "dashboard", "alpha", "starter" }, -- will enable/disable automatically for the following filetypes
  filetypes = {}, -- will enable/disable automatically for the following filetypes
  -- filetypes = { "alpha", "starter" }, -- will enable/disable automatically for the following filetypes
})
