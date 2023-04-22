local M = {}

local utils = require("keymaps.util").utils("Fugitive", "Git UI in Vim")

local setKey = utils.setKey
local finishKeys = utils.finishKeys

function M.keys()
  setKey("<Leader>gs", "<CMD>G<CR>", "n", nil, "Open Fugitive")        -- Call Fugitive
  setKey("<Leader>gd", "<CMD>Gdiffsplit<CR>", "n", nil, "View diff")   -- Open Git Diff for window
  setKey("<Leader>gS", "<CMD>Gwrite<CR>", "n", nil, "Write and Stage") -- Write and stage changes
  setKey("<Leader>gb", "<CMD>Git blame<CR>", "n", nil, "Git Blame")    -- Blame
end

function M.doc_keys()
  finishKeys()
end

return M
