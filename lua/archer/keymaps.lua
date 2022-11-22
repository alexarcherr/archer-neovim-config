local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-- Системный буфер обмена shift - Y
map('v', 'S-Y', '"+y', {})

-- Типа 'Нажимает' на ESC при быстром нажатии jj, чтобы не тянутся
map('i', 'jj', '<Esc>', {noremap = true})

map('n', '<Up>', ':echoe "Use k"<CR>', default_opts)
map('n', '<Down>', ':echoe "Use j"<CR>', default_opts)
map('n', '<Left>', ':echoe "Use h"<CR>', default_opts)
map('n', '<Right>', ':echoe "Use l"<CR>', default_opts)

-- Автоформат + сохранение по CTRL-s , как в нормальном, так и в insert режиме
map('n', '<C-s>', ':Autoformat<CR>:w<CR>',  default_opts)
map('i', '<C-s>', '<esc>:Autoformat<CR>:w<CR>', default_opts)
-- Переключение вкладок с помощью TAB или shift-tab (akinsho/bufferline.nvim)
map('n', '<Tab>', ':BufferLineCycleNext<CR>', default_opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', default_opts)
-- fzf
map('n', '<C-a>', [[ <cmd>lua require('telescope.builtin').find_files()<cr> ]], default_opts)
map('n', '<C-p>', [[ <cmd>lua require('telescope.builtin').buffers()<cr> ]], default_opts)

-- fn keys F1 .. F12
-- По F1 очищаем последний поиск с подсветкой
map('n', '<F1>', ':nohl<CR>', default_opts)
-- shift + F1 = удалить пустые строки
map('n', '<S-F1>', ':g/^$/d<CR>', default_opts)
-- <F2> для временной вставки из буфера, чтобы отключить авто идент
vim.o.pastetoggle='<F2>'
-- <F3> перечитать конфигурацию nvim Может не работать, если echo $TERM  xterm-256color
map('n', '<F3>', ':so ~/.config/nvim/init.lua<CR>:so ~/.config/nvim/lua/plugins.lua<CR>:so ~/.config/nvim/lua/settings.lua<CR>:so ~/.config/nvim/lua/keymaps.lua<CR>', { noremap = true })
-- <F4> Поиск слова под курсором
map('n', '<F4>', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], default_opts)
-- <S-F4> Поиск слова в модальном окошке
map('n', '<S-F4>', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], default_opts)
-- <F5> разные вариации нумераций строк, можно переключаться
map('n', '<F5>', ':exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', default_opts)
-- <F6> дерево файлов.
map('n', '<F6>', ':NvimTreeToggle<CR>NvimTreeRefresh<CR>', default_opts)
-- <F8>  Показ дерева классов и функций, плагин majutsushi/tagbar
map('n', '<F8>', ':TagbarToggle<CR>', default_opts)
-- <F11> Проверка орфографии  для русского и английского языка
map('n', '<F11>', ':set spell!<CR>', default_opts)
map('i', '<F11>', '<C-O>:set spell!<CR>', default_opts)

map('n', '<CS-d>', 'i<C-R>=strftime(\'%Y-%m-%d %H:%M:%S\')<CR>', default_opts)
map('i', '<CS-D>', '<C-R>=strftime(\'%Y-%m-%d %H:%M:%S\')<CR>', default_opts)

-- test mac full F13-F19 keyboard
map('i', '<F19>', '<C-R>=strftime(\'%Y-%m-%d %H:%M:%S\')<CR>', default_opts)

-- key_mapper('n', '<C-p>', ':lua require"telescope.builtin".find_files()<CR>')
-- key_mapper('n', '<leader>fs', ':lua require"telescope.builtin".live_grep()<CR>')
-- key_mapper('n', '<leader>fh', ':lua require"telescope.builtin".help_tags()<CR>')
-- key_mapper('n', '<leader>fb', ':lua require"telescope.builtin".buffers()<CR>')


--
-- key_mapper('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
-- key_mapper('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
-- key_mapper('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
-- key_mapper('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
-- key_mapper('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
-- key_mapper('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
-- key_mapper('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
-- key_mapper('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
-- key_mapper('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
-- key_mapper('n', '<leader>af', ':lua vim.lsp.buf.code_action()<CR>')
-- key_mapper('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
