local specs = {
	"plugins.specs.treesitter",
	"plugins.specs.onedark-theme",
        "plugins.specs.cmp",
        "plugins.specs.lspconfig",
}

-- Bootstrapping lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=main", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Загружаем таблицы из каждого specs-файла
local plugin_list = {}
for _, spec in ipairs(specs) do
  local ok, tbl = pcall(require, spec)
  if ok and type(tbl) == "table" then
    vim.list_extend(plugin_list, vim.tbl_islist(tbl) and tbl or { tbl })
  end
end

-- Пакер + плагины
vim.list_extend(plugin_list, {
    { "preservim/nerdtree", lazy = false, cmd = "NERDTreeToggle" },
    { "Vimjas/vim-python-pep8-indent", ft = "python"},
})

require("lazy").setup(plugin_list)
