-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

return {

  -- Set LineNr highlight group
  vim.cmd("highlight LineNr guifg=#bae67e guibg=NONE ctermfg=darkgrey ctermbg=NONE"),

  -- Set CursorLineNr highlight group
  vim.cmd("highlight CursorLineNr guifg=#ef6b73 guibg=NONE ctermfg=red ctermbg=NONE"),
}