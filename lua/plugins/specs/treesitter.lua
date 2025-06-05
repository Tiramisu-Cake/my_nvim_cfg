return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
	"json",
	"jsonc", 
	"lua", 
	"python", 
	"bash",
	"dockerfile"
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = false },

   -- какие ещё фичи можно юзать
     incremental_selection = {
       enable = true,
       keymaps = {
         init_selection = "gnn",      -- начать селекшн
         node_incremental = "grn",    -- расширить до родителя
         node_decremental = "grm",    -- сузить
       },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer", -- вокруг функции
            ["if"] = "@function.inner", -- внутри функции
            ["ac"] = "@class.outer",    -- вокруг класса
            ["ic"] = "@class.inner",    -- внутри класса
          },
        },
	swap = {
          enable = true,
          swap_next = { ["<leader>a"] = "@parameter.inner" },
          swap_previous = { ["<leader>A"] = "@parameter.inner" },	
        },
      },
    }
  end,
}
  
   
