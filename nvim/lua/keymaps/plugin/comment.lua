local M = {}

local utils = require("keymaps.util").utils("Comment", "Comment text")

local setKey = utils.setKey
local finishKeys = utils.finishKeys

function M.binds()
  local api = require("Comment.api")

  setKey("<C-\\>", api.toggle.blockwise.current, { "n", "v" }, nil, "Toggle blockwise (linewise if not in visual)")

  local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)

  setKey("gh", function()
    vim.api.nvim_feedkeys(esc, "nx", false)
    api.toggle.linewise(vim.fn.visualmode())
  end, "x", nil, "Toggle linewise in VISUAL")
  setKey("gb", function()
    vim.api.nvim_feedkeys(esc, "nx", false)
    api.toggle.blockwise(vim.fn.visualmode())
  end, "x", nil, "Toggle blockwise in VISUAL")
end

M.keymap = {
  toggler = {
    line = "gh",
    block = "gb",
  },
  opleader = {
    line = "gh",
    block = "gb",
  },
  extra = {
    above = "gk",
    below = "gj",
    eol = "gl",
  },
}

function M.doc_keys()
  setKey("gh", nil, nil, nil, "Toggle line comment", true)
  setKey("gb", nil, nil, nil, "Toggle block comment", true)
  setKey("{c}gh", nil, nil, nil, "Toggle line comment over next {count} lines", true)
  setKey("{c}gb", nil, nil, nil, "Toggle block comment around next {count} lines", true)
  setKey("gk", nil, nil, nil, "Add new comment above (newline)", true)
  setKey("gj", nil, nil, nil, "Add new comment below (newline)", true)
  setKey("gl", nil, nil, nil, "Add new comment and EOL", true)
  finishKeys()
end

return M
