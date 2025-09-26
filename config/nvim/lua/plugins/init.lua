return {
  -- tokyonight theme
  {
    'folke/tokyonight.nvim',
    config = function()
    vim.cmd.colorscheme("tokyonight-night")
    end
  },

  -- Lualine for a beautiful statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'tokyonight',
          icons_enabled = true,
        }
      })
    end
  },

  -- 語法檢查, 錯誤就用:TSInstall lua
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

  -- 區段指示
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'VeryLazy',
    config = function()
      local highlight = {
        'CursorColumn',
        'Whitespace',
      }
      require('ibl').setup({
        indent = { highlight = highlight, char = '' },
        whitespace = {
          highlight = highlight,
          remove_blankline_trail = false,
        },
        scope = { enabled = false },
      })
    end,
  },

  -- autopairs
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },

  -- explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {}
    end
  },

  -- 自動補齊

  {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  opts = {
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'default' },
    appearance = { nerd_font_variant = 'mono' },
    completion = { documentation = { auto_show = false } },
    sources = { default = { 'lsp', 'path', 'snippets', 'buffer' }, },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
  }

}
