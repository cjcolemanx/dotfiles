local M = {}

local utils = require("keymaps.util").utils("Treesitter", "Text Objects and Stuff")

local setKey = utils.setKey
local finishKeys = utils.finishKeys

M.keys = {
  incremental_selection = {
    init_selection = "<c-space>",
    node_incremental = "<c-]>",
    scope_incremental = "<c-s>",
    node_decremental = "<c-[>",
  },
  textobjects = {
    select = {
      ["of"] = "@function.outer",
      ["if"] = "@function.inner",
      ["oc"] = "@class.outer",
      ["ic"] = "@class.inner",
      ["ob"] = "@block.outer",
      ["ib"] = "@block.inner",
      ["ol"] = "@call.outer",
      ["il"] = "@call.inner",
      ["op"] = "@parameter.outer",
      ["ip"] = "@parameter.inner",
      ["oo"] = "@condition.outer",
      ["io"] = "@condition.inner",
      ["os"] = "@statement.outer",
      ["is"] = "@statement.inner",
    },
    move = {
      goto_next_start = {
        ["]f"] = "@function.outer",
        ["]c"] = "@c.outer",
      },
      goto_next_end = {
        ["]F"] = "@function.outer",
        ["]M"] = "@c.outer",
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[c"] = "@c.outer",
      },
      goto_previous_end = {
        ["[F"] = "@function.outer",
        ["[M"] = "@c.outer",
      },
    },
  },
  swap = {
    next = {
      ["<Leader>a"] = "@parameter.inner",
    },
    previous = {
      ["<Leader>A"] = "@parameter.inner",
    },
  },
}

function M.doc_keys()
  setKey("<c-space>", nil, nil, nil, "Init selection", true)
  setKey("<c-space>", nil, nil, nil, "Increase selection node", true)
  setKey("<c-s>", nil, nil, nil, "Increase selection scope", true)
  setKey("<c-backspace>", nil, nil, nil, "Decrease selection node", true)
  setKey("<leader>a", nil, nil, nil, "Next @parameter.inner", true)
  setKey("<leader>A", nil, nil, nil, "Previous @parameter.inner", true)
  setKey("of", nil, nil, nil, "Text Object - @function.outer", true)
  setKey("if", nil, nil, nil, "Text Object - @function.inner", true)
  setKey("oc", nil, nil, nil, "Text Object - @class.outer", true)
  setKey("ic", nil, nil, nil, "Text Object - @class.inner", true)
  setKey("ob", nil, nil, nil, "Text Object - @block.outer", true)
  setKey("ib", nil, nil, nil, "Text Object - @block.inner", true)
  setKey("ol", nil, nil, nil, "Text Object - @call.outer", true)
  setKey("il", nil, nil, nil, "Text Object - @call.inner", true)
  setKey("op", nil, nil, nil, "Text Object - @parameter.outer", true)
  setKey("ip", nil, nil, nil, "Text Object - @parameter.inner", true)
  setKey("oo", nil, nil, nil, "Text Object - @condition.outer", true)
  setKey("io", nil, nil, nil, "Text Object - @condition.inner", true)
  setKey("os", nil, nil, nil, "Text Object - @statement.outer", true)
  setKey("is", nil, nil, nil, "Text Object - @statement.inner", true)
  setKey("]f", nil, nil, nil, "Move next start - @function.outer", true)
  setKey("]c", nil, nil, nil, "Move next start - @c.outer", true)
  setKey("]F", nil, nil, nil, "Move next end - @function.outer", true)
  setKey("]M", nil, nil, nil, "Move next end - @c.outer", true)
  setKey("[f", nil, nil, nil, "Move previous start - @function.outer", true)
  setKey("[c", nil, nil, nil, "Move previous start - @c.outer", true)
  setKey("[F", nil, nil, nil, "Move previous end - @function.outer", true)
  setKey("[M", nil, nil, nil, "Move previous end - @c.outer", true)
  finishKeys()
end

return M
