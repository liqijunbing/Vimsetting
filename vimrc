"""""""""""""""""""""""""""""""""""""""""'''
"Maintainer : Kieran Li 
"Last change:	2022/04/01
"  
" To use it, copy it to  
"for Unix:  ~/.vimrc  
"for MS-Windows:  ~/vimfiles/vimrc
"section
" ->change history
" ->back up
" ->
"
"
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => change history
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => backup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Get the defaults that most users want.  
source $VIMRUNTIME/defaults.vim  



set nobackup		" do not keep a backup file, use versions instead  
set noswapfile     " do not keep the swap file"




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => general
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" No annoying sound on errors
set noerrorbells
set novisualbell
set vb t_vb=


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 




if &t_Co > 2 || has("gui_running")  
  " Switch on highlighting the last used search pattern.  
  set hlsearch  
endif  
  
 

" For all text files set 'textwidth' to 78 characters.  
autocmd FileType text setlocal textwidth=78  
augroup END  
  


  



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

set encoding=utf-8  
set fileencodings=utf-8,chinese,latin-1  
if has("win32")  
    set fileencoding=chinese  
else  
    set fileencoding=utf-8  
endif  

language messages zh_CN.utf-8  
  
colo koehler  
if has('gui_running')
    if has("win16") || has("win32") || has("win95") || has("win64")
        set guifont=Times_new_Roman:h11:cANSI,Consolas:h11
    else
        set guifont=MiscFixed\ Semi-Condensed\ 11
    endif
endif

source $VIMRUNTIME/delmenu.vim  
source $VIMRUNTIME/menu.vim  

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autoindent  
set nu!  

" Use spaces instead of tabs
set shiftwidth=4  
set ts=4  
" Use spaces instead of tabs
set expandtab  

" Linebreak on 500 characters
"set lbr
"set tw=500



""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => compile and run
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

map <F5> :! python.exe %


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => package
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"vim-plug package to organize the plugin
call plug#begin('~/vimfiles/plugged')
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
 Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }


" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

Plug 'scrooloose/nerdtree'

" File navigation
" fzf-lua only valid for neoviffm
" Plug 'ibhagwan/fzf-lua'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kevinhwang91/rnvimr'
Plug 'airblade/vim-rooter'
Plug 'pechorin/any-jump.vim'

"auto completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc configeration 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" configerate coc for different language
"

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-vimlsp',
  \ 'coc-pyright',
  \ 'coc-marketplace',
  \ ]

" TextEdit might fail if hidden is not set.
set hidden


" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c




" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
" TBUDATED
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif







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
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree configeration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap tt :NERDTree<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
