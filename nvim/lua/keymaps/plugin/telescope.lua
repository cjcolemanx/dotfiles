local M = {}

local utils = require("keymaps.util").utils("Telescope", "UI-based Pickers and Search")

if not utils then return end

local setKey = utils.setKey
local finishKeys = utils.finishKeys

-- local cmd = vim.cmd

function M.binds(builtin --[[, utils, previewers ]])
  -- TODO: LSP
  local n = nil

  -- These are different cuz have more basic use cases
  setKey("\\\\", builtin.buffers, n, n, "Buffers") -- \\
  setKey(";;", builtin.resume, n, n, "Reopen last picker") -- ;;
  setKey(";gg", builtin.live_grep, n, n, "Grep Files") -- gg
  setKey(";gs", builtin.grep_string, n, n, "Grep String") -- gs

  -- Other
  setKey(";fb", builtin.marks, n, n, "Marks") -- B
  setKey(";fc", builtin.commands, n, n, "Commands") -- C
  setKey(";fe", builtin.diagnostics, n, n, "Diagnostics") -- E
  setKey(";ff", builtin.find_files, n, n, "Find Files") -- F
  setKey(";fh", builtin.help_tags, n, n, "Help Tags") -- H
  setKey(";fj", builtin.jumplist, n, n, "Jump List") -- J
  setKey(";fk", builtin.filetypes, n, n, "Registered Filetypes") -- K
  setKey(";fl", builtin.loclist, n, n, "Loc List") -- L
  setKey(";fm", builtin.man_pages, n, n, "Man Pages") -- M
  setKey(";fn", function() require('telescope').extensions.notify.notify() end, n, n, "Notifications") -- N
  setKey(";fo", builtin.vim_options, n, n, "Vim Options") -- O
  setKey(";fq", builtin.quickfix, n, n, "Quickfix") -- Q
  setKey(";fr", builtin.reloader, n, n, "Reload Lua Modules") -- R
  setKey(";fse", function() -- SE
    require("telescope.builtin").symbols({ sources = { "emoji", "gitmoji", "kaomoji" } })
  end, n, n, "Emojis")
  setKey(";fsn", function() -- SN
    require("telescope.builtin").symbols({ sources = { "nerd" } })
  end, n, n, "Symbols (Nerd Font)")
  setKey(";fso", function() -- SO
    require("telescope.builtin").symbols({ sources = { "julia", "latex", "math" } })
  end, n, n, "Symbols (Other)")
  setKey(";fS", builtin.spell_suggest, n, n, "Suggest spellings for word under cursor") -- SHIFT-S
  setKey(";ft", builtin.tags, n, n, "Tags") -- T
  setKey(";fy", builtin.registers, n, n, "Registers") -- Y
  setKey(";fz", builtin.colorscheme, n, n, "Vim Colorschemes") -- z
  setKey(";f/", builtin.tagstack, n, n, "Tag Stack") -- /
  setKey(";f?", builtin.builtin, n, n, "(META) Telescope Builtin") -- ?
  -- setKey(";fa", function()
  --   local previewers = require("telescope.previewers")
  --   local pickers = require("telescope.pickers")
  --   local sorters = require("telescope.sorters")
  --   local finders = require("telescope.finders")
  --   local alias_cmd = "alias"
  --
  --   pickers.new({
  --     results_title = "Aliases",
  --     finder = finders.new_oneshot_job({ alias_cmd }),
  --     sorter = sorters.get_fuzzy_file(),
  --     previewer = previewers.new_buffer_previewer({
  --       define_preview = function(self, entry, status)
  --         return require('telescope.previewers.utils').job_maker(
  --           { "alias", "state", "list", entry.value },
  --           self.state.bufnr,
  --           {
  --             callback = function(bufnr, content)
  --               if content ~= nil then
  --                 require('telescope.previewers.utils').regex_highlighter(bufnr, alias_cmd)
  --               end
  --             end
  --           }
  --         )
  --       end
  --     })
  --   }).find()
  -- end, n, n, "List shell aliases")

  -- Run Commands
  setKey(";rs", function()
    builtin.find_files(
      require("telescope.themes").get_dropdown(
        {
          attach_mappings = function(_, map)
            map("i", "<CR>", function(_prompt_bufnr)
              local selected = require("telescope.actions.state").get_selected_entry()
              local script_name = selected[1]

              -- Run Script
              vim.cmd("silent exec \"! ./" .. script_name .. "\"")

              -- Close prompt
              require("telescope.actions").close(_prompt_bufnr)

              -- Notify
              require("notify").notify("Running script: " .. script_name, "log", {
                title = "Telescope Scripts",
                render = "default"
              })
            end
            )
            return true
          end,
          hidden = true,
          no_ignore = true,
          search_file = "*.sh"
        }
      )
    )
  end, n, n, "Scripts in CWD") -- x

  finishKeys()
end

-- Actions
-- move_selection_next / _previous
-- move_selection_worse / _better
-- move_selection_top / _middle / _bottom
-- move_to_top / _middle / _bottom
-- add_selection / remove_ / toggle_
-- select_all / drop_ / toggle_
-- preview_scrolling_up / _down
-- results_scrolling_up / _down
-- center
-- select_default / _horizontal / _vertical / _tab
-- select_drop / _tab_drop
-- file_edit / _split / _vsplit /tab
-- close
-- edit_command_line / set_
-- edit_search_line / set_
-- edit_register / paste_
-- insert_symbol / _symbol_i
-- git_create_branch / _apply_stash / _checkout / _switch_branch / _track_branch
--    _delete_branch / _merge_branch  / _rebase_branch / _reset_mixed
--    _reset_soft / _reset_soft / _checkout_current_buffer / _staging_toggle
-- send_slected_to_qflist / add_
-- send_to_qflist
-- send_selected_to_loclist / add_ /
-- send_to_loclist
-- complete_tag
-- cycle_history_next / _prev
-- open_qflist / _loclist
-- delete_bufffer
-- cycle_previewers_next / _prev
-- remove_selected_picker
-- which_key
-- to_fuzzy_refine


-- NOTE: complete_tag

function M.keymap(actions)
  local default_mappings = {
    n = {
      ["q"] = actions.close,
      ["<esc>"] = actions.close,
      ["j"] = actions.move_selection_next,
      ["k"] = actions.move_selection_previous,
    },
    i = {
      ["<esc>"] = actions.close,
      ["<c-j>"] = actions.move_selection_next,
      ["<c-k>"] = actions.move_selection_previous,
      ["<c-o>"] = actions.select_vertical,
      ["<c-t>"] = actions.select_tab,
      ["<c-l>"] = actions.complete_tag,
      -- ["<c-y>"] = actions.add_selecction,
      -- ["<c-r>"] = actions.remove_selecction,
    }
  }
  return {
    defaults = {
      mappings = {
        n = {
          ["q"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
        },
        i = {
          ["<esc>"] = actions.close,
          ["<c-j>"] = actions.move_selection_next,
          ["<c-k>"] = actions.move_selection_previous,
          ["<c-o>"] = actions.select_tab,
        },
      },
    },
    pickers = {
      help_tags = {
        mappings = {
          n = {
            ["q"] = actions.close,
            ["<C-Space>"] = actions.select_vertical,
            ["<leader><Space>"] = actions.select_vertical,
            ["<c-t>"] = actions.select_tab,
            ["<c-o>"] = actions.select_vertical,
          },
        },
      },
      -- buffers = {
      --   mappings = {
      --     n = {
      --       ["<C-.>"] = actions.close
      --     }
      --   }
      -- },
      man_pages = {
        mappings = {
          n = {
            ["<C-Space>"] = actions.select_vertical,
            ["<leader><Space>"] = actions.select_vertical,
            ["<C-o>"] = actions.select_tab,
          },
        },
      },
    },
    extensions = {
      file_browser = {
        mappings = {
          ["i"] = {
            ["<C-w>"] = function()
              vim.cmd("normal vbd")
            end,
          },
          ["n"] = {
            ["i"] = function()
              vim.cmd("startinsert")
            end,
            ["/"] = function()
              vim.cmd("startinsert")
            end,
          },
        },
      },
    },
  }
end

return M
