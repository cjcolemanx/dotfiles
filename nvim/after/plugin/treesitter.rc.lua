local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then return end

local maps = require("keymaps.plugin.treesitter").keys
local t_o_maps = maps.textobjects

ts.setup({
  auto_install = true,
  autotag = {
    enable = true,
  },
  ensure_installed = {
    -- "angular",
    "bash",
    "c_sharp",
    "comment",
    "c",
    "cpp",
    "css",
    "fish",
    -- "gdresource",
    "gdscript",
    "gitignore",
    "graphql",
    "help", -- vim help files
    "html",
    "http",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "latex",
    "lua",
    "luadoc",
    "markdown",
    "markdown_inline",
    "php",
    "python",
    "regex",
    "rust",
    "sql",
    "scss",
    "sxhkdrc",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "yaml",
    -- "swift",
  },
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  incremental_selection = {
    enable = true,
    keymaps = maps.incremental_selection,
  },
  matchup = {
    enable = true,
  },
  sync_install = true,
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = t_o_maps.select,
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = t_o_maps.move.goto_next_start,
      goto_next_end = t_o_maps.move.goto_next_end,
      goto_previous_start = t_o_maps.move.goto_previous_start,
      goto_previous_end = t_o_maps.move.goto_previous_end,
    },
  },
  swap = {
    enable = true,
    swap_next = maps.swap.next,
    swap_previous = maps.swap.previous,
  },
  -- Nvim-TS-Rainbow
  rainbow = {
    enable = true,
    disable = {},          -- list of languages to disable highlighting for
    extendend_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table
    max_file_lines = nil,  -- Do not enable for files with more than n lines
    -- colors = {},
    -- termcolors = {},
  },
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

-- NOTE: using DoGe now
-- require "nvim-treesitter.configs".setup {
--   tree_docs = { enable = true }
-- }

require("keymaps.plugin.treesitter").doc_keys()
