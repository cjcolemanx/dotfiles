-- vim-jsdoc
vim.keymap.set({ "n", "v" }, ";gd", "<Plug>(jsdoc)", { silent = true })
vim.keymap.set({ "n", "v" }, ";gl", "<cr>:noh<cr><Plug>(jsdoc)", { silent = true })
-- vim.g.jsdoc_lehre_path = "$HOME/.nvm/versions/node/v19.4.0/lib/"
vim.g.jsdoc_lehre_path = "./node_modules/.bin/lehre"
