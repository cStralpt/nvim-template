return {

  -- { "rebelot/kanagawa.nvim" },
  -- { "projekt0n/github-nvim-theme" },
  { "nxvu699134/vn-night.nvim" },
  -- { "lmburns/kimbox" },
  { "olimorris/onedarkpro.nvim" },
  -- { "nyoom-engineering/oxocarbon.nvim" },
  -- { "navarasu/onedark.nvim" },
  -- { "marko-cerovac/material.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nightfly",
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
