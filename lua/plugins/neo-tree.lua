return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function()
    -- vim.cmd([[:Neotree toggle<CR>]])
    return {
      close_if_last_window = true,
      window = {
        position = "right",
      },

      filesystem = {
        hijack_netrw_behavior = "disabled",
        -- "open_current",
        -- "disabled",
      },
      buffers = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
      },
    }
  end,
}
