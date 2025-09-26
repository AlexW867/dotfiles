vim.o.mouse = ''
vim.o.compatible = false
vim.o.fileencoding = 'utf-8'
vim.o.clipboard = 'unnamedplus'
vim.o.virtualedit = 'block'
vim.opt.iskeyword:append('-')
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
--vim.o.wrap = false
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.list = true
vim.o.undolevels = 200
vim.opt.shada = "!,'100,<50,s10"
vim.opt.listchars = {tab = '» ', extends = '›', precedes = '‹', nbsp = '·', trail = '·'}
vim.o.colorcolumn = '80'
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.equalalways = false
--vim.o.showtabline = 2

-- 複製的時候要切換顯是純文字關閉行號與輔助線
-- 快捷鍵用 \v
vim.keymap.set('n', '<leader>v', function()
  -- 判斷 'number' 選項的當前狀態並切換
  if vim.o.number then
    vim.o.number = false
    vim.o.relativenumber = false
  else
    vim.o.number = true
    vim.o.relativenumber = true
  end

  vim.cmd('IBLToggle')
end, { noremap = true, silent = true, desc = 'Toggle visibility' })

-- 設定 nvim-tree 的快捷鍵
vim.keymap.set('n', '<leader>e', '<Cmd>NvimTreeToggle<CR>', {
  desc = 'Toggle file explorer'
})

require("config.lazy")

