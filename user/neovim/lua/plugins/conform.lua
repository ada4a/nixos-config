return {
  "stevearc/conform.nvim",

  opts = {
    -- Define your formatters
    formatters_by_ft = {
      c = { "clang-format" },
      javascript = { "prettier" },
      json = { "prettier" },
      lua = { "stylua" },
      nix = { "alejandra" },
      python = { "isort", "lack" },
      zsh = { "beautysh" },
    },
    -- Customize formatters
    formatters = {},
  },
}
