" vim: filetype=vim
" File: init.vim
" Author: utkunx
" Description: coc focused cofing file
" Last Modified: January 19, 2020

call plug#begin()

" yeni denemeler

" === Editing Plugins === "
" Trailing whitespace highlighting & automatic fixing
Plug 'ntpeters/vim-better-whitespace'
" 43 - show whitespaces in red

" auto-close plugin
Plug 'rstacruz/vim-closer'

" Improved motion in Vim
Plug 'easymotion/vim-easymotion'

" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Denite - Fuzzy finding, buffer management
Plug 'Shougo/denite.nvim'

" Snippet support
"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'

" Print function signatures in echo area
Plug 'Shougo/echodoc.vim'



" 99 - keymap kisa yollar
Plug 'liuchengxu/vim-which-key'
" 99 - fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " File navigation, similar to Ctrl+p hotkey in vscode
Plug 'junegunn/fzf.vim'


" tester tester
Plug 'heavenshell/vim-jsdoc'
Plug 'pangloss/vim-javascript'
" Plug 'kkoomen/vim-doge'
" kullanmayi beceremedik



" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" 40 - colorscheme nighthtowl
Plug 'haishanh/night-owl.vim'
" 41 - rainbow parantesish
Plug 'junegunn/rainbow_parentheses.vim'
" 42 - statusline function color
Plug 'itchyny/lightline.vim'

" 44 - language highlighting
Plug 'sheerun/vim-polyglot'
" 45 - plus svelte highlighting
Plug 'evanleck/vim-svelte'
" 47 - vista, view and search LSP symbols...
Plug 'liuchengxu/vista.vim'

" 61 - testing testing
Plug 'honza/vim-snippets'
" 62 new thing
Plug 'mhinz/vim-startify'
" i3 config color
Plug 'mboughaba/i3config.vim'

" 40 - colorsheme
Plug 'rafi/awesome-vim-colorschemes'
Plug 'KeitaNakamura/neodark.vim'
Plug 'mswift42/vim-themes'
" 40 - colorsheme switcher bundle
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'

" ???
Plug 'Tpope/vim-commentary'
Plug 'Valloric/MatchTagAlways', {'for': 'html'}
Plug 'tpope/vim-surround'
" Plug 'qpkorr/vim-bufkill' bu ibnemi lan beni bozan ??
Plug 'airblade/vim-gitgutter'

" ???
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'

" 75 - Editorconfig file support. see https://editorconfig.org/
Plug 'editorconfig/editorconfig-vim'

" 44 - code colorfull export
Plug 'kristijanhusak/vim-carbon-now-sh'


" 10 - startup time debug
Plug 'dstein64/vim-startuptime'




call plug#end()

" colorscheme nova
set background=dark
set termguicolors
"5 yildiz
colorscheme ayu

" help key-notation

" General Settings
" Do not worry too much about what this does, I don't have a clue either :^)
filetype plugin indent on
syntax on


" 3 yildiz
"colorscheme spacecamp
"colorscheme spacecamp_lite

" otomatik dosyayi yenile
set autoread
au CursorHold * checktime

" Disable line numbers
set nonumber

" Don't show last command
set noshowcmd

" Yank and paste with the system clipboard
set clipboard=unnamed

" Hides buffers instead of closing them
set hidden

" === TAB/Space settings === "
" Insert spaces when TAB is pressed.
set expandtab

" Change number of spaces that a <Tab> counts for during editing ops
set softtabstop=2

" Indentation amount for < and > commands.
set shiftwidth=2

" do not wrap long lines by default
set nowrap

" Don't highlight current cursor line
set nocursorline

" Disable line/column number in status line
" Shows up in preview window when airline is disabled if not
set noruler

" Only one line for command line
set cmdheight=1

" === Completion Settings === "

" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'
" Scan the following dirs recursively for tags
let g:project_tags_dirs = ['kitty']
let g:syntastic_python_flake8_exec = 'flake8'
let g:ycm_python_binary_path = 'python'
set wildignore+==template.py
set wildignore+=tags
" set expandtab
set tabstop=4
"set shiftwidth=4
"set softtabstop=0
set smarttab
"python <<endpython
"import sys
"sys.path.insert(0, os.path.abspath('.'))
"import kitty
"endpython

" set clipboard^=unnamed
set encoding=utf-8
" set tabstop=2
" set expandtab
set autoindent
" set shiftwidth=2
set scrolloff=3
" set showcmd
set hidden
set wildmenu
set visualbell
set splitbelow
set ttyfast
" set ruler
set backspace=indent,eol,start
" set number
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
" set wrap
set linebreak
set nolist
" set shortmess+=c
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
"set cmdheight=2

set mouse=a

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" lightline config
set noshowmode
set laststatus=2
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = "echo"
" always show signcolumns
set signcolumn=yes

set noea		" Stop resizing split windows
set noswapfile		" Prevent vim from creating .swp files

" code export
vnoremap <F5> :CarbonNowSh<CR>


" WhichKey config begins...
"
" !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
"
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" time needed for display to come up
set timeoutlen=500

call which_key#register('<Space>', "g:which_key_map")

let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" Define prefix dictionary
let g:which_key_map =  {
      \ 'name' : '+Masterkeys' ,
      \ 'n' : [':CocCommand prettier.formatFile'     , '040-format-pretier']    ,
      \ '1' : [':$tabnew +terminal'  , 'new-tab-terminal-end']     ,
      \ '2' : ['tabnew'  , 'new-tab']     ,
      \ '3' : ['tabprev'  , 'previous-tab']     ,
      \ '4' : ['tabnext'  , 'next-tab']     ,
      \ '5' : ['new', 'horizontal-window']     ,
      \ '6' : ['vsplit', 'vertical-window']     ,
      \ '7' : [':so %', 'reload-config']     ,
      \ '8' : [':update', 'save-file1']     ,
      \ 'l' : ['<C-W>p', '???previous-window']     ,
      \ ';' : ['<C-W>w', '???previous???']     ,
      \ 'q' : ['cq', '???quit']     ,
      \ '[' : [':CocCommand explorer'     , 'coc-explorer']          ,
      \ ']' : [':Vista!!'     , 'vista-symbols']         ,
      \ '\' : [':Startify'     , 'home-screen']    ,
      \ 'g' : [':CocList --normal gstatus'     , 'Coclist-normal-gstatus']    ,
      \ 'a' : [':CocList diagnostics'     , 'Coclist-diagnostics']    ,
      \ 'e' : [':CocList extensions'     , 'Coclist-extensions']    ,
      \ 'c' : [':CocList commands'     , 'Coclist-commands']    ,
      \ 'o' : [':CocList outline'     , 'Coclist-outline']    ,
      \ 's' : [':CocList -I symbols'     , 'Coclist-symbols']    ,
      \ 'j' : [':CocNext'     , 'CocNext']    ,
      \ 'k' : [':CocPrev'     , 'CocPrev']    ,
      \ 'p' : [':CocListResume'     , 'CocListResume']    ,
      \ 'm' : [':CocCommand session.save'     , 'session.save']    ,
      \ ',' : [':CocCommand session.load'     , 'session.load']    ,
      \}

" suan cozum bulamam
nnoremap <silent> <space>' <C-w>q

" ozel kopyalari
"
let g:which_key_map['t'] = {
      \ 'name' : '+coc-sample' ,
      \ '[' : [':CocCommand explorer'     , 'coc-explorer']          ,
      \ ']' : [':Vista!!'     , 'vista-symbols']         ,
      \ '\' : [':Startify'     , 'startify']    ,
      \ 'g' : [':CocList --normal gstatus'     , 'Coclist-normal-gstatus']    ,
      \ 'a' : [':CocList diagnostics'     , 'Coclist-diagnostics']    ,
      \ 'e' : [':CocList extensions'     , 'Coclist-extensions']    ,
      \ 'c' : [':CocList commands'     , 'Coclist-commands']    ,
      \ 'o' : [':CocList outline'     , 'Coclist-outline']    ,
      \ 's' : [':CocList -I symbols'     , 'Coclist-symbols']    ,
      \ 'j' : [':CocNext'     , 'CocNext']    ,
      \ 'k' : [':CocPrev'     , 'CocPrev']    ,
      \ 'p' : [':CocListResume'     , 'CocListResume']    ,
      \ 'm' : [':CocCommand session.save'     , 'session.save']    ,
      \ ',' : [':CocCommand session.load'     , 'session.load']    ,
      \ }

" call plug#(coc#expandable()  

" Use `[g` and `]g` to navigate diagnostics

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" === Denite shorcuts === "
"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and
"   close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
nmap ; :Denite buffer -split=floating -winrow=1<CR>
nmap <leader>t :Denite file/rec -split=floating -winrow=1<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty -mode=normal<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
" Second level dictionaries:
" 'name' is a special field. It will define the name of the group, e.g., leader-f is the "+file" group.
" Unnamed groups will show a default empty string.

" =======================================================
" Create menus based on existing mappings
" =======================================================
" You can pass a descriptive text to an existing mapping.

let g:which_key_map.f = { 'name' : '+file' }

nnoremap <silent> <leader>fs :update<CR>
let g:which_key_map.f.s = 'save-file'

nnoremap <silent> <leader>fd :e $MYVIMRC<CR>
let g:which_key_map.f.d = 'open-vimrc'

nnoremap <silent> <leader>oq  :copen<CR>
nnoremap <silent> <leader>ol  :lopen<CR>
let g:which_key_map.o = {
      \ 'name' : '+open',
      \ 'q' : 'open-quickfix'    ,
      \ 'l' : 'open-locationlist',
      \ }

" utku svelte config
"au! BufNewFile,BufRead *.svelte set ft=html
" sanirim coc u bozdu


let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : ['resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : ['resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }
" WhichKey config finished...
"

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

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:lightline = {
      \ 'colorscheme': 'challenger_deep',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'method' : 'NearestMethodOrFunction'
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


let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]

" utku vista try 1
let g:vista_default_executive = 'ctags'

let g:vista_executive_for = {
  \ 'go': 'ctags',
  \ 'svelte': 'coc',
  \ 'javascript': 'coc',
  \ 'typescript': 'coc',
  \ 'javascript.jsx': 'coc',
  \ 'python': 'coc',
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ }

let g:startify_session_dir = '~/.vim/sessions'

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" let g:vista_fzf_preview = ['right:50%']

if executable('typescript-language-server')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'typescript-language-server',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
      \ 'whitelist': ['typescript', 'typescript.tsx'],
      \ })
endif



let g:colorscheme_switcher_keep_background = 1
let g:colorscheme_switcher_command = ':colorscheme'
augroup LightlineColorscheme
		  autocmd!
		  autocmd ColorScheme * call s:lightline_update()
		augroup END


		function! s:lightline_update()
		  if !exists('g:loaded_lightline')
		    return
		  endif
		  try
		    	let g:lightline.colorscheme =
		        \ substitute(substitute(g:colors_name, '-', '_', 'g'), '256.*', '', '')
		      call lightline#init()
		      call lightline#colorscheme()
		      call lightline#update()
		  catch
		  endtry
		endfunction



  " terminal config
" Maps ESC to exit terminal's insert mode
  if has('nvim')
    tnoremap <Esc> <C-\><C-n>
  endif

" also removed the number lines and got terminal buffers to automatically enter into insert mode with
 augroup neovim_terminal
    autocmd!

    " Enter Terminal-mode (insert) automatically
    autocmd TermOpen * startinsert

    " Disables number lines on terminal buffers
    autocmd TermOpen * :set nonumber norelativenumber
  augroup END


" press <esc> to cancel.
nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)
nmap ; <Plug>(coc-smartf-repeat)
nmap , <Plug>(coc-smartf-repeat-opposite)

augroup Smartf
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
  autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end


let g:rainbow_active = 1


let g:jsdoc_input_description = 1
let g:jsdoc_enable_es6 = 1
let g:jsdoc_underscore_private = 1


let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
"augroup javascript_folding
  "au!
  "au FileType javascript setlocal foldmethod=syntax
"augroup END
