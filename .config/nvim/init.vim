" utku master neovim init
" build upon coc-extensions
" hope you would like...
"
call plug#begin()

" 10 - coc - plugin manager
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 20 - file browser in nvim setup
" 21 - nerdtree
Plug 'preservim/nerdtree'
" 22 - ranger
Plug 'francoiscabrol/ranger.vim'
" 23 - bclose (ranger needs it)
Plug 'rbgrouleff/bclose.vim'

" 40 - colorscheme nighthtowl
Plug 'haishanh/night-owl.vim'
" 41 - rainbow parantesish
Plug 'junegunn/rainbow_parentheses.vim'
" 42 - statusline function color
Plug 'itchyny/lightline.vim'
" 43 - show whitespaces in red
Plug 'ntpeters/vim-better-whitespace'
" 44 - language highlighting
Plug 'sheerun/vim-polyglot'
" 45 - plus svelte highlighting
Plug 'evanleck/vim-svelte'
" 46 - mathematica syntax highlighting
Plug 'voldikss/vim-mma'
" 47 - vista, view and search LSP symbols...
Plug 'liuchengxu/vista.vim'

" 61 - testing testing
Plug 'honza/vim-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
 " yok artik, neovim in icinde browser mii ?
" simdilik olmasin
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

call plug#end()


" 40 - colorscheme nighthtowl
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif
"
"
"
"old config
"if $TERM =~ '^\(rxvt\|screen\|interix\|putty\)\(-.*\)\?$'
 "         set notermguicolors
  "    elseif $TERM =~ '^\(tmux\|iterm\|vte\|gnome\)\(-.*\)\?$'
  "        set termguicolors
  "    elseif $TERM =~ '^\(xterm\)\(-.*\)\?$'
  "        if $XTERM_VERSION != ''
  "            set termguicolors
  "        elseif $KONSOLE_PROFILE_NAME != ''
  "            set termguicolors
  "        elseif $VTE_VERSION != ''
  "            set termguicolors
  "        else
  "            set notermguicolors
  "        endif
  "    elseif $TERM =~ ...
  "    endif
" 40 - colorscheme nighthtowl
""""" enable the theme
syntax on
syntax enable
" colorscheme tender
colorscheme night-owl

au! BufNewFile,BufRead *.svelte set ft=html


" 10 - coc - plugin manager
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction




" 000x
" general settings
" indentation, tab ?, line numbers...
set smartindent
set smarttab
set number
" 47 - vista, view and search LSP symbols...
"
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
"
"
"
" 47 - vista, view and search LSP symbols...


" utku coc-snippets keymap
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
" utku coc-snippets keymap


" 47 - vista, view and search LSP symbols...
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

" iptal 01 - set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
" 47 - vista, view and search LSP symbols...


" 090-testing lines
" for document highlight -testing
" coc-vimlsp
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

" deneme
" utku nvim browser test
"
"
"
"if exists('g:started_by_firenvim') && g:started_by_firenvim
"    " general options
"    set laststatus=0 nonumber noruler noshowcmd
"
"    augroup firenvim
"        autocmd!
"        autocmd BufEnter *.txt setlocal filetype=markdown.pandoc
"    augroup END
"endif


" coc-debug using chrome developer tools
" bozuksa as
" let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']


" coc-explorer custom vim mapping
:nmap ge :CocCommand explorer<CR>






" to make copy and paste work in nvim...
set clipboard=unnamedplus


" Open Ranger, file manager
map <C-\> :RangerCurrentFileExistingOrNewTab<CR>
" ranger + nerdtree
let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1

" Mouse support
map <F2> :set mouse=<CR>
map <F3> :set mouse=a<CR>

" Delete unneeded spaces
map <F4> :FixWhitespace<CR>

" BA
" BA
" BA
" BA fetct settings finished


" 033 statusline coc
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
" 033 statusline coc



" 005-utku-nvim-coc

"" utku coc actions config
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" if hidden is not set, TextEdit might fail.
set hidden


" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"
"
"
"
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction




" Use <c-space> to trigger completion.
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



" 00X Dokumantasyon gosterimmi
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>


" utku kisayol
"
" yan taba gecme kisayolu
nnoremap <C-e> <C-w>w
"
"
"
" dosya kaydetme
nmap <C-d> :update<CR>
"
"
"
"
" utku kisayol




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

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" iptal 01 - set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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
" 005-utku-nvim-coc


" 00X Dokumantasyon gosterimmi - buyuk K ile oluyor nomral modda...
"
" 42 - statusline function color
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'nightowl',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'git' , 'diagnostic' , 'currentfunction', 'filename', 'modified' , 'method' ]
      \ 	],
      \   'right':[
      \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
      \     [ 'blame' ]
      \   ],
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'method': 'NearestMethodOrFunction',
      \   'blame': 'LightlineGitBlame',
      \ },
      \ }
" Use auocmd to force lightline update.
  autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" 42 - statusline function color
function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction

" coc.nvim
" coc-git custom keymaping...
" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

" utku - custom keymap config
" nvim.coc base keymap
" Tab Managment
  map <C-o> :tabnew<CR>
"  map <C-D> :tabclose<CR>
  map <C-j> :tabprev<CR>
  map <C-k> :tabnext<CR>

" terminal in neovim config
" https://dev.to/jesus_abark/comment/7k99
"
"
"
 " Maps ESC to exit terminal's insert mode
  if has('nvim')
    tnoremap <Esc> <C-\><C-n>
  endif

" Maps ctrl-p + o to open a new tab window
  nnoremap <C-p>o :tabnew +terminal<CR>
  tnoremap <C-p>o <C-\><C-n>:tabnew +terminal<CR>

 " Maps ctrl-p + p" to open a new horizontal split with a termina
  nnoremap <C-p>p :new +terminal<CR>
  tnoremap <C-p>p <C-\><C-n>:new +terminal<cr>

" also removed the number lines and got terminal buffers to automatically enter into insert mode with
 augroup neovim_terminal
    autocmd!

    " Enter Terminal-mode (insert) automatically
    autocmd TermOpen * startinsert

    " Disables number lines on terminal buffers
    autocmd TermOpen * :set nonumber norelativenumber
  augroup END


" cursor reset utku
set -ga terminal-overrides ',*:Ss=\E[%p1%d q:Se=\E[2 q'


