local M = {}

local utils = require("functions.util").utils("Search/Replace Functions")

local createFunc = utils.createFunc
local finishFuncs = utils.finishFuncs

-- --> Generic
----------------------------------------

-- swap a camelCase word to a snake_case word
local function camel_to_snake(text)
  -- Regex replace and make lowercase where appropriate
  local snake_case_text = string.gsub(text, "(%u)", function(s)
    return "_" .. string.lower(s)
  end)

  return snake_case_text
end

-- swap a snake_case word to a camelCase word
local function snake_to_camel(text)
  local new_text = ""

  local capitalize_next = false -- switch for first character after _

  -- iterate string (i'm not know enough about lua regex yet)
  for c in string.gmatch(text, ".") do
    if (c == "_") then
      capitalize_next = true -- Flip value
    else
      if capitalize_next then
        -- This char is 1st after _
        new_text = new_text .. c:gsub("^%l", string.upper)

        capitalize_next = false -- Reset value
      else
        -- Intermediate char
        new_text = new_text .. c
      end
    end
  end

  return new_text
end

-- Replace a word in range (accepts a count)
local function replace_in_line_range(direction)
  local word = vim.call("expand", "<cword>")
  local count

  -- make sure the line offset is correctly calculated
  if (vim.v.count == 0) then
    count = 1 -- one line, even if same - offset handled below
  else
    count = vim.v.count
  end

  local cur_pos = vim.api.nvim_win_get_cursor(0)
  local start_line
  local end_line

  if (direction == "down") then
    start_line = cur_pos[1]
    end_line = start_line + count - 1 -- use offset
  else
    end_line = cur_pos[1]
    start_line = end_line - count + 1 -- use offset
  end

  local command = ":" .. start_line .. "," .. end_line .. "s/" .. word .. "//g"

  require("util.termcodes")

  local left = TERMCODES.LEFT

  -- Send keys
  vim.api.nvim_feedkeys(command .. left .. left, "n", false)
end

-- --> Exportable
----------------------------------------

-- WORD swap between camelCase and snake_case
local function switch_name_casing_word()
  local text = vim.call('expand', '<cword>')
  local is_snake = string.match(text, "_")

  local new_word

  if (is_snake == nil) then
    new_word = camel_to_snake(text)
  else
    new_word = snake_to_camel(text)
  end
  vim.cmd("normal! ciw" .. new_word)
end

M.switch_name_casing_word = switch_name_casing_word
createFunc("switch_name_casing_word", "Word: Swap between camelCase and snake_case")

-- LINE swap between camelCase and snake_case
local function switch_name_casing_line()
  local text = vim.call('getline', '.')
  local is_snake = string.match(text, "_")

  local new_line

  if (is_snake == nil) then
    new_line = camel_to_snake(text)
  else
    new_line = snake_to_camel(text)
  end
  vim.cmd("normal! 0C" .. new_line)
end

M.switch_name_casing_line = switch_name_casing_line
createFunc("switch_name_casing_line", "Line: Swap between camelCase and snake_case")

-- WORD swap a true to a false
local function switch_boolean_word()
  local text = vim.call('expand', '<cword>')

  if (text == "true") then
    vim.cmd("normal! ciw" .. "false")
  elseif (text == "false") then
    vim.cmd("normal! ciw" .. "true")
  end
end

M.switch_boolean_word = switch_boolean_word
createFunc("switch_boolean_word", "Word: Swap between true and false")

-- LINE swap a true to a false
local function switch_boolean_line()
  local text = vim.call('getline', '.')
  local has_true = string.match(text, "true")

  local new_line

  if (has_true == nil) then
    -- has a false
    new_line = string.gsub(text, "false", "true")
  else
    -- has a true
    new_line = string.gsub(text, "true", "false")
  end

  vim.cmd("normal! 0C" .. new_line)
end

M.switch_boolean_line = switch_boolean_line
createFunc("switch_boolean_line", "Line: Swap between true and false")

-- WORD swap a _ to a -
local function switch_underscore_dash_word()
  local text = vim.call('expand', '<cWORD>')
  local is_underscore = string.match(text, "_")

  local new_text

  if (is_underscore == nil) then
    -- sub a '-'
    new_text = string.gsub(text, "-", "_")
  else
    -- sub a '_'
    new_text = string.gsub(text, "_", "-")
  end

  vim.cmd("normal! ciW" .. new_text)
end

M.switch_underscore_dash_word = switch_underscore_dash_word
createFunc("switch_underscore_dash_word", "Word: Swap between - and _")

-- Line swap a _ to a -
local function switch_underscore_dash_line()
  local text = vim.call('getline', '.')
  local is_underscore = string.match(text, "_")

  local new_text

  if (is_underscore == nil) then
    -- sub a '-'
    new_text = string.gsub(text, "-", "_")
  else
    -- sub a '_'
    new_text = string.gsub(text, "_", "-")
  end

  vim.cmd("normal! 0C" .. new_text)
end

M.switch_underscore_dash_line = switch_underscore_dash_line
createFunc("switch_underscore_dash_line", "Line: Swap between - and _")

-- Replace in range
local function replace_in_range_down() replace_in_line_range("down") end
local function replace_in_range_up() replace_in_line_range("up") end

M.replace_in_range_down = replace_in_range_down
createFunc("replace_in_range_down", "TODO")

M.replace_in_range_up = replace_in_range_up
createFunc("replace_in_range_up", "TODO")

finishFuncs()

return M
