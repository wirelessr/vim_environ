set nocompatible              " required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'grep.vim'
"Plugin 'tmhedberg/SimpylFold'
"Plugin 'vim-scripts/indentpython.vim'
"Plugin 'python_fold'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'taglist.vim'
Plugin 'gnattishness/cscope_maps'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'yssl/QFEnter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    if (expand("%:t") != '')
      exe ":NERDTreeFind"
    else
      exe ":NERDTreeToggle"
    endif
  endif
endfunction

"F2开启和关闭树" 
" nnoremap <F2> :NERDTreeToggle<CR> 
nnoremap <F2> :call NERDTreeToggleInCurDir()<CR> 
let NERDTreeChDirMode=1 
"显示书签" 
let NERDTreeShowBookmarks=1 
"设置忽略文件类型" 
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '^\.'] 
"窗口大小" 
let NERDTreeWinSize=25


"缩进指示线"
let g:indentLine_char='|'
let g:indentLine_enabled = 0

"autopep8设置"
let g:autopep8_disable_show_diff=1

let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = {'file': '\v(\.proto|\.ini|\.yml|\.py)@<!$'}
let g:ctrlp_regexp = 1

let Grep_Default_Filelist = '*.py *.proto'

" Enable folding
set foldlevel=99
set foldmethod=syntax

nnoremap <space> za

let g:SimpylFold_docstring_preview=1

let python_highlight_all=1
" syntax on
syntax enable

" set background=dark

nmap <C-]> g<C-]>

let Tlist_Use_Right_Window=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_One_File=0
let Tlist_File_Fold_Auto_Close=1
nnoremap <silent> <F5> :TlistToggle<CR>
let Tlist_WinWidth = 50

nmap <f3> :Rgrep <C-R><C-W> <CR><CR><CR>

" Go to last file(s) if invoked without arguments.
autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
    \ call mkdir($HOME . "/.vim") |
    \ endif |
    \ execute "mksession! " . $HOME . "/.vim/Session.vim"

autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
    \ execute "source " . $HOME . "/.vim/Session.vim"



map <C-N> :set mouse=<CR>
map <C-H> :set mouse=a<CR>

let g:bookmark_sign = '>>'

nmap lt :CtrlPTag<CR>

let g:qfenter_keymap = {} 
let g:qfenter_keymap.vopen = ['<C-v>'] 
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>'] 
let g:qfenter_keymap.topen = ['<C-t>'] 

set cursorline
nmap XX :q<CR>
nmap <2-LeftMouse> g<C-]>
nmap <MiddleMouse> #

set expandtab
set sw=4 ts=4

if has("autocmd")
    " Highlight TODO, FIXME, NOTE, etc.
    if v:version > 701
        autocmd Syntax * call matchadd('Todo', '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
        autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
    endif
endif
