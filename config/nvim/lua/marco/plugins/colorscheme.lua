return {
  {
    "sainnhe/sonokai",
    priority = 6969,
    lazy = false,
    config = function()
      vim.g.sonokai_style = "atlantis"
      vim.g.sonokai_better_performance = 1
      vim.g.sonokai_transparent_background = 2
      vim.cmd.colorscheme("sonokai")
    end,
  },
}

