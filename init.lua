-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  -- VSCode extension
else
  require("config.lazy")
  require("nvim-ts-autotag").setup()
  require("toggleterm").setup({})
  require("oil").setup()
  require("gitsigns").setup({
    current_line_blame = true,
  })
  vim.api.nvim_command("highlight LineNr guifg=#bae67e ctermfg=149")
  vim.api.nvim_command("highlight CursorLineNr guifg=#ef6b73 ctermfg=203")
end
