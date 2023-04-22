local M = {}

local utils = require("keymaps.util").utils("Leap", "Quick Navigate in Buffers and Windows")

if not utils then return end

local setKey = utils.setKey
local finishKeys = utils.finishKeys

function M.keys()
  -- Bidirectional with l
  -- setKey("<Space>l", function()
  setKey("<CR>", function()
    require("leap").leap({ target_windows = { vim.fn.win_getid() } })
  end, { "n", "v" }, nil, "Start Leaping in buffer")

  -- Across Windows with L
  -- setKey("<Space>L", function()
  setKey("<S-CR>", function()
    require("leap").leap({
      target_windows = vim.tbl_filter(function(win)
        return vim.api.nvim_win_get_config(win).focusable
      end, vim.api.nvim_tabpage_list_wins(0)),
    })
  end, { "n", "v" }, nil, "Start Leaping across windows")
end

function M.doc_keys()
  finishKeys()
end

return M
