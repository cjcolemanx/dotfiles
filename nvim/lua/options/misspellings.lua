require "util.type-checks"

local misspelt_words = {}

local function add_to_misspell_table(bad_word, word)
  if (IsTable(bad_word)) then
    for _, v in ipairs(bad_word) do
      local entry = {
        correct = word,
        wrong = v
      }
      table.insert(misspelt_words, entry)
    end
  else
    local entry = {
      correct = word,
      wrong = bad_word
    }

    table.insert(misspelt_words, entry)
  end
end

local function add_misspellings_to_insert_abbreviations()
  for _, v in ipairs(misspelt_words) do
    if (IsTable(v)) then
      for _k, _ in ipairs(v) do
        vim.cmd("iab" .. " " .. v.wrong[_k] .. " " .. v.correct)
      end
    else
      vim.cmd("iab" .. " " .. v.wrong .. " " .. v.correct)
    end
  end
end

local M = {}

function M.setup_misspellings()
  -- NOTE: a lot of these are simply due to my own incompetence
  --  ((and a slightly broken keyboard))

  -- keebord
  add_to_misspell_table({ "ffunctino", "ffunction", "functino", }, "function")
  add_to_misspell_table({ "reqiuire", "reuqire", }, "require")
  add_to_misspell_table({ "usally", "usualy", }, "usually")

  add_to_misspell_table("endd", "end")
  add_to_misspell_table("andd", "and")
  add_to_misspell_table("addd", "add")
  add_to_misspell_table("ffind", "find")
  add_to_misspell_table("teh", "the")
  add_to_misspell_table("selectino", "selection")
  add_to_misspell_table("visable", "visible")
  add_to_misspell_table("tendancy", "tendency")
  add_to_misspell_table("waht", "what")
  add_to_misspell_table("wihch", "which")
  add_to_misspell_table("wiht", "with")

  -- Call Last
  add_misspellings_to_insert_abbreviations()
end

return M
