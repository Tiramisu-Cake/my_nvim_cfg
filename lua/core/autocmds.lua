local M = {}

local nerdtree_grp = vim.api.nvim_create_augroup("NERDTreeAutoCWD", { clear = true })

function M.setup_nerdtree_autocmds()
  vim.api.nvim_create_autocmd("VimEnter", {
  group = nerdtree_grp,
  callback = function()
    -- если передан хотя бы один аргумент (файл/папка)
    if vim.fn.argc() > 0 then
      -- первый аргумент — наш файл
      local target = vim.fn.argv(0)
      -- получаем абсолютный путь до папки
      local dir = vim.fn.fnamemodify(target, ":p:h")
      -- меняем рабочую директорию
      vim.cmd("cd " .. vim.fn.fnameescape(dir))
      -- открываем NERDTree и сразу находим файл
      vim.cmd("NERDTreeFind")
      -- возвращаем фокус в окно с файлом (если нужно)
      vim.cmd("wincmd p")
    else
      -- если без аргументов — просто открываем NERDTree в CWD
      vim.cmd("NERDTree")
    end
  end,
})

  vim.api.nvim_create_autocmd("DirChanged", {
    group   = nerdtree_grp,
    pattern = "*",
    callback = function()
      if vim.fn.exists("t:NERDTreeBufName") == 1 then
        vim.cmd("silent! NERDTreeCWD")
      end
    end,
  })
end
M.setup_nerdtree_autocmds()

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
