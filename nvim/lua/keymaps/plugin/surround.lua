local M = {}

local utils = require("keymaps.util").utils("Surround", "Surround Easily With Motions")

local setKey = utils.setKey
local finishKeys = utils.finishKeys

M.keys = {
  normal = "s",
  normal_line = "S",
  normal_cur = "<Leader>s",
  normal_cur_line = "<Leader>S",
  insert = "<C-Space><C-s>",
  insert_line = "<C-Space><C-l>",
  visual = "s",
  visual_line = "S",
  delete = "ds",
  change = "cs",
}

function M.doc_keys()
  setKey("s{m}{c}", nil, nil, nil, "Surround {motion} with {char}", true)
  setKey("S{s}{c}", nil, nil, nil, "Surround {selected} lines with {char}, break line", true)
  setKey("<leader>s{c}", nil, nil, nil, "Surround whole line with {char}", true)
  setKey("<leader>S{s}{c}", nil, nil, nil, "Surround whole line with {char}, break line", true)
  setKey("s{c}", nil, "v", nil, "Surround selected with {char}", true)
  setKey("S{c}", nil, "v", nil, "Surround line with {char}, break line", true)
  setKey("ds{t}", nil, "n", nil, "Delete {target} surround", true)
  setKey("cs{t}{n}", nil, "n", nil, "Change {target} surround to {new}", true)

  finishKeys()
end

return M
