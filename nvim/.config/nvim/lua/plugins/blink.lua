-- Don't auto-preselect the first line for autocompletion.

return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "enter",
      -- only accept if you've explicitly moved to an item with <Tab>/<C-n>/<Down>
      ["<CR>"] = { "accept", "fallback" },
    },
    completion = {
      list = {
        selection = {
          -- don't auto-preselect the first item
          preselect = false,
        },
      },
    },
  },
}
