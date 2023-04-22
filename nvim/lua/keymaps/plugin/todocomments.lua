local M = {}

local utils = require("keymaps.util").utils("Todo Comments")

if not utils then return end

local setKey = utils.setKey
local finishKeys = utils.finishKeys

function M.keys(td)
  -- Generic
  setKey("]]", function()
    td.jump_next()
  end)
  setKey("[[", function()
    td.jump_prev()
  end)
  -- TODO:
  setKey("]t", function()
    td.jump_next({ keywords = { "TODO" } })
  end)
  setKey("[t", function()
    td.jump_prev({ keywords = { "TODO" } })
  end)
  -- FIXME:
  setKey("]e", function()
    td.jump_next({ keywords = { "FIXME" } })
  end)
  setKey("[e", function()
    td.jump_prev({ keywords = { "FIXME" } })
  end)
  -- NOTE:
  setKey("]n", function()
    td.jump_next({ keywords = { "NOTE" } })
  end)
  setKey("[n", function()
    td.jump_prev({ keywords = { "NOTE" } })
  end)
  -- HACK:
  setKey("]h", function()
    td.jump_next({ keywords = { "NOTE" } })
  end)
  setKey("[h", function()
    td.jump_prev({ keywords = { "NOTE" } })
  end)
  finishKeys()
end

return M
