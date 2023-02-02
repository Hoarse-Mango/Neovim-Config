return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = { "node_modules", "vendor" }, -- ignore folder / files for live grep
      },
    },
  },
}
