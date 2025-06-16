return {
  "nvim-tree/nvim-tree.lua",
  name = "nvim-tree",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
    "nvim-lua/plenary.nvim",       -- required for nvim-tree
  },
  config = function()
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
        side = "left",
        preserve_window_proportions = true,
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      filters = {
        dotfiles = false,
        custom = { ".git", "node_modules", ".cache" },
      },
      git = {
        enable = true,
        ignore = false,
      },
      actions = {
        open_file = {
          resize_window = true,
        },
      },
    })
  end,
}
