return {
  'hrsh7th/nvim-cmp',
   dependecies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/vim-vsnip',      -- снаппеты
    'hrsh7th/cmp-vsnip',      -- мостик для vsnip в nvim-cmp
  },
  config = function()
    local cmp = require('cmp')
    cmp.setup {
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip'    },  -- теперь подключится
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>']      = cmp.mapping.confirm({ select = true }),
      }),
      completion = {
          autocomplete = { require('cmp').TriggerEvent.TextChanged },
      },
    }
  end,
}
