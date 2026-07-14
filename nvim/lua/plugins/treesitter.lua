return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  highlight = {
      enable = true,
      disable = {'jinja'}
    }
}
