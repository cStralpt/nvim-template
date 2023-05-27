-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
vim.keymap.set("n", "<S-u>", "<cmd>HopLine<CR>", { noremap = false, silent = true })
vim.keymap.set("n", "F", "<cmd>HopPatternBC<CR>", { noremap = false, silent = true })
vim.keymap.set("n", "f", "<cmd>HopPatternAC<CR>", { noremap = false, silent = true })
vim.keymap.set("n", "<A-w>", "<cmd>HopWord<CR>", { noremap = false, silent = true })
vim.keymap.set("n", "t", "<cmd>HopWordCurrentLine<CR>", { noremap = false, silent = true })
vim.keymap.set("n", "<F7>", "<cmd>ToggleTerm direction=float<CR>", { noremap = false, silent = true })
vim.keymap.set("t", "<F7>", "<cmd>ToggleTerm direction=float<CR>", { noremap = false, silent = true })
vim.keymap.set("n", "<leader>bc", "<cmd>BufferLinePick<CR>", { noremap = false, silent = true,desc="pick buffer" })
vim.keymap.set('i', '<C-Enter>', '2o<Esc>k', { noremap = false })
vim.keymap.set('i', '<C-f>', '<Esc>/', { noremap = false })
vim.keymap.set('i', '<C-j>', '<cmd>split | resize 10  | terminal<CR><Esc>a', { noremap = false })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', { noremap = false })

-- Define keymap to open a new line below the current line in normal mode



-- vim.api.nvim_set_keymap('n', '<A-z>', ':lua vim.opt.wrap = true<CR>', { silent = true, noremap = false })
-- Function to toggle word wrap
function ToggleWordWrap()
    if vim.wo.wrap then
        vim.wo.wrap = false
        print("Word wrap disabled")
    else
        vim.wo.wrap = true
        print("Word wrap enabled")
    end
  end
  
  -- Map a keybinding to toggle word wrap
  vim.api.nvim_set_keymap('n', '<A-z>', ':lua ToggleWordWrap()<CR>', { noremap = true, silent = true })



-- vim.keymap.set("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
-- vim.keymap.set("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })
-- vim.keymap.set("n", "<leader>hs", ":Gitsigns stage_hunk<CR>",{ desc = "git stage hunk" })
-- vim.keymap.set("v", "<leader>hs", ":Gitsigns stage_hunk<CR>",{ desc = "git stage hunk" })
-- vim.keymap.set("n", "<leader>hr", ":Gitsigns reset_hunk<CR>",{ desc = "git reset hunk" })
-- vim.keymap.set("v", "<leader>hr", ":Gitsigns reset_hunk<CR>",{ desc = "git reset hunk" })
-- vim.keymap.set("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>",{ desc = "git stage buffer" })
-- vim.keymap.set("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>",{ desc = "git reset hunk" })
-- vim.keymap.set("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>",{ desc = "git reset buffer" })
-- vim.keymap.set("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>",{ desc = "git preview hunk" })
vim.keymap.set("n", "<leader>gi", "<cmd>lua require'gitsigns'.blame_line{full=true}<CR>",{ desc = "git blame line full" })
vim.keymap.set("n", "<leader>gl", "<cmd>Gitsigns toggle_current_line_blame<CR>",{ desc = "git toggle current line blame✔️" })
-- vim.keymap.set("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>",{ desc = "git view this diff" })
-- vim.keymap.set("n", "<leader>hD", "<cmd>lua require'gitsigns'.diffthis('~')<CR>")
-- vim.keymap.set("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>",{ desc = "git toggle deleted" })

-- text object
-- vim.keymap.set("o", "ih", ":<C-U>Gitsigns select_hunk<CR>",{ desc = "git select hunk" })
-- vim.keymap.set("x", "ih", ":<C-U>Gitsigns select_hunk<CR>",{ desc = "git select hunk" })

-- Hop keymaps
vim.keymap.set("n", "<leader>jl", "<cmd>HopWordCurrentLine<CR>",{ desc = "jump to word current line" })
vim.keymap.set("n", "<leader>jp", "<cmd>HopPattern<CR>",{ desc = "jump to matched text - *line" })
vim.keymap.set("n", "<leader>jw", "<cmd>HopPatternMW<CR>",{ desc = "jump to matched text - !current line" })
vim.keymap.set("n", "<leader>js", "<cmd>HopLineStart<CR>",{ desc = "jump to start line" })
vim.keymap.set("n", "<leader>ja", "<cmd>HopAnywhere<CR>",{ desc = "jump to anywhere" })
vim.keymap.set("n", "<leader>jab", "<cmd>HopAnywhereAC<CR>",{ desc = "jump to bottom - anywhere" })
vim.keymap.set("n", "<leader>jat", "<cmd>HopAnywhereBC<CR>",{ desc = "jump to top - anywhere" })


-- keymaps for git
-- vim.keymap.set("n", "<leader>gf", "<cmd>DiffviewToggleFiles<CR>",{ desc = "git focus file" })
