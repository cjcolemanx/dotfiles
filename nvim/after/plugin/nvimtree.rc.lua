local status, nvimTree = pcall(require, "nvim-tree")
if not status then return end

local keys = require "keymaps.plugin.nvim-tree"

nvimTree.setup({
  -- open_on_setup = false, -- open when you open nvim in a directory (but no specific file)
  -- ignore_buffer_on_setup = true,
  -- ignore_ft_on_setup = {
  --   "gitcommit",
  -- },
  respect_buf_cwd = true,
  diagnostics = { enable = true },
  view = {
    side = "right",
    number = true,
    relativenumber = true,
    signcolumn = "yes",
    adaptive_size = true, -- fit filename
    -- mappings = require("keymaps.plugin.nvim-tree").keymap(api, helpers)
  },
  renderer = {
    highlight_opened_files = "all",
    indent_markers = { enable = true },
  },
  actions = {
    change_dir = {
      enable = true,
      global = true,
    },
    open_file = {
      quit_on_open = false,
      window_picker = {
        chars = "ASDFJKL;",
      },
    },
  },
  filters = {},         -- TODO: add filters
  disable_netrw = true, -- Fix race conditions w/ netrw
  tab = {
    sync = {
      open = true,
      close = true,
    },
  },
  notify = {
    threshold = 3,
  },
  trash = {
    require_confirm = true,
  },
  on_attach = keys.on_attach
})

-- Setup Keybinds
keys.binds()
keys.doc_context()
