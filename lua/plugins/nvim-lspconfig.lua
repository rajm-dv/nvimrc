vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  severity_sort = true,
  float = {
    border = "rounded",
    focusable = true,
    source = true,
  },
})

return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    config = function()
      vim.lsp.config("lua_ls", require("lsps.lua_ls"))
      vim.lsp.config("pylsp", require("lsps.py_ls"))
      vim.lsp.config("ts_ls", require("lsps.ts_ls"))
      vim.lsp.config("clangd", require("lsps.clangd_ls"))
      vim.lsp.config("gopls", require("lsps.go_ls"))
      vim.lsp.config("bashls", require("lsps.bash_ls"))
      vim.lsp.config("rust_analyzer", require("lsps.rust_analyzer"))
      vim.lsp.config("tailwincss", require("lsps.tailwindcss_ls"))
      vim.lsp.config("prismals", require("lsps.prisma_ls"))

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Define the keyword under cursor" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
    end,
  },
}
