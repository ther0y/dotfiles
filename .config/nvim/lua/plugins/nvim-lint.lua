return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      markdown = { "markdownlint" },
    },
    linters = {
      markdownlint = {
        -- args = {
        --   "--config",
        --   vim.fn.expand("~/.markdownlint.json"),
        -- },
      },
    },
  },
}
