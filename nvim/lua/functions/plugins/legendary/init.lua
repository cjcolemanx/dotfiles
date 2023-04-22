local M = {}

function M.init()
  -- local legendary = require("legendary")
  -- local toolbox = require("legendary.toolbox")
  -- local filters = require("legendary.filters")

  local S = {}

  local keys = require("keymaps.util").getMaps()
  local funcs = require("functions.util").getFuncs()

  function S.get_keys_as_table()
    local filtered
    print(vim.inspect(keys))
  end

  function S.get_functions_as_table()
    local filtered
    print(vim.inspect(funcs))
  end

  -- FIXME:
  -- function S.find_undocumented_keys()
  --   legendary.find({
  --     filters = { filters.keymaps() },
  --     formatter = function(item, mode)
  --       print(item)
  --       print(mode)
  --       return { item }
  --     end,
  --     select_prompt = function(item)
  --       print("tabular")
  --       print(vim.inspect(item))
  --       print("item")
  --       print(item)
  --       print()
  --       return ""
  --     end
  --   })
  -- print(vim.inspect(filtered))
  -- end

  return S
end

return M
