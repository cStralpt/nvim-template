return {
  --add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "projekt0n/github-nvim-theme" },
  { "nxvu699134/vn-night.nvim" },
  { "lmburns/kimbox" },
  { "olimorris/onedarkpro.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "navarasu/onedark.nvim" },

  -- Configure your theme here
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark_dark", -- default tokyonight
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
