return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      opts = {
        stages = "fade",
        timeout = 3000,
        render = "compact",
      },
    },
  },
  opts = {
    lsp = {
      progress = { enabled = false }, -- handled by fidget.nvim
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true,       
      command_palette = true,     
      long_message_to_split = true, 
      inc_rename = false,        
    },
  },
}
