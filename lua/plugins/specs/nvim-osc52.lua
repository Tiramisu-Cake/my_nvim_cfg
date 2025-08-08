local M = {
  "ojroques/nvim-osc52",
  lazy = false,  -- грузим сразу
  config = function()
    require("osc52").setup{
      max_length       = 0,     -- 0 = без лимита по длине
      silent           = false, -- показывать сообщение об копировании
      trim             = false,
      tmux_passthrough = true,  -- если вы в tmux
    } 
    vim.api.nvim_create_augroup("OSCYank", { clear = true })
    vim.api.nvim_create_autocmd("TextYankPost", {
      group = "OSCYank",
      callback = function(ev)
        if ev.operator == "y" then
          require("osc52").copy_register(ev.regname)
        end
      end,
    })
  end,
}

return M
