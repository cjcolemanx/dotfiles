local M = {}

local utils = require("keymaps.util").utils("Trouble")

if not utils then return end

local setKey = utils.setKey
local finishKeys = utils.finishKeys

function M.keys()
  setKey("<leader>1", "<cmd>TroubleToggle<cr>")
  finishKeys()
end

return M
