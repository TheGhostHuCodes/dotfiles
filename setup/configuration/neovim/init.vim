packadd minpac
call minpac#init()

" Have minpac manage itself. minpac must have {'type': 'opt'} so that it can
" be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Add plugins.
call minpac#add('junegunn/fzf')
call minpac#add('radenling/vim-dispatch-neovim')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-dispatch')
call minpac#add('w0rp/ale')

" Add optional plugins.

" Convenience functions for minpac commands.
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

nnoremap <C-p> :<C-u>FZF<CR>
set listchars=eol:¬,tab:>·,trail:·,extends:>,precedes:<,space:␣

" For JavaScript files, use `eslint` (and only eslint).
let g:ale_linters = {
\   'javascript': ['eslint'],
\ }

" Leave ALE sign column on all the time.
let g:ale_sign_column_always = 1

" Mappings in the style of unimpaired-next.
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)
