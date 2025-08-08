return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local util         = require("lspconfig.util")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local caps         = cmp_nvim_lsp.default_capabilities()

    require("lspconfig").pyright.setup {
      cmd       = { "pyright-langserver", "--stdio" },
      root_dir  = util.root_pattern("pyproject.toml", ".git"),
      settings  = {
          python = {
              analysis = {
                  typeCheckingMode       = "basic",
                  autoSearchPaths        = true,
                  useLibraryCodeForTypes = true,
                  diagnosticMode         = "workspace",
                  exclude                = { "**/build", "**/dist", "**/__pycache__" },
                  reportUnusedVariable   = true,
                  reportUnusedImport     = true,
                  reportUnusedFunction   = true,
                  reportUnusedClass      = true,
                  reportUnusedParameter  = true,
                  autoImportCompletions = true,
                  autoSearchPaths      = true,
              },
          },
      },
      capabilities = caps,
      autostart    = true,
    }

    vim.diagnostic.config {
      float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
      signs            = true,
      underline        = true,
      update_in_insert = false,
    }
  end,
}
