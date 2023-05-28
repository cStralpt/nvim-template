return {
  --add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "projekt0n/github-nvim-theme" },
  { "sainnhe/sonokai" },
  { "marko-cerovac/material.nvim" },
  { "ray-x/aurora" },
  { "rafamadriz/neon" },
  { "nxvu699134/vn-night.nvim" },
  { "lmburns/kimbox" },

  -- Configure your theme here
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_dark_dimmed", -- default tokyonight
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        -- floats = "transparent",
      },
    },
  },
}
