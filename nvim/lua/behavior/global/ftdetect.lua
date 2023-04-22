-- Tweego/SugarCube/Twine
vim.api.nvim_create_augroup("my_filetype_aucommands")
vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
  group = "my_filetype_aucommands",
  pattern = { "*.tw", "*.twee" },
  -- command = "set filetype=tweego"
  callback = vim.api.nvim_command('set filetype=tweego')
})
-- vim.api.nvim_create_autocmd(au BufRead,BufNewFile *.tw, *.twee set filetype=tweego)
