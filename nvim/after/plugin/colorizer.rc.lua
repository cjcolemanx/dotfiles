-- local status, col = pcall(require, "colorizer")

local status = false

if not status then
  -- TODO: do something
  -- print("Error: nvim-colorizer is unavailable")
  return
end

col.setup()
