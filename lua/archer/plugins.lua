-- Automatically install packer
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
-- packer.init({
--     display = {
--       open_fn = function()
--         return require('packer.util').float({ border = 'single' })
--       end
--     }
--   }
-- )

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Color schemes
    use 'ii14/onedark.nvim'
    -- use 'bluz71/vim-nightfly-colors'
    use 'ellisonleao/gruvbox.nvim'  -- gruvbox port for neovim
    -- use {'dracula/vim', as = 'dracula'}

    --- Информационная строка внизу
    use { 'nvim-lualine/lualine.nvim',
      requires = 'nvim-tree/nvim-web-devicons',
      config = function()
        require('lualine').setup()
      end,
    }

    -- Tabs
    use { 'akinsho/bufferline.nvim',
      tag = 'v3.*',
      requires = 'nvim-tree/nvim-web-devicons',
      config = function() require'bufferline'.setup {} end
    }


    -- Navigation

    -- File namager
    use { 'nvim-tree/nvim-tree.lua',
      requires = 'nvim-tree/nvim-web-devicons',
      cmd = "NvimTreeToggle",
      config = function() require'nvim-tree'.setup {} end
    }


    -- Навигация внутри файла по классам и функциям
    use 'majutsushi/tagbar'
    -- Замена fzf и ack
    use { 'nvim-telescope/telescope.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = function() require'telescope'.setup {} end 
    }


    -----------------------------------------------------------
    -- LSP и автодополнялка
    -----------------------------------------------------------

    -- Highlight, edit, and navigate code using a fast incremental parsing library
    -- When nvim-treesitter updates, there might be breaking changes to corresponding parsers being used.
    -- Make sure parsers are automatically updated whenever nvim-treesitter is installed/updated.
    use({
      "nvim-treesitter/nvim-treesitter",
      run = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
      end,
      -- run = ':TSUpdate', opt = true 
    })

    -- Collection of configurations for built-in LSP client
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    -- Автодополнялка
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'saadparwaiz1/cmp_luasnip'
    --- Автодополнлялка к файловой системе
    use 'hrsh7th/cmp-path'
    -- Snippets plugin
    use 'L3MON4D3/LuaSnip'


    -- HTML и CSS
    -- Подсвечивает закрывающий и откры. тэг. Если, где-то что-то не закрыто, то не подсвечивает.
    use 'idanarye/breeze.vim'
    -- Закрывает автоматом html и xml тэги. Пишешь <h1> и он автоматом закроется </h1>
    use 'alvan/vim-closetag'
    -- Подсвечивает #ffffff
    use 'ap/vim-css-color'

    -----------------------------------------------------------
    -- РАЗНОЕ
    -----------------------------------------------------------
    -- Даже если включена русская раскладка vim команды будут работать
    use 'powerman/vim-plugin-ruscmd'
    -- 'Автоформатирование' кода для всех языков
    use 'Chiel92/vim-autoformat'
    -- ]p - вставить на строку выше, [p - ниже, [<space> and ]<space> which create blank lines above and below the current line respectively
    use 'tpope/vim-unimpaired'
    --- popup окошки
    use 'nvim-lua/popup.nvim'
    use 'kylechui/nvim-surround'
    -- Считает кол-во совпадений при поиске
    use 'google/vim-searchindex'
    -- Стартовая страница, если просто набрать vim в консоле
    use 'mhinz/vim-startify'
    -- Комментирует по gc все, вне зависимости от языка программирования
    use { 'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end }
    -- Обрамляет строку в теги по ctrl- y + ,
    use 'mattn/emmet-vim'
    -- Закрывает автоматом скобки
    use 'cohama/lexima.vim'

    -- Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
    -- Load on a combination of conditions: specific filetypes or commands
    -- Also run code after load (see the "config" key)
    use {
      'dense-analysis/ale',
      ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
      cmd = 'ALEEnable',
      config = 'vim.cmd[[ALEEnable] ]'
    }


    -- git changes colorization 
    use { 'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' }
    }

    -- Fugitive for Git
    use { 'tpope/vim-fugitive' }

    use {'andymass/vim-matchup', event = 'VimEnter'}

    -- for zettelkasten
    use {'tibabit/vim-templates'}

end)

--[[

  use {'michal-h21/vim-zettel',
    requires = {'vimwiki/vimwiki','junegunn/fzf','junegunn/fzf.vim'}
  }

  -- run code inide vim
  use {'jpalardy/vim-slime'}

  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Plugins can have post-install/update hooks
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
  
]]--
