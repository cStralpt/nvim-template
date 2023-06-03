-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
map("n", "<F7>", "<cmd>ToggleTerm direction=float<CR>", { desc = "open floating terminal", noremap = false })
map("t", "<F7>", "<cmd>ToggleTerm direction=float<CR>", { desc = "open floating terminal", noremap = false })
map("i", "<C-d>", function()
  local new_text = vim.fn.input("Replace with?: ")
  local cmd = "normal! *Ncgn" .. new_text
  vim.cmd(cmd)
end, { desc = "ctrl+d vs code alternative" })
map("i", "<BS>", "<cmd>norm! ldei<CR>", { noremap = true, desc = "delete one word to right" })
map("i", "<C-S-h>", "<cmd>norm! h<CR>", { noremap = true, desc = "move to left one character" })
-- map("i", "<C-L>", "<cmd>norm! l<CR>", { remap = false, desc = "move to right one character" })
map("i", "<C-f>", "<Esc>/", { noremap = false })
function ToggleWordWrap()
  if vim.wo.wrap then
    vim.wo.wrap = false
    print("Word wrap disabled")
  else
    vim.wo.wrap = true
    print("Word wrap enabled")
  end
end

--clipboard keymaps
local function copyToClipBoard()
  vim.cmd("set clipboard+=unnamedplus")
  vim.cmd("norm! y")
  vim.cmd("set clipboard-=unnamedplus")
  print("copied!")
end

map("i", "<C-a>", function()
  vim.cmd("norm! ggVG")
  print("Selected all lines")
end, { remap = false, desc = "select all lines in buffer" })
map("v", "<C-c>", function()
  copyToClipBoard()
end, { remap = false, desc = "copy selected text" })

-- Map a keybinding to toggle word wrap
map("n", "<leader>ct", ":lua ToggleWordWrap()<CR>", { noremap = true, silent = true, desc = "toggle word wrap" })
map("i", "<C-l>", "<Del>", { remap = true, desc = "delete one character backward" })
map("n", "<leader>bc", "<cmd>BufferLinePick<CR>", { noremap = false, silent = true, desc = "pick buffer" })
map("n", "<leader>cb", "<cmd>Navbuddy<CR>", { noremap = true, desc = "jump to code symbol" })
map("n", "-", require("oil").open, { desc = "Open parent directory" })
