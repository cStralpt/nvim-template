-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.cmd([[
        set shell=pwsh
        set shellcmdflag=-command
        set shellquote=\"
        set shellxquote=
    ]])
vim.opt.undofile = false
-- vim.opt.shell = "pwsh.exe"
