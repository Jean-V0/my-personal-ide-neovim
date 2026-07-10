local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.map.on_attach.default(bufnr)

    -- custom mappings
    vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent,        opts("Up"))
    vim.keymap.set("n", "<C-r>", api.tree.change_root_to_node,          opts("CD"))
    vim.keymap.set("n", "?",     api.tree.toggle_help,                  opts("Help"))
  end

vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- optionally enable 24-bit colour
    vim.opt.termguicolors = true

    -- empty setup using defaults
    require("nvim-tree").setup(
      {
        on_attach = my_on_attach,
      }
    )

    -- OR setup with a config

    ---@type nvim_tree.config
    local config = {
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    }  
  end,
}
