local status, lualine = pcall(require, "lualine")
if not status then
  return
end

local theme = require("ui.statusline.themes").theme

--- @param trunc_width number trunctates component when screen width is less then trunc_width
--- @param trunc_len number truncates component to trunc_len number of chars
--- @param hide_width number hides component when window width is smaller then hide_width
--- @param no_ellipsis boolean whether to disable adding '...' at end after truncation
--- return function that can format the component accordingly
local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
  return function(str)
    local win_width = vim.fn.winwidth(0)
    if hide_width and win_width < hide_width then
      return ''
    elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
      return str:sub(1, trunc_len) .. (no_ellipsis and '' or '...')
    end
    return str
  end
end

local config = {
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = {
      {
        "mode",
        drawEmpty = true,
        fmt = trunc(80, 4, 0, true),
        separator = "",
      },
      {
        "buffers",
        mode = 2,
        show_filename_only = true,
        hide_filename_extension = true,
        show_modifiedd_status = true,
        use_mode_colors = true,
        max_length = vim.o.columns * 2 / 3,
        drawEmpty = false,
      },
    },
    lualine_b = { "branch" },
    lualine_c = {},
    lualine_x = {
      "encoding",
      "filetype",
      {
        "fileformat",
        symbols = {
          unix = "",
          dos = "",
          mac = "",
        },
      },
    },
    lualine_y = { "progress" },
    lualine_z = {
      "location",
      {
        "searchcount",
        maxcount = 999,
        timeout = 500,
        drawEmpty = false
      },
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
      },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {
      {
        "buffers",
        mode = 2,
        show_filename_only = true,
        hide_filename_extension = true,
        show_modifiedd_status = true,
        use_mode_colors = true,
        max_length = vim.o.columns * 2 / 3,
        drawEmpty = false,
      },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
      },
    },
    lualine_z = { "location" },
  },
  winbar = {},
  extensions = { "nvim-tree", "fugitive", "lazy", "trouble", "nvim-dap-ui" },
}

lualine.setup(config)
