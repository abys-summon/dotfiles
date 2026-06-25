return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Header ASCII
    dashboard.section.header.val = {
      "██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗",
      "██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║",
      "██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║",
      "██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║",
      "███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║",
      "╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝",
    }

    -- Botones principales
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file",   ":ene <BAR> startinsert<CR>"),
      dashboard.button("f", "󰈞  Find file",  ":Telescope find_files<CR>"),
      dashboard.button("r", "󱋡  Recent",     ":Telescope oldfiles<CR>"),
      dashboard.button("p", "󰏖  Plugins (Lazy)", ":Lazy<CR>"),
      dashboard.button("c", "󰓙  Check Health",  ":checkhealth<CR>"),
      dashboard.button("q", "  Quit",       ":qa<CR>"),
    }

    -- Función del footer
    dashboard.section.footer.val = function()
      local stats = require("lazy").stats()
      return stats.loaded .. "/" .. stats.count .. " plugins loaded in " .. string.format("%.2f", stats.startuptime) .. "ms" .. " - " .. vim.fn.strftime("%H:%M")
    end

    -- Estilos de colores
    local gradient = {
      "#C9C2EA",
      "#B6ACE2",
      "#A397DB",
      "#8F81D3",
      "#7C6CCC",
      "#6956C4",
    }
    local header_hl = {}
    for i, color in ipairs(gradient) do
      vim.api.nvim_set_hl(0, "AlphaH" .. i, { fg = color, bold = true })
      header_hl[i] = {{ "AlphaH" .. i, 0, -1 }}
    end
    dashboard.section.header.opts.hl = header_hl    -- Padding vertical dinámico adaptado al layout de Alpha
    local function get_padding()
      local lines = vim.o.lines
      local content_height = #dashboard.section.header.val + 10 -- Estimación de altura de header + botones
      local pad = math.floor((lines - content_height) / 2)
      return pad > 0 and pad or 1
    end

    vim.api.nvim_set_hl(0, "AlphaFooter",   { fg = "#C9C2EA", italic = true })
    vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#FF5555" })
    for _, btn in ipairs(dashboard.section.buttons.val) do
      btn.opts.hl_shortcut = "AlphaShortcut"
    end

    dashboard.section.footer.opts.hl = "AlphaFooter"

    -- Layout final
    dashboard.opts.layout = {
      { type = "padding", val = get_padding }, -- Pasamos la función, no el resultado estático
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    alpha.setup(dashboard.opts)
  end,
}

