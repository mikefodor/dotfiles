-- Injects runtime paths of all plugins into lua_ls so type checking
-- automatically works
return {
  "folke/lazydev.nvim",
  ft = "lua",
  opts = {},
}
