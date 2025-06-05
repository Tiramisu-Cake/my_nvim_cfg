local M = {}
local o = vim.opt
o.number = true -- show line numbers
o.termguicolors = true --enable 24-bit colors
o.expandtab = true 
o.shiftwidth = 4 
o.softtabstop = 4 
o.autoindent = true
o.smartindent = true

vim.filetype.add({
  filename = {
    ["dockerfile.dev"] = "dockerfile",  -- говорим, что этот файл — dockerfile
  },
})
vim.cmd [[
  syntax on
  filetype plugin indent on
]]

return M

