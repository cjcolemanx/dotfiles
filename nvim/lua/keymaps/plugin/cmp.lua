local M = {}

local utils = require("keymaps.util").utils("CMP", "Autocompletion w/ Snippet Support")

local setKey = utils.setKey
local finishKeys = utils.finishKeys

-- FIXME: will have to manually document
function M.keys(cmp, luasnip)
  -- NOTE: Fixes CMP issues
  -- setKey("i", "<Tab>", "<Tab>")

  return {
    ["<C-j>"] = cmp.mapping.select_next_item(),
    -- ["<M-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select, count = 3 }),
    -- ["<down>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- ["<M-k>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select, count = -3 }),
    -- ["<up>"] = cmp.mapping.select_prev_item(),
    -- Scroll Docs or do a tabout
    ["<C-p>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.mapping.scroll_docs(-4)
      elseif not luasnip.expand_or_jumpable()
          and not luasnip.choice_active()
          and vim.bo.filetype ~= "TelescopePrompt"
      then
        vim.cmd("Tabout")
        -- elseif vim.bo.filetype == "TelescopePrompt" then
      else
        -- local key = vim.api.nvim_replace_termcodes("<C-p>", true, true, true)
        -- vim.api.nvim_feedkeys(key, "i", false)
        return
      end
    end, { "i", "s" }),
    ["<C-n>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.mapping.scroll_docs(4)
      elseif not luasnip.expand_or_jumpable()
          and not luasnip.choice_active()
          and vim.bo.filetype ~= "TelescopePrompt"
      then
        vim.cmd("TaboutBack")
        -- elseif vim.bo.filetype == "TelescopePrompt" then
        -- 	local key = vim.api.nvim_replace_termcodes("<C-n>", true, true, true)
        -- 	vim.api.nvim_feedkeys(key, "i", false)
      else
        -- local key = vim.api.nvim_replace_termcodes("<C-n>", true, true, true)
        -- vim.api.nvim_feedkeys(key, "i", false)
        return
      end
    end, { "i", "s" }),
    -- Complete Snipppet Or Insert Completion
    ["<C-e>"] = cmp.mapping(function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        })
      end
    end, { "i", "s" }),
    ["<C-l>"] = cmp.mapping(function()
      if vim.bo.filetype == "TelescopePrompt" then
        require("telescope.actions"):select_vertical()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        cmp.confirm({ behavior = cmp.ConfirmBehavior.Select, select = true })
      end
    end, { "i", "s" }),
    ["<C-h>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { "i", "s" }),
    ["<C-x>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- ["<C-Space"] = cmp.mapping(function(fallback)
    -- 	cmp.get_entries()
    -- end, { "i", "s" }),
  }
end

function M.doc_keys()
  setKey("<C-j>", nil, nil, nil, "Select Next", true)
  setKey("<C-k>", nil, nil, nil, "Select Previous", true)
  setKey("<C-p>", nil, nil, nil, "Scroll Preview Up", true)
  setKey("<C-n>", nil, nil, nil, "Scroll Preview Down", true)
  setKey("<C-e>", nil, nil, nil, "Confirm Completion", true)
  setKey("<C-l>", nil, nil, nil, "Next Placeholder OR Confirm Completion", true)
  setKey("<C-h>", nil, nil, nil, "Previous Placeholder", true)
  setKey("<C-x>", nil, nil, nil, "Abort Completion OR Close Completion Menu", true)
  finishKeys()
end

return M
