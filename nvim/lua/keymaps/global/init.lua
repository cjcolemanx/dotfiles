--  NOTE: (to self : ] ) stop trying to map ';{count}'
require("keymaps.global.my-funcs") -- Function Bindings
require("util.termcodes")

local utils = require("keymaps.util").utils("Global", "Personalized Vanilla Behavior/Additions")

local setKey = utils.setKey
local finishKeys = utils.finishKeys

local nr = { remap = false }
local n = nil -- save space : ) [jk cuz lazy]

-- Global settings
vim.g.mapleader = ","

-- Basic editing
setKey("<leader>w", ":w!<CR>", n, n, "Save window") -- Save
setKey("<leader>q", ":q<CR>", n, n, "Close window") -- Exit
setKey("<leader>mw", ":wall<CR>", n, n, "save all windows") -- Save all
setKey("<leader>mq", ":qall<CR>", n, n, "Close all windows") -- Exit all
setKey(">", ">l", { "n", "v" }, n, "Shift right 1 tab") -- Shift right
setKey("<", "<l", { "n", "v" }, n, "Shift left 1 tab") -- Shift left

-- Windows
setKey("<C-h>", "<C-w>h", n, n, "Focus window left") -- Window Navigation ->
setKey("<C-j>", "<C-w>j", n, n, "Focus window down")
setKey("<C-k>", "<C-w>k", n, n, "Focus window up")
setKey("<C-l>", "<C-w>l", n, n, "Focus window right") -- Window Orientation ->
setKey("<C-g>", "<C-W>r", n, n, "Rotate windows (only above/below or sides)")
setKey("RL", ":vertical resize -10<CR>", n, n, "Resize window right") -- Window Resizing ->i
setKey("RH", ":vertical resize +10<CR>", n, n, "Resize window left")
setKey("RJ", ":resize +5<CR>", n, n, "Resize window down")
setKey("RK", ":resize -5<CR>", n, n, "Resize window up")
setKey("<leader>bh", ":new<CR><C-w>r", n, n, "New Split horizontal")
setKey("<leader>bv", ":vnew<CR><C-w>r", n, n, "New Split vertical")

-- Buffers
-- setKey("<leader>k", ":bd<CR>:NvimTreeClose<CR>", n, n, "Close loaded buffer (and NvimTree if open)")
setKey("<leader>;K", ":bd|sp|bn|bd<CR>:NvimTreeClose<CR>", n, n,
  "Close all loaded buffers (and NvimTree if open); keep window")
setKey("<leader>;k", ":bd#|bd#<CR>:NvimTreeClose<CR>", n, n,
  "Close loaded buffer (and NvimTree if open); keep window, but requires at least 2 open buffers")
setKey("<leader>K", ":bnext<CR>:bdelete #<CR>:NvimTreeClose<CR>", n, n,
  "Close current buffer (and NvimTree if open); keep window")
setKey("<leader>k", ":bprevious<CR>:bdelete #<CR>:NvimTreeClose<CR>", n, n,
  "Close current buffer (and NvimTree if open); keep window")
setKey("gp", ":bprevious<CR>", n, n, "Cycle previous buffer in hisory stack")
setKey("gn", ":bnext<CR>", n, n, "Cycle next buffer in hisory stack")

-- Tabs
setKey("ta", ":tabnew<CR>", n, n, "Tab new") -- New Tab
setKey("tq", ":tabclose<CR>", n, n, "Tab close") -- Close Tab
setKey("th", ":tabprev<CR>", n, n, "Tab left") -- Next Tab
setKey("tl", ":tabnext<CR>", n, n, "Tab right") -- Previous Tab
setKey("tk", ":tabprev<CR>", n, n, "Tab left") -- Next Tab
setKey("tj", ":tabnext<CR>", n, n, "Tab right") -- Previous Tab
setKey("tp", ":-tabmove<CR>", n, n, "Tab move left") -- Move [current] tab left
setKey("tn", ":+tabmove<CR>", n, n, "Tab move right") -- Move [current] tab right

-- Less straining page movement
setKey("<C-d>", "<C-d>zz", n, n, "Scroll down and center")
setKey("<C-u>", "<C-u>zz", n, n, "Scroll up and center")
setKey("n", "nzzzv", n, n, "Go to next search highlight and center")
setKey("N", "Nzzzv", n, n, "Go to previous search highlight and center")

-- Join Differently
setKey(";j", "J", n, n, "Join downwards")

-- Neovim status
setKey("<F1>", ":mess<cr>", n, n, "View messages")
setKey("<F2>", ":checkhealth<cr>", n, n, "View plugin health")


-- Fix completion behavior
setKey("<c-j>", "", "i", nr, "UTIL: fix behavior in completion")
setKey("<c-h>", "", "i", nr, "UTIL: fix behavior in completion")

-- Formatting and view
setKey("<C-.>", "", n, n, "DISABLED")
setKey("<C-p>", "", "i", n, "DISABLED: Insert")

-- Search + replace
setKey("<Space>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], n, nr,
  "Search and replace instances of word under cursor")
setKey("<Space>/", "/<C-r><C-w><CR>", n, nr, "Quick jump to next instance of word under cursor")

-- Leave terminal mode w/ Esc
setKey("<Esc>", "<C-\\><C-n>", "t", n, "Leave terminal mode")

--> | Et Cetera... | <--

-- Automatically disable search highlight on every key press
-- Checks to see if you pressed "n" in NORMAL mode
-- Stops highlighting if you didn't
local function toggle_hlsearch(char)
  if vim.fn.mode() == "n" then
    local keys = { "<CR>", "n", "N", "*", "#", "?", "/" }
    local new_hlsearch = vim.tbl_contains(keys, vim.fn.keytrans(char))

    if vim.opt.hlsearch:get() ~= new_hlsearch then
      vim.opt.hlsearch = new_hlsearch
    end
  end
end

local ns = vim.api.nvim_create_namespace("toggle_hlsearch")

vim.on_key(toggle_hlsearch, ns)

-----------------------

--> | SESSIONS | <--
-- NOTE: the following assume your pwd is the root directory of a project
-- To ensure no accidental creations, "mks!" won't automatically fire - you
-- have a chance to edit the session name or cancel the operation.

-- Create a session in the project directory
setKey("<leader>ms", ":mks! .nvim/session.vim", n, n, "Create a session file: `$pwd/.nvim/session.vim`")

-- Create sesh.sh script for quick reloading
setKey(
  "<leader>mb",
  ":! touch sesh.sh ; '\\#! /usr/bin/sh\\n' >> sesh.sh ; 'nvim -s .nvim/session.vim' >> sesh.sh",
  n, n, "Create a session script: `$pwd/sesh.sh` (use in conjuncture with `mks!` command)"
)

-- Load a session from the project directory
setKey("<leader>ls", ":source .nvim/session.vim<CR>", n, n, "Load session from `$pwd/.nvim/session.vim`")

-----------------------

-- Change directory for current buffer
setKey(
  ";;c",
  function()
    vim.cmd({ cmd = "lcd", args = { "%:h" } })
    print("Changed local cd")
  end,
  nil,
  { silent = false },
  "Change local directory"
)

setKey("<Space>x", "<CMD>!chmod +x %<CR>", n, n, "LINUX: make current file executable")

-----------------------

-- Jump into a brace (doesn't enter insert .. just in case)
local function tab_into_brace(char)
  local cr = TERMCODES.CR
  -- Find char
  vim.api.nvim_feedkeys("/" .. char .. cr, "n", false)
  -- Go right one
  vim.cmd("normal! l")
end

setKey("<Space>[", function() tab_into_brace("[") end, n, n, "Tab into '['")
setKey("<Space>{", function() tab_into_brace("{") end, n, n, "Tab into '{'")
setKey("<Space>(", function() tab_into_brace("(") end, n, n, "Tab into '('")
setKey("<Space>`", function() tab_into_brace("`") end, n, n, "Tab into '`'")
setKey("<Space>'", function() tab_into_brace("'") end, n, n, "Tab into \"'\"")
setKey('<Space>"', function() tab_into_brace('"') end, n, n, "Tab into '\"'")

-----------------------

--> | NVIM/CONFIG Debugging | <--
-- NOTE: prolly wanna remove this
-- setKey(
--   "i",
--   ";d;b;buf",
--   function()
--     vim.inspect(vim.b)
--   end,
--   s
-- )

finishKeys()
