syntax enable
set background=dark
colorscheme solarized
set number
set showcmd
set mouse=a
set autoindent
set smartindent
set cindent
set whichwrap+=<,>,h,l,[,]
set cursorline
set clipboard=unamedplus
let g:netrw_liststyle = 3

" Auto-refresh des fichiers
set autoread
au CursorHold * checktime
set laststatus=2
let g:airline_detect_paste=1

set encoding=utf8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1
let g:solarized_termtrans=1
let g:airline_powerline_fonts = 1
let g:nerdtree_tabs_meaningful_tab_names = 1
let g:nerdtree_tabs_open_on_console_startup=1

" Permet d'ouvrir un onglet en double-cliquant (NERDTree)
fun! s:MyNERDTreeSetting()
	fun! s:DoubleClickBehavior()
		if match(getline('.'), '▸') == -1 && match(getline('.'), '▾') == -1
			map <buffer> <2-LeftMouse> t
		else
			map <buffer> <2-LeftMouse> o
		endif
	endfun
	autocmd CursorMoved * call s:DoubleClickBehavior()
endfun

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


"Switch tabs with shift + arrow
map <S-Right> :tabn<CR>
map <S-Left>  :tabp<CR>
"New tab with shift + t or shift + n
map <S-t>     :tabnew<CR>
map <S-n>     :tabnew<CR>
"Close tab with shift + w
map <S-w>     :tabclose<CR>
"Save with shift + w
map <S-s>     :w<CR>
map <S-S>     :w<CR>

map <C-z> u
map <C-t> :tabnew <Enter>
map <C-w> :close <Enter>


execute pathogen#infect()
