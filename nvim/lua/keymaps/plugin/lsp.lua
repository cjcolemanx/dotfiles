local M = {}

local utils = require("keymaps.util").utils("LSP", "Builtin LSP and Saga binds")

if not utils then return end

local setKey = utils.setKey
local finishKeys = utils.finishKeys

function M.keys(bmap, bnmap, buf_set_keymap, opts)
  -- Insert Mode
  setKey("<C-m>", "<cmd>Lspsaga peek_definition<CR>", "i", opts)
  -- setKey("i", "<C-m>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

  -- Built-in
  bmap("n", "gd", vim.lsp.buf.definition)
  bmap("n", "gI", vim.lsp.buf.implementation)
  bmap("n", "gt", vim.lsp.buf.type_definition)
  bmap("n", "gr", "<CMD>Telescope lsp_references<CR>")
  bmap("n", "<Leader>ds", "<CMD>Telescope lsp_document_symbols<CR>")
  bmap("n", "<Leader>ws", "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>")
  -- bmap("n", "gr", require("telescope.builtin").lsp_references)
  -- bmap("n", "<Leader>ds", require("telescope.builtin").lsp_document_symbols)
  -- bmap("n", "<Leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols)

  -- LSP Saga
  bnmap(";d", "<Cmd>Lspsaga peek_definition<CR>")
  bnmap(";k", "<Cmd>Lspsaga hover_doc<CR>")
  bnmap(";t", "<cmd>Lspsaga outline<CR>")
  bnmap(";r", "<cmd>Lspsaga rename<CR>")
  bnmap(";a", "<cmd>Lspsaga code_action<CR>")
  bnmap(";go", "<cmd>Lspsaga show_line_diagnostics<CR>")
  bnmap(";gn", "<cmd>Lspsaga diagnostic_jump_next<CR>")
  bnmap(";gp", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
  -- bnmap("gd", "<Cmd>Lspsaga lsp_finder<CR>")

  -- Formatting
  setKey("<Leader>fm", vim.lsp.buf.formatting_sync)

  -- NOTE: Terminal is yucky
  -- setKey("n", "<M-CR>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
  -- setKey("t", "<ESC>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
  -- setKey("t", "<M-CR>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
  -- finishKeys()
end

function M.doc_keys()
  -- setKey("i", "<C-m>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- setKey("n", "gr", require("telescope.builtin").lsp_references)
  -- setKey("n", "<Leader>ds", require("telescope.builtin").lsp_document_symbols)
  -- setKey("n", "<Leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols)
  -- setKey("gd", "<Cmd>Lspsaga lsp_finder<CR>")
  setKey("<C-m>", nil, "i", nil, "Peek definition (insert mode)", true)
  setKey("gd", nil, nil, nil, "Telescope lsp references", true)
  setKey("gr", nil, nil, nil, "Buffer definitions", true)
  setKey("gI", nil, nil, nil, "Buffer implementations", true)
  setKey("gt", nil, nil, nil, "Buffer type definitions", true)
  setKey("<Leader>ds", nil, nil, nil, "Telescope document symbols", true)
  setKey("<Leader>ws", nil, nil, nil, "Telescope workspace symbols", true)
  setKey(";d", nil, nil, nil, "LSPSaga peek definition", true)
  setKey(";k", nil, nil, nil, "LSPSaga hover doc", true)
  setKey(";t", nil, nil, nil, "LSPSaga outline", true)
  setKey(";r", nil, nil, nil, "LSPSaga rename", true)
  setKey(";a", nil, nil, nil, "LSPSaga code action", true)
  setKey(";go", nil, nil, nil, "LSPSaga line diagnostics", true)
  setKey(";gn", nil, nil, nil, "LSPSaga next diagnostic", true)
  setKey(";gp", nil, nil, nil, "LSPSaga previous diagnostic", true)
  setKey("<Leader>fm", nil, nil, nil, "Buffer formatting sync", true)
  -- NOTE: Terminal is yucky
  -- setKey("n", "<M-CR>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
  -- setKey("t", "<ESC>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
  -- setKey("t", "<M-CR>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
  finishKeys()
end

return M
