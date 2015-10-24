if empty(glob('~/.nvim/autoload/plug.vim'))
    !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

let g:python_host_prog='/usr/bin/python2'
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'                                      " Comment fast and professionally
Plug 'scrooloose/nerdtree' , {'on': 'NERDTreeToggle'}                " Proper file explorer inside vim
Plug 'flazz/vim-colorschemes'                                        " All popular Colorscheme
Plug 'tpope/vim-surround'                                            " Quick Surround with tags or Brackets
Plug 'octol/vim-cpp-enhanced-highlight'                              " Enhanced syntax highlight for CPP files
Plug 'Lokaltog/vim-easymotion'                                       " Quick jumping between lines
Plug 'myusuf3/numbers.vim'                                           " Auto Toggle between relative and normal numbering
Plug 'sjl/gundo.vim'                                                 " Graphical undo tree
Plug 'marcweber/vim-addon-mw-utils'                                  " Vim Addons
Plug 'garbas/vim-snipmate'                                           " Snippets for reusable code
Plug 'tpope/vim-fugitive'                                            " Git Wrapper
Plug 'tomtom/tlib_vim'                                               " Needed for SnipMate :(
Plug 'auto-pairs-gentle'                                             " Auto insert matching brackets
Plug 'autoswap.vim'                                                  " Make vim stop with swap messages intelligently
Plug 'godlygeek/tabular'                                             " Beautiful Alignment when needed
Plug 'plasticboy/vim-markdown'                                       " Better Markdown support for vim (NEEDS TABULAR)
Plug 'jceb/vim-orgmode'                                              " Add OrgMode support like Emacs
Plug 'cmdalias.vim'                                                  " Set up alias for accidental commands
Plug 'Python-Syntax-Folding'                                         " Proper syntax folding for python
Plug 'nvie/vim-flake8'                                               " Point out PEP8 inconsistencies
Plug 'bling/vim-airline'                                             " Who doesn't know about vim airline plugin
Plug 'kien/ctrlp.vim'                                                " Fast fuzzy file searching
Plug 'terryma/vim-multiple-cursors'                                  " Multiple Cursors like Sublime Text
Plug 'kchmck/vim-coffee-script'                                      " Highlighting and syntax for coffeescript
Plug 'fatih/vim-go'                                                  " Go completion and features
Plug 'KabbAmine/zeavim.vim'                                          " Direct documentation access
Plug 'Superbil/llvm.vim'                                             " LLVM highlighting
call plug#end()                                                      " Vundle ends here

syntax on
filetype plugin indent on

colorscheme jellybeans                                               " Set active Colorscheme
nnoremap ,; ;
                                                                     " start commands with ; not :
nnoremap ; :
                                                                     " Turn word to uppercase in insert mode
inoremap <c-u> <Esc>viwUea
                                                                     " Toggle NERDTree without python compile files
inoremap <F2> <Esc>:NERDTreeToggle<CR>a
                                                                     " Toggle NERDTree without python compile files
nnoremap <F2> :NERDTreeToggle<CR>
                                                                     " Turn on/off wrapping
nnoremap <F4> :set wrap!<CR>
                                                                     " Show open buffers and help in quick switching
nnoremap <F5> :buffers<CR>:buffer<Space>
                                                                     " Turn on/off current line highlight
nnoremap <F9> :set cul!<CR>
                                                                     " Indent everything in insert mode
inoremap <F10> <Esc>mmgg=G`ma
                                                                     " Indent everything in normal mode
nnoremap <F10> <Esc>mmgg=G`m
                                                                     " comment current line with //
nmap // <leader>ci
                                                                     " comment current selection with //
vmap // <leader>ci
                                                                     " w!! force write with sudo even if forgot sudo vim
cmap w!! w !sudo tee > /dev/null %
                                                                     " Easy Motion shortcut. Try it!
nmap ,, <leader><leader>s

inoremap jk <Esc>
nnoremap <CR> o<Esc>
nnoremap  <silent>   <tab>  mq:bnext<CR>`q
nnoremap  <silent> <s-tab>  mq:bprevious<CR>`q
                                                                     " Switch buffers with Tab and Shift-Tab
inoremap <// </<C-X><C-O><C-[>m'==`'
nnoremap Q !!sh<CR>
                                                                     " Replace current line with output of shell

                        " --------------------------------CONFIGS----------------------------- "

let NERDTreeIgnore=['\.pyc$', '__pycache__']                         " Ignoring .pyc files and __pycache__ folder
let g:go_fmt_command = "goimports"                                   " Rewrite go file with correct imports
set wildignore+=*/bin/*,main,*/__pycache__/*,*.pyc,*.swp
set backspace=indent,eol,start                                       " Make backspace work with end of line and indents
set foldmethod=syntax                                                " Auto Add folds - Trigger with za
set foldlevel=9999                                                   " Keep folds open by default
set scrolloff=10                                                     " Scroll Offset below and above the cursor
set expandtab                                                        " Replace tab with spaces
set tabstop=4                                                        " Tab = 4 Space
set softtabstop=4                                                    " Act like there are tabs not spaces
set shiftwidth=4                                                     " Indentation
set hidden                                                           " Hide abandoned buffers without message
set wildmenu                                                         " Tab command completion in vim
set ignorecase                                                       " Ignore case while searching
set smartcase                                                        " Case sensitive if Capital included in search
set incsearch                                                        " Incremental Searching - Search as you type
set autoindent                                                       " Self explained
set relativenumber                                                   " relative numbering (Current line in line 0)
set number                                                           " Line numbers - Hybrid mode when used with rnu
set nowrap                                                           " I don't like wrapping statements
set laststatus=2                                                     " Show status line for even 1 file
set tags=~/.mytags                                                   " Path to generated tags
set mouse=nv                                                         " Allow mouse usage in normal and visual modes
set nohlsearch                                                       " Do not highlight all search suggestions.
let g:airline_powerline_fonts = 1                                    " Powerline fonts
let g:airline#extensions#tabline#enabled = 1                         " Show buffers above


                        "---------------------------SMART CLIPBOARD----------------------------"
vnoremap ,y "+yy
nnoremap ,y "+yy
vnoremap ,d "+dd
nnoremap ,d "+dd
vnoremap ,p "+p
nnoremap ,p "+p
vnoremap ,P "+P
nnoremap ,P "+P
                        "----------------------------ABBREVIATIONS-----------------------------"
iabbrev @@g pallavagarwal07@gmail.com
iabbrev @@i pallavag@iitk.ac.in
iabbrev @@c pallavag@cse.iitk.ac.in

                        "---------------------------HABIT--BREAKING----------------------------"
inoremap <left> <nop>
nnoremap <left> <nop>
inoremap <right> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <down> <nop>

                        "----------------------------GVIM SPECIFIC-----------------------------"

set directory=.,$TEMP                                                " Gets rid of a windows specific error
set guioptions-=m                                                    " remove menu bar
set guioptions-=T                                                    " remove toolbar
set guioptions-=r                                                    " remove right-hand scroll bar
set guioptions-=L                                                    " remove left-hand scroll bar
set guifont=Source\ Code\ Pro\ for\ Powerline\ 12

                        "--------------------------------HOOKS---------------------------------"
augroup filetype_compile
  autocmd!
  autocmd FileType tex nnoremap <F3> mm:w<CR>:!pdflatex<Space>%<CR><CR><Return>`m
augroup END

                        "---------------------------OPERATOR-PENDING---------------------------"
" Operate inside next block
onoremap in( :<c-u>normal! f(vi(<CR>
onoremap in{ :<c-u>normal! f{vi{<CR>
onoremap in" :<c-u>normal! f"vi"<CR>
onoremap in' :<c-u>normal! f'vi'<CR>
onoremap in` :<c-u>normal! f`vi`<CR>
" Operate inside previous block
onoremap ip( :<c-u>normal! F)vi(<CR>
onoremap ip{ :<c-u>normal! F}vi{<CR>
onoremap ip" :<c-u>normal! F"vi"<CR>
onoremap ip' :<c-u>normal! F'vi'<CR>
onoremap ip` :<c-u>normal! F`vi`<CR>
" Operate around next block
onoremap an( :<c-u>normal! f(va(<CR>
onoremap an{ :<c-u>normal! f{va{<CR>
onoremap an" :<c-u>normal! f"va"<CR>
onoremap an' :<c-u>normal! f'va'<CR>
onoremap an` :<c-u>normal! f`va`<CR>
" Operate around previous block
onoremap ap( :<c-u>normal! F)va(<CR>
onoremap ap{ :<c-u>normal! F}va{<CR>
onoremap ap" :<c-u>normal! F"va"<CR>
onoremap ap' :<c-u>normal! F'va'<CR>
onoremap ap` :<c-u>normal! F`va`<CR>
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
"
" vim: nowrap:
