return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "hs" }, -- allow `hs` global
            },
          },
        },
      },
    },
  },
}
