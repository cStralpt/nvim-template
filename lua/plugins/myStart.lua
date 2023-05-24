return {
  {
    "echasnovski/mini.starter",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "VimEnter",
    opts = function()
      -- local logo = table.concat({
      --   "██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z",
      --   "██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z",
      --   "██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z",
      --   "██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z",
      --   "███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║",
      --   "╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝",
      -- }, "\n")
      local logo = table.concat({
        "                                                                     𝖘𝖙𝖆𝖞𝕱𝖔𝖈𝖚𝖘                             ",
        "                                     Ϩⲁⲧꞅⲓⲁⲁ𝓵ⲓ                                                              ",
        " ʅɐʅɐHʎɐʇs                                                                                                ",
        "           ██████╗ ███████╗ ████████╗ ██████╗   █████╗  ██╗      ██████╗  ████████╗          𝓬ട𝜏ɾαɬρ𝜏",
        "          ██╔════╝ ██╔════╝ ╚══██╔══╝ ██╔══██╗ ██╔══██╗ ██║      ██╔══██╗ ╚══██╔══╝   🆂🆃🅰🆈🅷🅴🅰🅻🆃🅷🆈",
        "          ██║      ███████╗    ██║    ██████╔╝ ███████║ ██║      ██████╔╝    ██║ ",
        "          ██║      ╚════██║    ██║    ██╔══██╗ ██╔══██║ ██║      ██╔═══╝     ██║",
        "          ╚██████╗ ███████║    ██║    ██║  ██║ ██║  ██║ ███████╗ ██║         ██║ 𝔫𝔬-𝔱𝔦𝔪𝔢2𝔡𝔦𝔢",
        "           ╚═════╝ ╚══════╝    ╚═╝    ╚═╝  ╚═╝ ╚═╝  ╚═╝ ╚══════╝ ╚═╝         ╚═╝ ",
        "                   ᵦₑₜₜₑᵣ𝆑ₒᵣₜₒₘₒᵣᵣₒw                                            ",
        "                                                   𝖎𝖓𝖛𝖊𝖘𝖙𝖎𝖓𝖌-𝖎𝖓-𝖙𝖎𝖒𝖊-𝖐𝖓𝖔𝖜𝖑𝖊𝖉𝖌𝖊",
      }, "\n")
      
      print(logo)
      
      local pad = string.rep(" ", 22)
      local new_section = function(name, action, section)
        return { name = name, action = action, section = pad .. section }
      end

      local starter = require("mini.starter")
    --stylua: ignore
    local config = {
      evaluate_single = true,
      header = logo,
      items = {
        new_section("Find file",    "Telescope find_files", "Telescope"),
        new_section("Recent files", "Telescope oldfiles",   "Telescope"),
        new_section("Grep text",    "Telescope live_grep",  "Telescope"),
        new_section("init.lua",     "e $MYVIMRC",           "Config"),
        new_section("Lazy",         "Lazy",                 "Config"),
        new_section("New file",     "ene | startinsert",    "Built-in"),
        new_section("Quit",         "qa",                   "Built-in"),
        new_section("Session restore", [[lua require("persistence").load()]], "Session"),
      },
      content_hooks = {
        starter.gen_hook.adding_bullet(pad .. "░ ", false),
        starter.gen_hook.aligning("center", "center"),
      },
    }
      return config
    end,
    config = function(_, config)
      -- close Lazy and re-open when starter is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "MiniStarterOpened",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      local starter = require("mini.starter")
      starter.setup(config)

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          local pad_footer = string.rep(" ", 8)
          starter.config.footer = pad_footer .. "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
          pcall(starter.refresh)
        end,
      })
    end,
  },
}
