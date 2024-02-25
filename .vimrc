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

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    Plug 'vim-airline/vim-airline'

    Plug 'SirVer/ultisnips'
        let g:UltiSnipsExpandTrigger='<tab>'  " tab to complete, like normal tabcomplete
        let g:UltiSnipsJumpForwardTrigger='<c-j>'  " ctrl + j to jump  forwards in autocomplete spaces
        let g:UltiSnipsJumpBackwardsTrigger='<c-s-tab>'
        let g:UltiSnipsEditSplit="horizontal"

    Plug 'lervag/vimtex'
        let g:vimtex_view_method = 'zathura'

    Plug 'tpope/vim-fugitive'

    Plug 'preservim/nerdtree'

call plug#end()


" custom escape remaps
inoremap jk <ESC>
inoremap Jk <ESC>
inoremap JK <ESC>

colorscheme default
