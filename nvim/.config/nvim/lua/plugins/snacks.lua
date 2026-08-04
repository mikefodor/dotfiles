-- Disable snacks.notifier to try ui2
return {
  {
    "folke/snacks.nvim",
    opts = {
      notifier = {
        enabled = false,
      },
      indent = {
        animate = {
          enabled = false,
        },
      },
    },
  },
}
