set number 
set relativenumber
set tabstop=4
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set autoindent
set incsearch
set textwidth=80
set nowrap

" Install plug.vim if its not there
" Simply downloads plug.vim script and puts it in ~/.vim/autoload directory
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    " Bar at the bottom of vim, I want to customize this one day
    Plug 'vim-airline/vim-airline'

    " Ultisnips, snippits, I don't use this a ton, but its really handy for LaTeX, I should really learn this better
    Plug 'SirVer/ultisnips'
        let g:UltiSnipsExpandTrigger='<tab>'  " tab to complete, like normal tabcomplete
        let g:UltiSnipsJumpForwardTrigger='<c-j>'  " ctrl + j to jump  forwards in autocomplete spaces
        let g:UltiSnipsJumpBackwardsTrigger='<c-s-tab>'
        let g:UltiSnipsEditSplit="horizontal"

    " VimTex, Vim LaTeX plugin, friggin awesome
    Plug 'lervag/vimtex'
        let g:vimtex_version_check = 0
        let g:vimtex_view_method = 'zathura'

    " Git plugin, I never use this, I should learn this
    Plug 'tpope/vim-fugitive'

    " NerdTree, better file explorer
    Plug 'preservim/nerdtree'

call plug#end()


" custom escape remaps
inoremap jk <ESC>
inoremap Jk <ESC>
inoremap JK <ESC>

colorscheme default
