"
" File   : .vimrc
" Update : December 23, 2017
" Author : PELLOIN Valentin
" Link   : https://github.com/valentinp72/myConfigs
"

"
" Main configurations
"

set nocompatible   " not compatible with vi
syntax enable      " enable syntax hightlighting
filetype plugin on " commands according to filetype

colorscheme gruvbox
"colorscheme solarized
set background=dark
set number
set showcmd
set mouse=a
" Allow mouse draggin in vim
if has("mouse_sgr")
	set ttymouse=sgr
else
	set ttymouse=xterm2
end
set autoindent
set smartindent
set cindent
set tabstop=4 " largeur des tabulations
set shiftwidth=4 " un seul tab à chaque intendation
if has('breakindent')
	set breakindent " identation when a line is breaked
endif
set whichwrap+=<,>,h,l,[,]
set cursorline
set wrap linebreak nolist " soft wrap automatique
set clipboard=unamedplus
set hlsearch " highlight search results

let g:netrw_liststyle = 3

" Utilisation de ;; pour Esc (changer de mode)
":imap ;; <Esc>
":map ;; <Esc>

" Swap files not in the same folder
set directory=$HOME/.vim/swapfiles/

" Files auto-refresh
set autoread
au CursorHold * checktime
set laststatus=2
let g:airline_detect_paste=1

" auto color for Gemfile
autocmd BufNewFile,BufRead Gemfile set filetype=ruby

set encoding=utf8
""set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11

" Syntax color for all c-like functions
syn match myFunction "\<\k\+\ze("
hi link myFunction Function

" Show airline for tabs too

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 0
autocmd WinEnter * if &ft == 'nerdtree' | call s:MyNERDTreeSetting() | endif

" ------- "
" MAPPING "
" ------- "

nnoremap <silent> <F8> :!clear;gcc "%" -o "%" "&&" "./%"<CR>
vnoremap \y y:call system("pbcopy", getreg("\""))<CR>
nnoremap \p :call setreg("\"", system("pbpaste"))<CR>p

noremap YY "+y<CR>
noremap P "+gP<CR>
noremap XX "+x<CR>"

" Supress trailing characters by pressing F5
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" Disable hightlight search results with enter
"nnoremap <CR> :noh<CR><CR>

" Switch tabs with shift + arrow
map <C-Right> :tabn<CR>
map <C-Left>  :tabp<CR>
"New tab with shift + t or shift + n
map <C-t>     :tabnew<CR>
map <C-n>     :tabnew<CR>
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
"Close tab with shift + w
map <C-w>     :tabclose<CR>
"Save with shift + w
map <C-s>     :w<CR>
map <C-S>     :w<CR>

map <C-z> u
map <C-t> :tabnew <Enter>
map <C-w> :close <Enter>

" shift+arrow selection
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc>v<Right>

vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
map <C-v> pi
imap <C-v> <Esc>pi
imap <C-z> <Esc>ui


" A blue theme for vim airline
let g:airline_theme='vice'

" Arrows for vim airline
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''

" Ctrl-p: fuzzy file finder
" search only on the current file directory
let g:ctrlp_working_path_mode = 'a' 
" Ignore files listed in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


if executable('pbcopy')
  map <C-c> :w !pbcopy<CR><CR>
endif
if executable('pbpaste')
  map <C-v> :r !pbpaste<CR><CR>
endif

" Auto getters and setters on Java
map <buffer> <F8> <Plug>JavagetsetInsertGetterSetter 

let b:javagetset_getterTemplate = 
  \ "/**\n" . 
  \ " * Returns %varname%.\n" . 
  \ " * @return %varname%\n" . 
  \ " */\n" . 
  \ "%modifiers% %type% %funcname%() {\n" .
  \ "	return %varname%;\n" .
  \ "}\n"

let b:javagetset_setterTemplate =
  \ "/**\n" .
  \ " * Sets %varname%.\n" .
  \ " * @param %varname% the new %varname%\n" .
  \ " */\n" .
  \ "%modifiers% void %type% %funcname%(%type% %varname%) {\n" .
  \ "	this.%varname% = %varname%;\n" .
  \ "}\n"

execute pathogen#infect()

" some configuration seems to change the colorscheme, so
" I put it here:
" colorscheme solarized


