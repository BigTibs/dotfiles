return {
  "folke/snacks.nvim",
  opts = {
    scroll = { enabled = false },
    dashboard = {
      preset = {
        header = [[
███╗   ██╗██╗ ██████╗ ██████╗     ████████╗██╗██████╗  ██████╗ 
████╗  ██║██║██╔════╝██╔═══██╗    ╚══██╔══╝██║██╔══██╗██╔═══██╗
██╔██╗ ██║██║██║     ██║   ██║       ██║   ██║██████╔╝██║   ██║
██║╚██╗██║██║██║     ██║   ██║       ██║   ██║██╔══██╗██║   ██║
██║ ╚████║██║╚██████╗╚██████╔╝       ██║   ██║██████╔╝╚██████╔╝
╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═════╝        ╚═╝   ╚═╝╚═════╝  ╚═════╝ 
        ]],
      },
    },
    picker = {
      sources = {
        explorer = {
          auto_close = true,
          layout = {
            preview = true,
            preset = "vscode",
            layout = { position = "right" },
          },
        },
        buffers = {
          focus = "list",
        },
      },
    },
  },
}
