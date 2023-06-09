local status, leap = pcall(require, "leap")

if not status then
  -- print("ERROR: plugin 'leap' is unavailable")
  return
end

leap.opts.case_sensitive = true

-- leap.add_default_mappings()
local maps = require("keymaps.plugin.leap")
maps.keys()
maps.doc_keys()

-- The defaults can be set by calling `require('leap').add_default_mappings()`.
--
-- Note that the function will check for conflicts with any custom mappings
-- created by you or other plugins, and will not overwrite them, unless explicitly
-- told so (called with a `true` argument).
--
-- Trigger keys
--
-- Normal mode
--
--                                                         *leap_s*
-- s{char1}{char2}         Jump forward to a labeled or [count]'th visible
--                         occurrence of {char1}{char2}. The cursor is placed on
--                         {char1}.
--
--                                                         *leap_S*
-- S{char1}{char2}         Jump backward to a labeled or [count]'th visible
--                         occurrence of {char1}{char2}. The cursor is placed on
--                         {char1}.
--
-- Visual and Operator-pending mode
--                                                         *leap_v_s* *leap_o_s*
-- s{char1}{char2}         Jump forward to a labeled or [count]'th visible
--                         occurrence of {char1}{char2}. The cursor is
--                         placed on {char2} |inclusive|.
--
--                                                         *leap_v_S* *leap_o_S*
-- S{char1}{char2}         Jump backward to a labeled or [count]'th visible
--                         occurrence of {char1}{char2}. The cursor
--                         is placed on {char1}.
--
--                                                         *leap_v_x* *leap_o_x*
-- x{char1}{char2}         Jump forward to a labeled or [count]'th visible
--                         occurrence of {char1}{char2}. The cursor is
--                         placed on the character preceding {char1}
--                         |inclusive|.
--                         Mnemonic: "exclusive (s)".
--
--                                                         *leap_v_X* *leap_o_X*
-- X{char1}{char2}         Jump backward to a labeled or [count]'th visible
--                         occurrence of {char1}{char2}. The cursor
--                         is placed on the character following {char2}.
--                         Mnemonic: "eXclusive (S)".
--
-- All modes
--                                                         *leap_gs*
-- gs{char1}{char2}        Jump to a labeled occurrence of {char1}{char2} in one
--                         of the other windows on the tab page. The cursor is
--                         placed on {char1} |exclusive|.
--                         Mnemonic: "global s".
--
-- Special keys
--
-- <enter>                 Repeat search with the previous input (after
--                         invocation); jump to the next match in
--                         |leap-traversal| mode; accept the selection in
--                         |leap-multiselect| mode.
-- <space>                 Substitute for an EOL character (after the first
--                         input); shift to the next group of labeled matches
--                         (after the second input).
-- <tab>                   Revert the previous jump (|leap-traversal| mode) or
--                         the previous group shift.
-- <backspace>             Deselect the last selected target in
--                         |leap-multiselect| mode.
-- <esc>                   Exit Leap at any stage cleanly.

-- CUSTOM MAPPINGS                                           *leap-custom-mappings*
--
-- <Plug> keys are aliases for right hand sides of mappings - in our case, calls
-- to |leap.leap()|. If you are not familiar with the concept, see |<Plug>| and
-- |using-<Plug>|.
--
-- Available <Plug> keys (with their corresponding argument tables):
--
-- *<Plug>(leap-forward-to)*
-- arguments: `{}` in Normal mode, otherwise `{ offset = +1, inclusive_op = true }`
-- default mapping: `s`
--
-- *<Plug>(leap-forward-till)*
-- arguments: `{ offset = -1, inclusive_op = true }`
-- default mapping: `x` (Visual and Operator-pending mode only)
--
-- *<Plug>(leap-backward-to)*
-- arguments: `{ backward = true }`
-- default mapping: `S`
--
-- *<Plug>(leap-backward-till)*
-- arguments: `{ backward = true, offset = 2 }`
-- default mapping: `X` (Visual and Operator-pending mode only)
--
-- *<Plug>(leap-cross-window)*
-- arguments: `{ target_windows = require('leap.util').get_enterable_windows() }`
-- default mapping: `gs`
--
-- Example: `vim.keymap.set({'n', 'x', 'o'}, 'f', '<Plug>(leap-forward-to)')`
--
-- For creating custom motions with behaviours different from the above, see
-- |leap.leap()|.
--
-- The keys for repeating the search, and for switching between groups of matches
-- can be set via |leap.opts.special_keys|.
