local replace_funcs = require("functions.search-and-replace")
local text_funcs = require("functions.text-insertions")

local utils = require("keymaps.util").utils("My Functions", "'I Did This'")

local setKey = utils.setKey
local finishKeys = utils.finishKeys

-- --> Replace
----------------------------------------

-- [t] is for "text"
setKey("<space>tt", replace_funcs.switch_boolean_word, "n", nil, "Switch between true or false in word")
setKey("<space>Tt", replace_funcs.switch_boolean_line, "n", nil, "Switch between true or false in line")
setKey("<space>tc", replace_funcs.switch_name_casing_word, "n", nil, "Switch between camelCase or snake_case in word")
setKey("<space>Tc", replace_funcs.switch_name_casing_line, "n", nil, "Switch between camelCase or snake_case in line")
setKey("<space>t-", replace_funcs.switch_underscore_dash_word, "n", nil, "Switch between true or false in word")
setKey("<space>T-", replace_funcs.switch_underscore_dash_line, "n", nil, "Switch between true or false in line")

-- Quick replace in a range
setKey("<space>c", replace_funcs.replace_in_range_down, "n", nil,
  "replace {count} previous occurances in range (default 1 line)"
)
setKey("<space>C", replace_funcs.replace_in_range_up, "n", nil,
  "replace {count} next occurances in range (default 1 line)"
)

-- --> Text Insertion
----------------------------------------

-- NOTE: may swap the following for a Telescope-based append/prepend w/ i and I
--    could also integrate snippets (maybe, probably not worth)

-- [i] is for "insert text" (duh)
-- But 4 real these are good for pasting hard data into a file
setKey("<leader>if", function() text_funcs.insert_file_info("append", "name") end, "n", nil, "Insert file name at EOL")
setKey("<leader>If", function() text_funcs.insert_file_info("prepend", "name") end, "n", nil, "Insert file name at BOL")
setKey("<leader>iF", function() text_funcs.insert_file_info("append_file", "name") end, "n", nil, "Insert file name EOF")
setKey("<leader>IF", function() text_funcs.insert_file_info("prepend_file", "name") end, "n", nil, "Insert file name BOF")
setKey("<leader>ip", function() text_funcs.insert_file_info("append", "path") end, "n", nil, "Insert file path EOL")
setKey("<leader>Ip", function() text_funcs.insert_file_info("prepend", "path") end, "n", nil, "Insert file path BOL")
setKey("<leader>iP", function() text_funcs.insert_file_info("append_file", "path") end, "n", nil, "Insert file path EOf")
setKey("<leader>IP", function() text_funcs.insert_file_info("prepend_file", "path") end, "n", nil, "Insert file path BOF")


finishKeys()
