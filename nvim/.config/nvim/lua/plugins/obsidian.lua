return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    frontmatter = {
      enabled = false,
    },
    legacy_commands = false, -- this will be removed in 4.0.0
    workspaces = {
      {
        name = "ObsidianVault",
        path = "~/vaults/ObsidianVault",
      },
    },
  },
}
