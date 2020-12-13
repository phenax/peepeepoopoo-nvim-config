local utils = require 'utils'
local nmap = utils.nmap

local ide = {}

function ide.plugins(use)
  use 'scrooloose/nerdcommenter'
  use 'Townk/vim-autoclose'
  use 'tpope/vim-surround'
  use 'wellle/targets.vim'
  use 'easymotion/vim-easymotion'

  -- Syntax
  use 'sheerun/vim-polyglot' -- All syntax highlighting
  use 'norcalli/nvim-colorizer.lua' -- Hex/rgb colors
  use 'tpope/vim-markdown' -- markdown
  use 'jtratner/vim-flavored-markdown' -- markdown

  -- Languages
  use 'dart-lang/dart-vim-plugin'
  use 'rescript-lang/vim-rescript'
  use 'preservim/tagbar'

  -- Folding
  use 'wellle/context.vim'

  -- Search todo,fixme, etc comments
  use 'gilsondev/searchtasks.vim'

  --use 'puremourning/vimspector'
end

function ide.configure()
  g.searchtasks_list = {"TODO", "FIXME"} -- :SearchTasks
  g.context_enabled = 0

  -- Colorizer
  require'colorizer'.setup()

  -- Open term in vim
  nmap('<localleader>tn', ':split term://node<cr>')
  nmap('<localleader>tt', ':split term://zsh<cr>')
  fn.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

  -- Sessions
  nmap('<leader>sw', ':mksession! .vim.session<cr>')
  nmap('<leader>sl', ':source .vim.session<cr>')

  -- Code navigation/searching
  nmap('<leader>tc', ':TagbarToggle<cr>')
  nmap('<c-\\>', ':noh<CR>')
  exec [[map <localleader> <Plug>(easymotion-prefix)]] -- <space>c

  -- Folding
  nmap('<S-Tab>', 'zR')
  nmap('zx', 'zo')
  nmap('zc', 'zc')
  nmap('zf', ':ContextToggle<CR>')
end

return ide

