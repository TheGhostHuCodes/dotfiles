packadd minpac
call minpac#init()

" Have minpac manage itself. minpac must have {'type': 'opt'} so that it can
" be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Add plugins.
call minpac#add('janko-m/vim-test')
call minpac#add('junegunn/fzf')
call minpac#add('mhinz/vim-grepper')
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
let mapleader = ","
set clipboard=unnamed

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

" Grepper configuration.
let g:grepper = {}
let g:grepper.tools = ['rg', 'git', 'grep']
nnoremap <Leader>g :Grepper -tool rg<CR>
" Search for the current word.
nnoremap <Leader>* :Grepper -cword -noprompt<CR>
" Search for the current selection.
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" vim-test configuration.
" Send results of tests to the quickfix list.
let test#strategy = "dispatch"

" Neovim terminal mode settings.
if has('nvim')
    " Remap Terminal mode escape to <leader><Esc>.
    tnoremap <leader><Esc> <C-\><C-n>
    " Highlight terminal cursor position inside and outside of Terminal mode.
    highlight! link TermCursor Cursor
    highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

" Neovim window switching. Note on MacOS this requires you to set the Option
" key to Esc+ under Preferences -> Profiles -> Text
nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l
if has('nvim')
    tnoremap <M-h> <c-\><c-n><c-w>h
    tnoremap <M-j> <c-\><c-n><c-w>j
    tnoremap <M-k> <c-\><c-n><c-w>k
    tnoremap <M-l> <c-\><c-n><c-w>l
endif

" Preserve last search and cursor position after command.
function! <SID>Preserve(command)
    " Save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Execute command.
    execute a:command
    " Restore previous search history, and cursor position.
    let @/=_s
    call cursor(l, c)
endfunction

" Automatically remove trailing whitespace before saving.
function! <SID>StripTrailingWhitespaces()
    call <SID>Preserve("%s/\\s\\+$//e")
endfunction
" Whitelist of files that can have trailing whitespace removed.
autocmd FileType c,cpp,haskell,java,markdown,php,ruby,python,yaml autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
