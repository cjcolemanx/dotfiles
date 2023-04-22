local M = {}

local snr = { silent = true, noremap = true }

KEYMAPS = {}

local default_key_mode = "n"
local default_key_opts = snr
local default_key_desc = "    ~ TODO ~"
local default_group_desc = "    TODO: Group Description"
local group_sep = "> "
local map_sep = "| "
local contextual_prefix = "(CTX): "

-- Utilities for keymapping with Legendary
M.utils = function(plug_name, plug_desc, plug_icon)
  local S = {}
  local group = {
    itemgroup = plug_name,
    description = group_sep .. default_group_desc,
    keymaps = {},
    commands = {},
    funcs = {},
  }

  -- Add group description
  if (plug_desc ~= nil) then
    group.description = group_sep .. plug_desc
  end

  -- Add groupt icon
  if (plug_icon ~= nil) then
    group.icon = plug_icon
  end

  -- Insert into global table
  local docKey = function(bind, mode, opts, desc)
    table.insert(group.keymaps, { bind, description = map_sep .. desc, opts = opts, mode = mode })
  end

  -- Create keybind. Auto-documents.
  S.setKey = function(bind, action, mode, opts, desc, make_context_doc)
    if (mode == nil) then mode = default_key_mode end
    if (opts == nil) then opts = default_key_opts end
    if (desc == nil) then desc = default_key_desc end
    if (make_context_doc == true) then
      docKey(bind, mode, opts, contextual_prefix .. desc)
    else
      vim.keymap.set(mode, bind, action, opts)
      docKey(bind, mode, opts, desc)
    end
  end

  -- Call after all binds are complete, puts keys into global table
  S.finishKeys = function()
    -- Note number of keys
    local num_binds = #group.keymaps
    group.itemgroup = group.itemgroup .. " (" .. num_binds .. " binds)"
    table.insert(KEYMAPS, group)

  end

  return S
end

M.getMaps = function() return KEYMAPS end
M.printMaps = function() print(vim.inspect(KEYMAPS)) end

return M
