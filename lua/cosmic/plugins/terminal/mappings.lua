local map = require('cosmic.utils').map

map('n', '<C-t>', ':FloatermToggle<CR>')
map('t', 'jk', [[<C-\><C-n>]])
map('t', 'JK', [[<C-\><C-n>:lua require('cosmic.utils').close_buffer() <CR>])
map('t', '<C-w>l', [[<C-\><C-n>:FloatermNext<CR>]])
map('t', '<C-w>h', [[<C-\><C-n>:FloatermPrev<CR>]])
map('t', '<C-w>n', [[<C-\><C-n>:FloatermNew<CR>]])
map('t', '<C-w>c', [[<C-\><C-n>:FloatermKill<CR>]])
