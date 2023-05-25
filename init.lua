-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("nvim-ts-autotag").setup()
require("nvim-ts-autotag").setup()
require("notify").setup({
  background_colour = "#000000",
})
require("toggleterm").setup({})
require("hop").setup()
require("gitsigns").setup()

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

local terminal_open = false

function ToggleTerminal()
  if terminal_open then
    -- Close terminal
    vim.cmd("terminal close")
    terminal_open = false
  else
    -- Open terminal
    local split_size = "10"
    vim.cmd("split term://bash | startinsert | resize " .. split_size)
    terminal_open = true
  end
end

-- my keymaps
local keymaps = {
  -- ToggleTerm keymaps
  { mode = "n", key = "<F7>", cmd = "<cmd>ToggleTerm direction=float<CR>", opts = { noremap = true, silent = true } },
  { mode = "t", key = "<F7>", cmd = "<cmd>ToggleTerm direction=float<CR>", opts = { noremap = true, silent = true } },
  -- hop keymaps
  { mode = "n", key = "<S-u>", cmd = "<cmd>HopLine<CR>", opts = { noremap = true, silent = true } },
  { mode = "n", key = "<A-S-f>", cmd = "<cmd>HopPatternBC<CR>", opts = { noremap = false, silent = true } },
  { mode = "n", key = "<A-f>", cmd = "<cmd>HopPatternAC<CR>", opts = { noremap = false, silent = true } },
  { mode = "n", key = "<A-w>", cmd = "<cmd>HopWord<CR>", opts = { noremap = false, silent = true } },
  -- { mode = "n", key = "<F6>", cmd = "<cmd>split term://bash<CR>", opts = { noremap = false, silent = true } },
  { mode = "t", key = "<F6>", cmd = "<cmd>q<CR>", opts = { noremap = false, silent = true } },
  {
    mode = "n",
    key = "<F6>",
    cmd = "<cmd>lua ToggleTerminal()<CR>",
    opts = { noremap = false, silent = true },
  },
}

for _, keymap in ipairs(keymaps) do
  vim.api.nvim_set_keymap(keymap.mode, keymap.key, keymap.cmd, keymap.opts)
end

vim.cmd("Gitsigns toggle_current_line_blame")
