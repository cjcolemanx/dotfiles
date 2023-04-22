local M = {}

local utils = require("keymaps.util").utils("NvimTree")

local setKey = utils.setKey
local finishKeys = utils.finishKeys

function M.binds()
  setKey("<Space><Space>", ":NvimTreeToggle<CR>", { "n", "x" }, nil, "Toggle NvimTree")
  finishKeys()
end

--
-- This function has been generated from your
--   view.mappings.list
--   view.mappings.custom_only
--   remove_keymaps
--
-- You should add this function to your configuration and set on_attach = on_attach in the nvim-tree setup call.
--
-- Although care was taken to ensure correctness and completeness, your review is required.
--
-- Please check for the following issues in auto generated content:
--   "Mappings removed" is as you expect
--   "Mappings migrated" are correct
--
-- Please see https://github.com/nvim-tree/nvim-tree.lua/wiki/Migrating-To-on_attach for assistance in migrating.
function M.on_attach(bufnr, is_context)
  local api = require('nvim-tree.api')
  local helpers = require "plugin.util.nvim-tree"

  -- safety for documenting dynamic binds
  -- gets around the fact that these are only set when the nvim buffer is open
  if (is_context == nil) then is_context = false end

  local function opts(desc)
    if is_context then return nil end
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Default mappings. Feel free to modify or remove as you wish.
  setKey('<C-]>', api.tree.change_root_to_node, nil, opts('CD'), "CD", is_context)
  setKey('<C-e>', api.node.open.replace_tree_buffer, nil, opts('Open: In Place'), "Open in place", is_context)
  setKey('<C-k>', api.node.show_info_popup, nil, opts('Info'), "Show Info", is_context)
  setKey('<C-r>', api.fs.rename_sub, nil, opts('Rename: Omit Filename'), "Rename (with path)", is_context)
  setKey('<C-t>', api.node.open.tab, nil, opts('Open: New Tab'), "Open in tab", is_context)
  setKey('<C-x>', api.node.open.horizontal, nil, opts('Open: Horizontal Split'), "Open in horizontal split", is_context)
  setKey('<BS>', api.node.navigate.parent_close, nil, opts('Close Directory'), "Close directory", is_context)
  setKey('<CR>', api.node.open.edit, nil, opts('Open'), "Open file", is_context)
  setKey('<Tab>', api.node.open.preview, nil, opts('Open Preview'), "Preview file", is_context)
  setKey('>', api.node.navigate.sibling.next, nil, opts('Next Sibling'), "First in folder", is_context)
  setKey('<', api.node.navigate.sibling.prev, nil, opts('Previous Sibling'), "Last in folder", is_context)
  setKey('.', api.node.run.cmd, nil, opts('Run Command'), "Run command", is_context)
  setKey('-', api.tree.change_root_to_parent, nil, opts('Up'), "cd ..", is_context)
  setKey('a', api.fs.create, nil, opts('Create'), "New file", is_context)
  setKey('B', api.tree.toggle_no_buffer_filter, nil, opts('Toggle No Buffer'), "Toggle no buffer filter", is_context)
  setKey('c', api.fs.copy.node, nil, opts('Copy'), "copy", is_context)
  setKey('C', api.tree.toggle_git_clean_filter, nil, opts('Toggle Git Clean'), "Toggle git clean", is_context)
  setKey('[c', api.node.navigate.git.prev, nil, opts('Prev Git'), "Previous Git", is_context)
  setKey(']c', api.node.navigate.git.next, nil, opts('Next Git'), "Next Git", is_context)
  setKey('d', api.fs.remove, nil, opts('Delete'), "Delete", is_context)
  setKey('D', api.fs.trash, nil, opts('Trash'), "Trash", is_context)
  setKey('E', api.tree.expand_all, nil, opts('Expand All'), "Expand all", is_context)
  setKey('e', api.fs.rename_basename, nil, opts('Rename: Basename'), "Rename (basename)", is_context)
  setKey(']e', api.node.navigate.diagnostics.next, nil, opts('Next Diagnostic'), "Next diagnostic", is_context)
  setKey('[e', api.node.navigate.diagnostics.prev, nil, opts('Prev Diagnostic'), "Previous diagnostic", is_context)
  setKey('F', api.live_filter.clear, nil, opts('Clean Filter'), "Clear Filter", is_context)
  setKey('f', api.live_filter.start, nil, opts('Filter'), "Filter", is_context)
  setKey('g?', api.tree.toggle_help, nil, opts('Help'), "Toggle help", is_context)
  setKey('gy', api.fs.copy.absolute_path, nil, opts('Copy Absolute Path'), "Copy path (absolute)", is_context)
  setKey('H', api.tree.toggle_hidden_filter, nil, opts('Toggle Dotfiles'), "Toggle Dotfiles", is_context)
  setKey('I', api.tree.toggle_gitignore_filter, nil, opts('Toggle Git Ignore'), "Toggle git ignore filter", is_context)
  setKey('o', api.node.open.edit, nil, opts('Open'), "Open (pick)", is_context)
  setKey('O', api.node.open.no_window_picker, nil, opts('Open: No Window Picker'), "Open (auto)", is_context)
  setKey('p', api.fs.paste, nil, opts('Paste'), "Paste", is_context)
  setKey('P', api.node.navigate.parent, nil, opts('Parent Directory'), "CD ..", is_context)
  setKey('q', api.tree.close, nil, opts('Close'), "Close tree", is_context)
  setKey('<esc>', api.tree.close, nil, opts('Close'), "Close tree", is_context)
  setKey('r', api.fs.rename, nil, opts('Rename'), "Rename file (w/extension)", is_context)
  setKey('R', api.tree.reload, nil, opts('Refresh'), "Refresh tree", is_context)
  setKey('S', api.tree.search_node, nil, opts('Search'), "Search files", is_context)
  setKey('U', api.tree.toggle_custom_filter, nil, opts('Toggle Hidden'), "Toggle hiddden", is_context)
  setKey('W', api.tree.collapse_all, nil, opts('Collapse'), "Collapse all folders", is_context)
  setKey('x', api.fs.cut, nil, opts('Cut'), "Cut (move)", is_context)
  setKey('y', api.fs.copy.filename, nil, opts('Copy Name'), "Copy name", is_context)
  setKey('Y', api.fs.copy.relative_path, nil, opts('Copy Relative Path'), "Copy Path (relative)", is_context)
  setKey('<2-LeftMouse>', api.node.open.edit, nil, opts('Open'), "Open", is_context)
  setKey('<2-RightMouse>', api.tree.change_root_to_node, nil, opts('CD'), "CD", is_context)
  setKey(']s', api.node.navigate.sibling.last, nil, opts('Last Sibling'), "Last in folder", is_context)
  setKey('[s', api.node.navigate.sibling.first, nil, opts('First Sibling'), "First in folder", is_context)
  setKey('<leader>t', api.node.open.tab, nil, opts('Open: New Tab'), "Open in tab", is_context)
  setKey('T', api.node.open.tab, nil, opts('Open: New Tab'), "Open in tab", is_context)
  setKey('s', api.node.open.vertical, nil, opts('Open: Vertical Split'), "Opin in vertical split", is_context)
  setKey('o', api.node.open.edit, nil, opts('Open'), "open", is_context)
  setKey('L', api.node.open.vertical, nil, opts('Open: Vertical Split'), "Open in vertical split", is_context)
  setKey('mm', api.marks.toggle, nil, opts('Toggle Bookmark'), "Toggle Bookmark", is_context)
  setKey('mv', api.marks.bulk.move, nil, opts('Move Bookmarked'), "Move Bookmarked", is_context)
  setKey('>', api.node.open.horizontal, nil, opts('Open: Horizontal Split'), "Open in horizontal split", is_context)
  setKey('O',
    function()
      api.tree.change_root_to_node()
      vim.api.nvim_feedkeys("ggj", "nx", false)
    end,
    nil,
    opts('CD'),
    "CD and return to top",
    is_context
  )
  setKey('l', function()
    local node = api.tree.get_node_under_cursor()
    -- your code goes here
    helpers.expand_folder(node)
  end,
    nil,
    opts('open folder'),
    "Open folder",
    is_context
  )
  setKey('ga', function()
    local node = api.tree.get_node_under_cursor()
    -- your code goes here
    helpers.git_add(node)
  end,
    nil,
    opts('git_add'),
    "Git add",
    is_context
  )
  setKey('<C-r>', function()
    local node = api.tree.get_node_under_cursor()
    helpers.run_script_under_cursor(node)
  end,
    nil,
    opts('run script under cursor'),
    "Run script shell under cursor (.sh)",
    is_context
  )
  -- setKey('n', 'R', function()
  --   local node = api.tree.get_node_under_cursor()
  --   -- your code goes here
  -- end, opts('no description'))


  -- -- MY MAPPINGS

  -- -- Custom
  -- setKey("n", "s", helpers.split_right)
  -- setKey("n", "o", api.node.open.vertical)
  -- setKey("n", "L", helpers.split_right_and_refocus)
  -- -- setKey('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))
  -- setKey("n", ">", helpers.split_below_and_refocus)
  -- setKey("n", "ga", helpers.git_add)
  -- setKey("n", "F", helpers.launch_find_files)
  -- setKey("n", ";g", helpers.launch_live_grep)

  -- API
  -- setKey("n", "R", api.tree.reload)
  setKey("<leader>g", api.tree.toggle_gitignore_filter, nil, nil, "Toggle .gitignore filter", is_context)
  setKey("?", api.node.show_info_popup, nil, nil, "Show file info", is_context)
  -- -- END_MY_MAPPINGS
end

function M.doc_context()
  M.on_attach(0, true)
end

return M
