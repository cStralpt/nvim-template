return {
  
    -- {'akinsho/toggleterm.nvim', version = "*", opts = {--[[ things you want to change go here]]}},
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    {'phaazon/hop.nvim', version = "*", config = true},
    {'lewis6991/gitsigns.nvim'},
    -- {'sindrets/diffview.nvim'},
    {'stevearc/oil.nvim'},
    { "nanozuki/tabby.nvim" , opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" }},
    -- {'romgrk/barbar.nvim',version = "*", config = true}

    {
      "hrsh7th/nvim-cmp",
      dependencies = { "hrsh7th/cmp-emoji" },
      ---@param opts cmp.ConfigSchema
      opts = function(_, opts)
        local cmp = require("cmp")
        opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
      end,
    }
    
  }
  