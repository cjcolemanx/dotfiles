local M = {}

FUNCTIONS = {}
local default_func_desc = "~ TODO ~"
local default_group_desc = "TODO: Group Description"

M.utils = function(group_name)
  local S = {}

  local group = {
    itemgroup = group_name,
    description = default_group_desc,
    funcs = {},
  }

  local function docFunc(func, desc)
    table.insert(group.funcs, { func, desc })
  end

  function S.createFunc(func, desc)
    if (desc == nil) then desc = default_func_desc end
    docFunc(func, desc)
  end

  function S.finishFuncs()
    table.insert(FUNCTIONS, group)
  end

  return S
end

M.getFuncs = function() return FUNCTIONS end
M.printFuncs = function() print(vim.inspect(FUNCTIONS)) end

return M
