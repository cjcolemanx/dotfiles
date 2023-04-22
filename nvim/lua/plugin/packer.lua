local fn = vim.fn
local cmd = vim.cmd
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  cmd([[packadd packer.nvim]])
end

local packer = require("packer")

packer.init({
  opt_default = false,
  display = {
    working_sym = " ⚒ ",
    error_sym = " 💣 ",
    done_sym = " ✓ ",
    removed_sym = " 🔥 ",
    moved_sym = " 🚀 ",
    header_sym = " _ ",
    prompt_border = "double",
  },
})

return packer.startup({
  function(use)
    use("wbthomason/packer.nvim") -- Self-Managing

    -- => Global
    -------------------------
    use({
      "nvim-tree/nvim-tree.lua", -- File Tree
      requires = {
        "nvim-tree/nvim-web-devicons", -- File Icons
      },
    })
    use("lukas-reineke/indent-blankline.nvim")
    -- use({
    --   "nvim-telescope/telescope.nvim",                -- Search Interface
    --   requires = {
    --     "nvim-lua/popup.nvim",                        -- Pop-Up Windows
    --     "nvim-lua/plenary.nvim",                      -- Utilities
    --     "nvim-telescope/telescope-file-browser.nvim", -- File Browser
    --     "nvim-telescope/telescope-frecency.nvim",     -- Frequent + Recent
    --     "nvim-telescope/telescope-ui-select.nvim",    -- TScope Native Selection
    --   },
    -- })
    -- use("nathom/filetype.nvim")   -- easier filetype stuff : )
    use("numToStr/Comment.nvim") -- Commenting
    use("windwp/nvim-autopairs") -- Auto Closing
    use("folke/zen-mode.nvim") -- Minimalism
    use("kylechui/nvim-surround") -- Surround
    use({
      "kevinhwang91/nvim-ufo",
      requires = "kevinhwang91/promise-async"
    }) -- Folds
    use("abecodes/tabout.nvim") -- <Tab> out of quotes and braces
    use("ThePrimeagen/harpoon")
    use("mbbill/undotree")
    use("folke/todo-comments.nvim") -- TODO Highlights
    use({
      "ggandor/leap.nvim",
      requires = { "tpope/vim-repeat" }, -- needed for dot (.) repetition
    }) -- 'Sneak'-like motion plugin
    use("tpope/vim-fugitive")
    -- use("chrisbra/unicode.vim") -- Unicode Search

    -- => Telescope
    -------------------------
    use("debugloop/telescope-undo.nvim")


    -- NOTE: may break:
    -- Uses Uberzug, so it may not work right off.
    -- GitHub movement toward Chafa, just waiting on merge
    -- NOTE: 2 : Chafa implementation is merged, but needs setup and configuring
    -- use("nvim-telescope/telescope-media-files.nvim") -- File Previewer
    -- NOTE: not using these atm
    -- use("benfowlwer/telescope-luasnip.nvim") -- See snippets
    -- use("nvim-telescope/telescope-ghq.nvim") -- GHQ viewing + integration?

    -- => User Interface
    use({
      "stevearc/dressing.nvim", -- Better NeoVim UI
      requires = { "nvim-lua/plenary.nvim" },
    })
    use("nvim-lualine/lualine.nvim") -- Powerline (for NeoVim :])
    use("nanozuki/tabby.nvim") -- Powerline-ish Tabs
    use("psliwka/vim-smoothie") -- Smooth Scrolling
    use("rcarriga/nvim-notify") -- notifications in neovim


    -- use("Pocco81/high-str.nvim")        -- Highlight text in a buffer
    -- use("norcalli/nvim-colorizer.lua")  -- In-buffer color highlighter
    -- use("sunjon/Shade.nvim")            -- make unfocused windows dark
    -- use("j-hui/fidget.nvim")            -- LSP results in buffer
    -- use("nvim-zh/colorful-winsep.nvim") -- colorize window separators

    -- => Other
    -------------------------
    use("mrjones2014/nvim-ts-rainbow") -- rainbow parenthesis
    use("folke/which-key.nvim") -- Document your keymaps! (w hints)
    use("glepnir/dashboard-nvim") -- NVIM Dashboard
    use("booperlv/nvim-gomove") -- ':move' wrapper


    -- => NeoVim Development
    -------------------------
    -- use("tjdevries/vlog.nvim")  -- Better Logging
    -- use("MunifTanjim/nui.nvim") -- UI Components
    -- use("folke/neodev.nvim") -- NeoVim-focused hoverdoc support

    -- => Etc.
    -------------------------
    -- NOTE: new plugins (may remove)
    use("rafamadriz/friendly-snippets")
    use("ellisonleao/glow.nvim") -- Markdown preview (depends on Glow)

    -- TODO: Try these out
    -- use("jreybert/vimagit") -- enhanced git workflow in vim
    -- use("yamatsum/nvim-cursorline") -- highlight instances of word under line or cursor
    -- use("xiyaowong/nvim-cursorword") -- half of nvim-cursorline
    -- use("ziontee113/icon-picker.nvim")
    -- use("michaelb/sniprun") -- run code snippets in a terminal
    -- use("ray-x/navigator.lua") -- LSPSaga alternative
    -- use("cbochs/grapple.nvim") -- Tag and jump important files
    -- use("PatschD/zippy.nvim") -- console logging in buffer
    -- use("folke/styler.nvim") -- Custom colorschemes per filetype
    -- use("miversen33/import.nvim")
    -- use("mrjones2014/smart-splits.nvim") -- directional vs size based resizing


    -- ==> Mini
    -------------------------
    use("echasnovski/mini.align")

    -- => Setup Other
    -------------------------
    use("petertriho/nvim-scrollbar") -- visualize distance ONLY (too lazy to implement myself)

    -- ==> Disabled
    -------------------------
    -- use("phaazon/mind.nvim")           -- PKM/Wiki/Task MGMT (use Obsidian still)
    -- use("xiyaowong/link-visitor.nvim") -- Quickly Open Links in Browser (Kitty handles better)
    -- use("folke/drop.nvim") -- Doesn't work w/ config lol
    -- use("echasnovski/mini.nvim") -- add cursor animations (Breaks some visuals - animations)
    -- use("nvim-telescope/telescope-project.nvim") -- Projects in NVIM
    -- use("nvim-telescope/telescope-symbols.nvim")
    -- use("pwntester/octo.nvim") -- View GitHub Issues and PRs from Telescope

    -- Dynamic Load
    local config = require("plugin.configs")

    for _, value in pairs(config) do
      for _, _v in pairs(value) do
        use(_v)
      end
    end

    -- WARN: : USE LAST
    use("mrjones2014/legendary.nvim") -- Document your keymaps!

    -- Bootstrap
    if Packer_bootstrap then
      require("packer").sync()
    end
  end,
  config = {
    display = {
      open_fn = require("packer.util").float,
    },
  },
})
