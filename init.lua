local current_path = os.getenv "PATH"
local new_path = "/home/christopher/miniconda3/bin:" .. current_path
vim.loop.os_setenv("PATH", new_path)
-- local enable_providers = {
--   "python3_provider",
--   "node_provider",
--   -- and so on
-- }
-- for _, plugin in pairs(enable_providers) do
--   vim.g["loaded_" .. plugin] = nil
--   vim.cmd("runtime " .. plugin)
-- end
vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/LuaSnip"
-- vim.g.python3_host_prog = "/home/christopher/miniconda3/bin/python"
vim.cmd [[
" Use Tab to expand and jump through snippets
" imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
" Expand or jump in insert mode
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 

" Jump forward through tabstops in visual mode
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>' 
" Cycle forward through choice nodes with Control-f (for example)
imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
smap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
]]
