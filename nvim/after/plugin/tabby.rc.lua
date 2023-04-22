local status, tabby = pcall(require, "tabby.tabline")

if not status then
  -- print("ERROR: plugin 'tabby.nvim' is unavailable")
  return
end

local theme = {
  fill = "TabLineFill",
  -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
  head = "TabLine",
  current_tab = "TabLineSel",
  tab = "TabLine",
  win = "TabLine",
  tail = "TabLine",
}

-- require("tabby.tabline").use_preset("active_wins_at_tail", {
require("tabby.tabline").use_preset("active_tab_with_wins", {
  theme = {
    fill = "TabLineFill",       -- tabline background
    head = "TabLine",           -- head element highlight
    current_tab = "TabLineSel", -- current tab label highlight
    tab = "TabLine",            -- other tab label highlight
    win = "TabLine",            -- window highlight
    tail = "TabLine",           -- tail element highlight
  },
  nerdfont = true,              -- whether use nerdfont
  tab_name = {
    name_fallback = function(tabid)
      return ""
    end
  },
  buf_name = {
    mode = 'tail',
  },
})

-- tabby.use_preset("active_wins_at_tail", {
--   theme = theme,
--   nerdfont = true,
--   tab_name = {
--     name_fallback = "function({tabid}), return a string",
--   },
--   buf_name = {
--     mode = "'unique'|'relative'|'tail'|'shorten'",
--   },
-- })
-- tabby.set(function(line)
--   return {
--     {
--       { "  ", hl = theme.head },
--       line.sep("", theme.head, theme.fill),
--     },
--     line.tabs().foreach(function(tab)
--       local hl = tab.is_current() and theme.current_tab or theme.tab
--       return {
--         line.sep("", hl, theme.fill),
--         tab.is_current() and "" or "",
--         tab.number(),
--         tab.name(),
--         tab.close_btn(""),
--         line.sep("", hl, theme.fill),
--         hl = hl,
--         margin = " ",
--       }
--     end),
--     line.spacer(),
--     line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
--       return {
--         line.sep("", theme.win, theme.fill),
--         win.is_current() and "" or "",
--         win.buf_name(),
--         line.sep("", theme.win, theme.fill),
--         hl = theme.win,
--         margin = " ",
--       }
--     end),
--     {
--       line.sep("", theme.tail, theme.fill),
--       { "  ", hl = theme.tail },
--     },
--     hl = theme.fill,
--   }
-- end)
