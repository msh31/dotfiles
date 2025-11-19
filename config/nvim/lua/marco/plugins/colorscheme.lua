return {
  {
    "sainnhe/sonokai",
    priority = 6969,
    lazy = false,
    config = function()
      vim.g.sonokai_style = "atlantis"
      vim.g.sonokai_better_performance = 1
      vim.g.sonokai_transparent_background = 0

      vim.g.sonokai_colors_override = {
        bg0 = "#282828",
      }
      vim.cmd.colorscheme("sonokai")
    end,
  },
}
--
--
-- return { 
--     "lunarvim/templeos.nvim",
--
--     config = function()
--         vim.cmd("colorscheme templeos")
--     end
-- }
