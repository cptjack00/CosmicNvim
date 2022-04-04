local augroup_name = 'CosmicNvim'
local group = vim.api.nvim_create_augroup(augroup_name, { clear = true })
vim.api.nvim_create_autocmd('VimResized', {
  command = 'tabdo wincmd =',
  group = group,
})

vim.cmd([[
  command! CosmicUpdate lua require('cosmic.utils').update()
  command! CosmicReload lua require('cosmic.utils').reload_user_config(true)
  command! CosmicReloadSync lua require('cosmic.utils').reload_user_config_sync()
  command! LspFormat lua vim.lsp.buf.formatting()
  command! DisableVirtualText lua vim.diagnostic.config({ virtual_text = false })
  command! SetTexMapping lua WhichKeyTex()
]])

-- uncomment this if you want to open nvim with a dir
-- vim.cmd [[ autocmd BufEnter * if &buftype != "terminal" | lcd %:p:h | endif ]]

-- Use relative & absolute line numbers in 'n' & 'i' modes respectively
-- vim.cmd[[ au InsertEnter * set norelativenumber ]]
-- vim.cmd[[ au InsertLeave * set relativenumber ]]

-- Don't show any numbers inside terminals
vim.cmd [[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]]

-- Open a file from its last left off position
vim.cmd [[ au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]
-- File extension specific tabbing
vim.cmd [[ autocmd Filetype cpp,c,python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 ]]
--
--
vim.cmd [[ au BufEnter * DisableVirtualText ]]

vim.cmd [[ au BufEnter * imap <silent><script><expr> <C-J> copilot#Accept("\<CR>") ]]
vim.cmd [[ autocmd Filetype tex,bib SetTexMapping ]]

local wkl = require("which-key")
local wkli = require("cosmic.plugins.which-key")
function WhichKeyTex()
  wkl.register(wkli.tex_mappings, wkli.texopts)
end
