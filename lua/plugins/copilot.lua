return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  opts = {
    suggestion = { enabled = true, keymap = { accept = "<Tab>" } },
    panel = { enabled = true, keymap = { accept = "<CR>" } },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
