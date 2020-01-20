" vim: filetype=vim


" File: init.vim
" Author: utkunx
" Description: coc focused cofing file 
" Last Modified: January 19, 2020


call plug#begin()

" 40 - colorscheme nighthtowl		
Plug 'haishanh/night-owl.vim'
" 42 - statusline function color
Plug 'itchyny/lightline.vim'
" 44 - language highlighting
Plug 'sheerun/vim-polyglot'
" 61 - testing testing
Plug 'honza/vim-snippets'
" 62 new thing
Plug 'mhinz/vim-startify'
" svelte
Plug 'evanleck/vim-svelte'

Plug 'Tpope/vim-commentary'
Plug 'Valloric/MatchTagAlways', {'for': 'html'}
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'qpkorr/vim-bufkill'
Plug 'airblade/vim-gitgutter'

Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" very important...
" help key-notation

" General Settings
" Do not worry too much about what this does, I don't have a clue either :^)
filetype plugin indent on
syntax on
set encoding=utf-8
set tabstop=2
set expandtab
set autoindent
set shiftwidth=2
set scrolloff=3
set showcmd
set hidden
set wildmenu
set visualbell
set splitbelow
set ttyfast
set ruler
set backspace=indent,eol,start
set number
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set wrap
set linebreak
set nolist
set shortmess+=c
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

set mouse=a

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" lightline config
set noshowmode
set laststatus=2

" always show signcolumns
set signcolumn=yes

set termguicolors	" make vim use 24-bit colors in supported terminals
set background=light	" make the colorscheme use a light variant
colorscheme night-owl	" set the colorscheme to base16-tomorrow

set noea		" Stop resizing split windows
set noswapfile		" Prevent vim from creating .swp files

" set space as my leader key
let mapleader = "\<Space>"

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" Use <c-space>: to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

nnoremap <silent> <space>g :<C-u>CocList --normal gstatus<CR>
" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" utku shourtcut
" set the mapping to open Startify
nnoremap <silent> <space>x :Startify<CR>




function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'nightowl',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \ },
      \ }


" Use auocmd to force lightline update.                                                                             
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}%{StatusDiagnostic()}



" Startify header
let g:startify_custom_header = [
            \ '       ______   __                  __     __  __               ',
            \ '      /      \ |  \                |  \   |  \|  \              ',
            \ '     |  $$$$$$\| $$   __  __    __ | $$   | $$ \$$ ______ ____  ',
            \ '     | $$___\$$| $$  /  \|  \  |  \| $$   | $$|  \|      \    \ ',
            \ '      \$$    \ | $$_/  $$| $$  | $$ \$$\ /  $$| $$| $$$$$$\$$$$\',
            \ '      _\$$$$$$\| $$   $$ | $$  | $$  \$$\  $$ | $$| $$ | $$ | $$',
            \ '     |  \__| $$| $$$$$$\ | $$__/ $$   \$$ $$  | $$| $$ | $$ | $$',
            \ '      \$$    $$| $$  \$$\ \$$    $$    \$$$   | $$| $$ | $$ | $$',
            \ '       \$$$$$$  \$$   \$$ _\$$$$$$$     \$     \$$ \$$  \$$  \$$',
            \ '                         |  \__| $$                             ',
            \ '                          \$$    $$                             ',
            \ '                           \$$$$$$                              ',
            \ ]



