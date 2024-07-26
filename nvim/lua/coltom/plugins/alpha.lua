return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "   ",
      "   ",
      "   ",
      "   ",
      "   ",
      "   ",
      "   ",
      "                                                     ",
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("f", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("e", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("t", "  > NVIM Settings", "<cmd>Telescope find_files cwd=~/.config/nvim/lua/coltom<CR>"),
      dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
