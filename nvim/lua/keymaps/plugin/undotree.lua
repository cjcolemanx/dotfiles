local M = {}

local utils = require("keymaps.util").utils("UndoTree", "History List of Undo Operations")

if not utils then return end

local setKey = utils.setKey
local finishKeys = utils.finishKeys

function M.keys()
  setKey("<leader>u", "<CMD>UndotreeToggle<CR>", nil, nil, "Toggle UndoTree")
  finishKeys()
end

return M
