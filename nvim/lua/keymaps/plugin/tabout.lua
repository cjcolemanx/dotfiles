local M = {}

local utils = require("keymaps.util").utils("Tabout", "'Tab out' of brackets and quotes in insert mode")

if not utils then return end

local setKey = utils.setKey
local finishKeys = utils.finishKeys

function M.keys(make_doc)
  if make_doc == nil then make_doc = false end

  local function replace_keycodes(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local function tabout_binding()
    if vim.fn.pumvisible() ~= 0 then
      return replace_keycodes("<C-p>")
    else
      return replace_keycodes("<Plug>(Tabout)")
    end
  end

  local function backwards_tabout_binding()
    if vim.fn.pumvisible() ~= 0 then
      return replace_keycodes("<C-n>")
    else
      return replace_keycodes("<Plug>(TaboutBack)")
    end
  end

  setKey("<C-p>", tabout_binding, "i", { expr = true }, "Tab Out Forward", make_doc)
  setKey("<C-n>", backwards_tabout_binding, "i", { expr = true }, "Tab Out Backward", make_doc)

  finishKeys()
end

function M.doc_keys()
  M.keys(true)
end

return M
