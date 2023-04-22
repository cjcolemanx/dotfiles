local ENV = vim.g.startenv

local configs = {}

if ENV == "base" or ENV == nil then
	configs = {
		require("plugin.configs.dev"),
		require("plugin.configs.palettes"),
		require("plugin.configs.syntax"),
		require("plugin.configs.telescope")
	}
end

return configs
