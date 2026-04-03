return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      vim.lsp.enable 'gleam'
    end,
  },
  { 'mason-org/mason.nvim', opts = {} },
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {},
    dependencies = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig',
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'stylua',
        'ruff',
        'debugpy',
        'biome',
        'ts_ls',
        'ansiblels',
      },
    },
  },
  { 'j-hui/fidget.nvim', opts = {} },
}
