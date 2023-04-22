local M = {}

local utils = require("keymaps.util").utils("GoMove", "Line Shifting and Moving")

local setKey = utils.setKey
local finishKeys = utils.finishKeys

function M.binds()
  setKey("<S-h>", "<Plug>GoNSMLeft", nil, nil, "Move left")
  setKey("<S-j>", "<Plug>GoNSMDown", nil, nil, "Move down")
  setKey("<S-k>", "<Plug>GoNSMUp", nil, nil, "Move up")
  setKey("<S-l>", "<Plug>GoNSMRight", nil, nil, "Move right")
  setKey("<S-h>", "<Plug>GoVSMLeft", "x", nil, "Move left")
  setKey("<S-j>", "<Plug>GoVSMDown", "x", nil, "Move down")
  setKey("<S-k>", "<Plug>GoVSMUp", "x", nil, "Move up")
  setKey("<S-l>", "<Plug>GoVSMRight", "x", nil, "Move right")
end

function M.doc_keys()
  finishKeys()
end

return M
