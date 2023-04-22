local M = {}

local utils = require("keymaps.util").utils("Zen", "Shut the whole world out")

if not utils then return end

local setKey = utils.setKey
local finishKeys = utils.finishKeys

function M.keys()
  setKey("<leader>z", ":ZenMode<CR>")
  finishKeys()
end

return M
