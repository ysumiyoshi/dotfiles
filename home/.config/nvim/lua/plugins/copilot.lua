return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      copilot_node_command = vim.fn.expand(vim.fn.system("nodenv root"):gsub("\n", "") .. "/versions/22.13.1/bin/node"),
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-y>",
        }
      },
      panel = { enabled = true },
      filetypes = {
        yaml = true,
      },
    },
    config = function(_, opts)
      require("copilot").setup(opts)
    end,
  },
}
