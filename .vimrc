"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM configuration script. Should be placed in ~/vimrc
" Maintained by Leo Bremer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Notes    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Paste the following code snippet (removing leading "") into ~/.bashrc to get 
" larger colorspace if supported: 
""" #Get more colors (otherwise only get 8)
""  if [ -e /usr/share/terminfo/x/xterm-256color ]; then
""          export TERM='xterm-256color'
""  else
""          export TERM='xterm-color'
""  fi

" Vundle Settings """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Required for Vundle
filetype off  
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Let Vundle manage Vundle, required
Bundle 'gmarik/Vundle.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Syntastic Settings """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningsmsg#
set statusline+=%#{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" General Settings """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use VIM not VI
set nocompatible

" Some useful setting
set backspace=indent,eol,start 
set ruler        " show the cursor position all the time
set showcmd      " display incomplete commands
set incsearch    " do incremental searching
set mouse=a      " force mouse input to on
set number       " turn on line number
syntax on        " turn on syntax highlightin

" turn on tab complete for commands, with longest complete possible
set wildmenu
set wildmode=list:longest,full

" toggle pastemode
set pastetoggle=<F2>

" Get my colorscheme
:colorscheme molokai

" Open buffers in new tabs
" :au BufAdd,BufNewFile * nested tab sball

" Shorten timeouts for bindings (makes <Esc> map faster, see "Bindings")
" timeoutlen is used for mapping delays, ttimeoutlen for key code delays.
set timeoutlen=500 ttimeoutlen=0

" Make current dir the working dir
:set autochdir

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Use filetype detection and file-based automatic indenting.
    " filetype plugin indent on

    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif

" For everything else, use a tab width of 4 space chars.
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.

" Detect Verilog Files
au BufNewFile,BufRead *.v, *.vh, *.args, *.f, *.verilog set ft=verilog

" Put swap files and backup files here
" set backupdir=~/.vim/backups//
" set directory=~/.vim/swp//

" Bindings """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Escape from insert mode without <Esc> key
:imap kl <Esc>

" Escape from visual mode without <Esc> key
:vmap kl <Esc>

" Visual mode deletes to black hole reg so you can paste over words without "0
:vnoremap p "_dP

" Shortcut for new tab
:nnoremap t :tabnew<Space>
"
" Functions """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

