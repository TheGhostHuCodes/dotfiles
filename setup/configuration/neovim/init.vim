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

" Add optional plugins.

" Convenience functions for minpac commands.
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

nnoremap <C-p> :<C-u>FZF<CR>
set listchars=eol:¬,tab:>·,trail:·,extends:>,precedes:<,space:␣
