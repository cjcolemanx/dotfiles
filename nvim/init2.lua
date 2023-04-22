if vim.g.vscode then -- passed in on vscode initiation
  require("vscode")
else
  require("behavior.global")
  require("keymaps")
  require("plugin")
  require("options")
  require("ui")
  require("util") -- global helper functions (like type-checking and such)
end
