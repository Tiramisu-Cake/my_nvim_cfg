return {
  "neovim/nvim-lspconfig",
  dependencies = { 
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp" },
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local configs      = require("lspconfig.configs")
    local util         = require("lspconfig.util")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local root = util.root_pattern("pyproject.toml", ".git")

    -- 1) Локальный Pyright
    if not configs.pyright_local then
      configs.pyright_local = {
        default_config = {
          cmd       = { "pyright-langserver", "--stdio" },
          filetypes = { "python" },
          root_dir  = root,
          settings  = {
            python = {
              analysis = {
                typeCheckingMode       = "basic",
                autoSearchPaths        = true,
                useLibraryCodeForTypes = true,
                diagnosticMode         = "workspace",
                exclude = { "**/build", "**/dist", "**/__pycache__" },
                reportUnusedVariable = true,
                reportUnusedImport = true,
                reportUnusedFunction = true,
                reportUnusedClass = true,
                reportUnusedParameter = true,
              },
            },
          },
        },
      }
    end

    local lspconfig    = require("lspconfig")
    local caps = cmp_nvim_lsp.default_capabilities()
    lspconfig.pyright_local.setup({
      capabilities = caps,
      autostart    = true,
    })

    -- 3) Общие опции диагностики
    vim.diagnostic.config({
      float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
      signs            = true,
      underline        = true,
      update_in_insert = false,
    })
  end,
}
