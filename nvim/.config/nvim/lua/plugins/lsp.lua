return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      --opts = {
      ---@type lspconfig.options
      servers = {
        bashls = {},
        dockerls = {},
        docker_compose_language_server = {},
        jsonls = {},
        gopls = {},
        postgres_lsp = {
          filetypes = { "sql", "pgsql" },
        },
        terraformls = {},
        yamlls = {},
      },
    },
  },
}
