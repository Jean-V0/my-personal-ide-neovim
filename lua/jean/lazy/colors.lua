function ConfigMyColor(color)
	vim.cmd.colorscheme(color)
end

return {
  { 
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        transparent_background = false,
      })
      ConfigMyColor('catppuccin');
    end
  }
}
