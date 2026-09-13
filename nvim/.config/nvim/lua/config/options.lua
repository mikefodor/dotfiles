-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set tab to 4 spaces
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 4 -- Visual width of a tab
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.softtabstop = 4 -- Number of spaces a tab counts for while editing

vim.opt.relativenumber = false

-- Show text normally without concealing anything
vim.opt.conceallevel = 0

-- Show white space
vim.opt.list = true
vim.opt.listchars = { tab = "»»", trail = "·", nbsp = "␣" }

-- Minimal number of lines to keep above and below the cursor
vim.o.scrolloff = 10

-- Set the spellfile to be part of my config. The default file is saved in
-- `~/.local/share/nvim/site/spell/en.utf-8.add`
-- I don't want to have to re-add all the words if I ever switch to a new
-- environment
vim.opt.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"

-- Trying ui2 instead of noice
require("vim._core.ui2").enable({
  enable = true, -- Whether to enable or disable the UI.
  msg = { -- Options related to the message module.
    ---@type 'cmd'|'msg' Default message target, either in the
    ---cmdline or in a separate ephemeral message window.
    ---@type string|table<string, 'cmd'|'msg'|'pager'> Default message target
    ---or table mapping |ui-messages| kinds and triggers to a target.
    targets = "cmd",
    cmd = { -- Options related to messages in the cmdline window.
      height = 0.5, -- Maximum height while expanded for messages beyond 'cmdheight'.
    },
    dialog = { -- Options related to dialog window.
      height = 0.5, -- Maximum height.
    },
    msg = { -- Options related to msg window.
      height = 0.5, -- Maximum height.
      timeout = 5000, -- Time a message is visible in the message window.
    },
    pager = { -- Options related to message window.
      height = 1, -- Maximum height.
    },
  },
})
