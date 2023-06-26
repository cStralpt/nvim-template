-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  -- VSCode extension
else
  require("config.lazy")
  require("nvim-ts-autotag").setup()
  require("toggleterm").setup({})
  require("oil").setup()
  require("notify").setup({
    background_colour = "#222436",
  })
  vim.api.nvim_command("highlight LineNr guifg=#bae67e ctermfg=149")
  vim.api.nvim_command("highlight CursorLineNr guifg=#ef6b73 ctermfg=203")
  -- vim.api.nvim_command("highlight CursorLine guibg=#1C1C3E")

  -- make nvim transparent
  local transparencyOptions = {
    init = {
      Normal = { bg = "NONE", ctermbg = "NONE" },
      NormalNC = { bg = "NONE", ctermbg = "NONE" },
      NeoTreeNormal = { bg = "NONE", ctermbg = "NONE" },
      NeoTreeNormalNC = { bg = "NONE", ctermbg = "NONE" },
    },
  }

  if transparencyOptions then
    for group, hl in pairs(transparencyOptions.init) do
      vim.cmd(
        "highlight "
          .. group
          .. " guifg="
          .. (hl.gui and hl.gui.fg or "NONE")
          .. " guibg="
          .. (hl.gui and hl.gui.bg or "NONE")
          .. " ctermfg="
          .. (hl.cterm and hl.cterm.fg or "NONE")
          .. " ctermbg="
          .. (hl.cterm and hl.cterm.bg or "NONE")
      )
    end
  end
end
