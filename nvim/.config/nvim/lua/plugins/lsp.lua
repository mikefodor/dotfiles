return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      --opts = {
      ---@type lspconfig.options
      servers = {
        gopls = {},
        bashls = {},
        terraform = {},
        ["json-lsp"] = {},
      },
    },
  },
}
