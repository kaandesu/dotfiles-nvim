return {
  -- {
  --   "zeioth/garbage-day.nvim",
  --   dependencies = "neovim/nvim-lspconfig",
  --   event = "VeryLazy",
  -- },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "gopls",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
      })
    end,
  },
  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        volar = {
          init_options = {
            vue = {
              hybridMode = true,
            },
          },
        },
        vtsls = {},
      },
      inlay_hints = { enabled = false },
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function() end,
  },
  {
    "gleam-lang/gleam.vim",
  },
  {
    "ziglang/zig.vim",
  },
  { "rafamadriz/friendly-snippets", enabled = false },
}
