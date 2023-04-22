local M = {}

local utils = require("keymaps.util").utils("LuaSnip", "Snippets in Neovim")

if not utils then return end

local setKey = utils.setKey
local finishKeys = utils.finishKeys

function M.keys(ls)
  -- For Dynamic Snippets
  setKey("<c-j>", function()
    -- vim.keymap.set("i", "<Tab>", function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end, { "i", "s" })

  setKey("<c-k>", function()
    if ls.choice_active() then
      ls.change_choice(-1)
    end
  end, { "i", "s" })

  -- Quickly Add A Blank Line (Can Navigate Through Snippet After)
  setKey("<c-y>", "<esc>o", { "i", "s" }, { silent = true })

  -- Quickly Edit The Current Buffer's Associated Snippets (Telescope picker)
  setKey("<Leader><CR>", "<cmd>LuaSnipEdit<cr>", "n", { silent = true, noremap = true })

  -- Overrides regular popup closing, or just close luasnip popup
  setKey("<C-h>", "<cmd>lua choice_popup_close()<cr>", "s", { silent = true, noremap = true })
  finishKeys()
end

return M
