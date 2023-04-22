local M = {}

local utils = require("keymaps.util").utils("Refactoring")

local setKey = utils.setKey
local finishKeys = utils.finishKeys

function M.keys(refactoring)
  local opts = { silent = true, noremap = true, expr = false }
  local noremap = { noremap = true }
  local rf = refactoring.refactor
  local db = refactoring.debug

  -- Visual
  setKey("<Leader>re", function()
    rf("Extract Function")
  end, "v", opts)
  setKey("<Leader>rf", function()
    rf("Extract Function To File")
  end, "v", opts)
  setKey("<Leader>rv", function()
    rf("Extract Variable")
  end, "v", opts)

  -- Inline works in visual and normal
  setKey("<Leader>ri", function()
    rf("Inline Variable")
  end, { "n", "v" }, opts)

  -- Block
  setKey("<Leader>rb", function()
    rf("Extract Block")
  end, "n", opts)
  setKey("<Leader>rbf", function()
    rf("Extract Block To File")
  end, "n", opts)

  -- Telescope
  setKey("<Leader>rr", function()
    require("telescope").extensions.refactoring.refactors()
  end, "v", noremap)

  -- Debugging
  -------------------

  -- Mark the calling function
  setKey("<Leader>rdj", function()
    db.printf({ below = true })
  end, { "v", "n" }, noremap)
  setKey("<Leader>rdk", function()
    db.printf({ below = false })
  end, { "v", "n" }, noremap)

  -- mark Variables
  setKey("<Leader>rdv", function()
    db.print_var({ normal = true })
  end, "n", noremap)
  setKey("<Leader>rdv", function()
    db.print_var()
  end, "v", noremap)

  -- Clean Debug Print Statements
  setKey("<Leader>rdclear", function()
    db.cleanup()
  end, "n", noremap)

  finishKeys()
end

return M
