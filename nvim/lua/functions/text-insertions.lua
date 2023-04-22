local M = {}

local utils = require("functions.util").utils("Text Insertion Functions")

local createFunc = utils.createFunc
local finishFuncs = utils.finishFuncs

-- --> Generic
----------------------------------------

local function get_insert_command(insert_type)
  local command
  if (insert_type == "append") then
    command = "normal! A"
  elseif (insert_type == "prepend") then
    command = "normal! 0i"
  elseif (insert_type == "append_file") then
    command = "normal! Go"
  elseif (insert_type == "prepend_file") then
    command = "normal! ggO"
  end
  return command
end

-- --> Exportable
----------------------------------------

-- Add file name or path to line
local function insert_file_info(insert_type, info_type)
  local command = get_insert_command(insert_type)
  local info

  if (info_type == "name") then
    info = vim.call("expand", "%:t")
  elseif (info_type == "path") then
    info = vim.call("expand", "%:p%:h")
  end

  vim.cmd(command .. info)
end

M.insert_file_info = insert_file_info

createFunc("insert_file_info", "Text: Insert file info")

finishFuncs()

return M
