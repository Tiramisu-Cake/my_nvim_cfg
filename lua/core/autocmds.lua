local M = {}

function M.setup_diagnostics_float()
  vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })
  vim.api.nvim_create_autocmd("CursorHold", {
    group = "DiagnosticFloat",
    callback = function()
      vim.diagnostic.open_float(nil, { focusable = false })
    end,
  })
end
M.setup_diagnostics_float()

return M
