return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato",
      term_colors = true,
    })
    vim.cmd("colorscheme catppuccin")
  end,
}
