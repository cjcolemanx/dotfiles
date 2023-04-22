if vim.g.startenv == nil then
  vim.g.startenv = "base"
end

if vim.g.vscode then
  require("vscode")
else
  require("behavior.global")
  require("keymaps")
  require("options")
  require("plugin")
  require("ui")
  require("util") -- global helper functions (like type-checking and such)
end
