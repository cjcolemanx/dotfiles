local M = {}

local utils = require("keymaps.util").utils("UFO", "Folds")

if not utils then return end

local setKey = utils.setKey
local finishKeys = utils.finishKeys

function M.binds(ufo)
  setKey("<Tab><Tab>", ufo.closeAllFolds, nil, nil, "Close all folds")
  setKey("<S-Tab><S-Tab>", ufo.openAllFolds, nil, nil, "Open all folds")
  setKey("<Tab>n", ufo.goNextClosedFold, nil, nil, "Go to next closed fold")
  setKey("<Tab>p", ufo.goPreviousClosedFold, nil, nil, "Go to next open fold")
  setKey("<Tab>k", ufo.peekFoldedLinesUnderCursor, nil, nil, "Peek fold under cursor")
  -- setKey("zR", ufo.openAllFolds, nil, nil, "Open all folds")
  -- setKey("zM", ufo.closeAllFolds, nil, nil, "Close all folds")
  -- setKey("zl", ufo.goNextClosedFold, nil, nil, "Go to next closed fold")
  -- setKey("zh", ufo.goPreviousClosedFold, nil, nil, "Go to next open fold")
  -- setKey("zp", ufo.peekFoldedLinesUnderCursor, nil, nil, "Peek fold under cursor")
  finishKeys()
end

return M
