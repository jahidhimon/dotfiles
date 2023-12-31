syntax on
filetype plugin indent on
let mapleader = "\<Space>"

set encoding=utf8
set nocompatible
set noerrorbells
set noignorecase

set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

set smartindent
set smartcase
set relativenumber
set number

set nobackup
set undodir=~/.vim/undodir
set undofile
set number

set incsearch

set noswapfile

"** For folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" ** nerdTree Settings
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=1

" ** undoTree
nnoremap <F5> :UndotreeToggle<CR>

let g:user_emmet_leader_key=','

call plug#begin('~/.vim/plugged')
" ** MARKDOWN
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}

" ** JAVASCRIPT
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" ** HTML
Plug 'mattn/emmet-vim'

" ** PHP
Plug 'StanAngeloff/php.vim'
Plug 'preservim/tagbar'

" ** autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ** tmux plugin
Plug 'christoomey/vim-tmux-navigator'

Plug 'tpope/vim-fugitive'

Plug 'mbbill/undotree'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'psliwka/vim-smoothie'
Plug 'Raimondi/delimitMate'
Plug 'ervandew/supertab'

Plug 'machakann/vim-sandwich'
Plug 'cespare/vim-toml'
Plug 'jpalardy/vim-slime'
Plug 'Yggdroot/leaderf'
Plug 'vim-airline/vim-airline'
" Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'neovimhaskell/haskell-vim'

" ** LUA
Plug 'euclidianAce/BetterLua.vim'

" ** colorschemes

Plug 'arcticicestudio/nord-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'joshdick/onedark.vim'

call plug#end()

" ** nasm
let g:asmsyntax = 'nasm'

" ** coc settings
let g:coc_disable_startup_warning = 1

let g:airline_theme = "onedark"
let g:airline#extensions#tabline#enabled=1
let g:slime_target = "x11"
" let g:slime_default_config = {"socket_name": \"default\", \"target_pane": \":.1"}

" ** instant markdown
" let g:instant_markdown_slow=1
let g:instant_markdown_allow_unsafe_content=1

colorscheme nord

set background=dark

" ** tabular Haskell
let g:haskell_tabular = 1
vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

" ** Haskell vim
let g:haskell_classic_highlighting=1
let g:haskell_indent_disable=1

" tagbar
nmap <F8> :TagbarToggle<CR>


"  ** Tab Settings
nnoremap <C-S-Tab> :bprevious<CR>
nnoremap <C-Tab> :bnext<CR>

"  ** Pane
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
" ** COC Settings
set hidden

" Some servers have issues with backup files, see #649.
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set signcolumn=yes

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Terminal
set splitbelow

nnoremap <C-,> :term<CR>
set termwinsize=10x0
tnoremap <C-,> exit<CR>
tnoremap <ESC> <C-\><C-n>
tnoremap <C-k> <C-w><C-k>

" LeaderF
let g:Lf_ShortcutF = '<C-p>'
let g:Lf_WindowPosition = 'popup'
let g:Lf_ShowDevIcons = 1
let g:Lf_DevIconsFont = "FiraCode Nerd Font Mono"
set ambiwidth=double
let g:Lf_StlSeparator = { 'left': "", 'right': "", 'font': "Fira Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

