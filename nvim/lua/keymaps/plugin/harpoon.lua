local M = {}

local utils = require("keymaps.util").utils("Harpoon", "Thar she blows!")

if not utils then return end

local setKey = utils.setKey
local finishKeys = utils.finishKeys

function M.binds(mark --[[ , ui ]])
  setKey("<Space>H", mark.add_file, nil, nil, "Add file to harpoon list") -- Mark with H
  setKey("<Space>h", ":Telescope harpoon marks<CR>", nil, nil, "View harpoon list") -- view with h
  setKey("<Space>i", ":lua require('harpoon.ui').nav_next()<CR>", nil, nil, "Go to next harpooned file") -- next with i
  setKey("<Space>u", ":lua require('harpoon.ui').nav_prev()<CR>", nil, nil, "Go to previous harpooned file") -- prev with u

  -- TODO: Make better binds
  -- setKey("<Space>1", ":lua require('harpoon.ui').nav_file(1)<CR>")
  -- setKey("<Space>2", ":lua require('harpoon.ui').nav_file(2)<CR>")
  -- setKey("<Space>3", ":lua require('harpoon.ui').nav_file(3)<CR>")
  -- setKey("<Space>4", ":lua require('harpoon.ui').nav_file(4)<CR>")
end

function M.doc_keys()
  finishKeys()
end

return M
