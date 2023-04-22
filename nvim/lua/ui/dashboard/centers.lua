local M = {}

M.hyper_centers = {}

M.doom_centers = {
  {
    icon = "  ",
    desc = "Open a new buffer                         ",
    action = ":enew",
    key = "n",
    -- keymap = "n",
    keymap = "",
  },
  -- {
  --   icon = "  ",
  --   desc = "Create a New File                         ",
  --   action = "DashboardNewFile",
  --   key = "N",
  --   --   keymap = "N",
  --   keymap = "",
  -- },
  {
    icon = "  ",
    desc = "File Browser                              ",
    action = "Telescope file_browser",
    key = ";f",
    -- keymap = "; f",
    keymap = "",
  },
  {
    icon = "  ",
    desc = "Telescope sessions                        ",
    key = ";s",
    -- keymap = "; s",
    keymap = "",
    action = function()
      require("ui.pickers.session-picker").open()
    end,
  },
  {
    icon = "  ",
    desc = "Update Neovim Plugins                     ",
    action = "PackerUpdate",
    key = "u",
    -- keymap = "u",
    keymap = "",
  },
  {
    icon = "  ",
    desc = "Compile Plugins                           ",
    action = "PackerCompile",
    key = "c",
    -- keymap = "c",
    keymap = "",
  },
  {
    icon = "  ",
    desc = "Open dotfiles                             ",
    action = function()
      vim.cmd("NvimTreeClose")
      vim.cmd("lcd ~/.config")
      vim.cmd("e updates.md")
      vim.cmd("lcd %:h")
    end,
    key = ";d",
    -- keymap = "; d",
    keymap = "",
  },
  {
    icon = "  ",
    desc = "Edit Nvim Config                          ",
    action = function()
      vim.cmd("NvimTreeClose")
      vim.cmd("lcd ~/.config/nvim")
      vim.cmd("e init.lua")
      vim.cmd("lcd %:h")
    end,
    key = ";g",
    -- keymap = "; g",
    keymap = "",
  },
  {
    icon = "  ",
    desc = "Edit Snippets                             ",
    action = function()
      vim.cmd("NvimTreeClose")
      vim.cmd("lcd ~/.config/nvim/snippets")
      vim.cmd("e all.lua")
      vim.cmd("lcd %:h")
    end,
    key = ";t",
    -- keymap = "; t",
    keymap = "",
  },
  -- {
  --   icon = "  ",
  --   desc = "See The Planets                          ",
  --   key = " ;p",
  --   -- keymap = "; p",
  --   keymap = "",
  --   action = function()
  --     require("telescope.builtin").planets()
  --   end,
  -- },
  {
    icon = "  ",
    desc = "Quit                                ",
    -- action = "Telescope dotfiles path=~/.config",
    action = "q!",
    key = "q",
    -- keymap = "q",
    keymap = "",
  },
}

return M
