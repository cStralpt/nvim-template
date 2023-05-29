if vim.g.vscode then
  -- VSCode extension
else
  -- ordinary Neovim
  -- bootstrap lazy.nvim, LazyVim and your plugins
  require("config.lazy")
  require("nvim-ts-autotag").setup()
  require("notify").setup({
    background_colour = "#000000",
  })
  require("toggleterm").setup({})
  require("hop").setup()
  require("gitsigns").setup()
  require("oil").setup()
  -- require('dressing').setup({})
  vim.cmd("Gitsigns toggle_current_line_blame")

  local highlights = {
    init = {
      Normal = { bg = "NONE", ctermbg = "NONE" },
      NormalNC = { bg = "NONE", ctermbg = "NONE" },
      --CursorColumn = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
      --CursorLine = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
      --CursorLineNr = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
      LineNr = {},
      SignColumn = {},
      StatusLine = {},
      NeoTreeNormal = { bg = "NONE", ctermbg = "NONE" },
      NeoTreeNormalNC = { bg = "NONE", ctermbg = "NONE" },
    },
  }

  -- make nvim transparent
  if highlights then
    for group, hl in pairs(highlights.init) do
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
  -- Custom line number color
  local lineColors = {
    { group = "LineNr", guifg = "#bae67e", guibg = "NONE", ctermfg = "darkgrey", ctermbg = "NONE" },
    { group = "CursorLineNr", guifg = "#ef6b73", guibg = "NONE", ctermfg = "red", ctermbg = "NONE" },
  }

  for _, highlight in ipairs(lineColors) do
    vim.cmd(
      string.format(
        "highlight %s guifg=%s guibg=%s ctermfg=%s ctermbg=%s",
        highlight.group,
        highlight.guifg,
        highlight.guibg,
        highlight.ctermfg,
        highlight.ctermbg
      )
    )
  end

  vim.opt.termguicolors = true
end
