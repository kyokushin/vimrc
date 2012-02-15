set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" " required! 
" Bundle 'gmarik/vundle'
"
" " My Bundles here:
" "
" " original repos on github
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" " vim-scripts repos
"Bundle 'git://github.com/vim-scripts/L13.git'
Bundle 'git://github.com/vim-scripts/AutoComplPop.git'
Bundle 'git://github.com/Shougo/vimproc.git'
Bundle 'git://github.com/yandy/vim-omnicppcomplete.git'
Bundle 'git://github.com/Shougo/unite.vim.git'
Bundle 'git://github.com/thinca/vim-quickrun.git'
Bundle 'git://github.com/Shougo/vimshell.git'
Bundle 'git://github.com/vim-scripts/closetag.vim.git'
Bundle 'git://github.com/codegram/vim-todo.git'
" Bundle 'FuzzyFinder'
" " non github repos
" Bundle 'git://git.wincent.com/command-t.git'
filetype plugin indent on     " required! 

"" omnicppcomplete
set tags+=~/.vim/stl.tags
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowScopeInAddr = 0
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 1|silent! pclose|endif
"neocomplcache を使用している場合は副作用が出るので設定しない
set completeopt=menuone,menu,longest,preview
" map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
set nocp
filetype plugin on

"" clangComplete
" source ~/.vim/clangComplete.vimrc

"" エンコード設定
command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2022-jp
command! Utf8 edit ++enc=utf-8

command! Jis Iso2022
command! Sjis Cp932

"" tab setting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set cindent

"" 行の折り返しを無効
set tw=0
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"" ステータスラインの設定
function! GetB()
	let c = matchstr(getline('.'), '.', col('.') - 1)
	let c = iconv(c, &enc, &fenc)
	return String2Hex(c)
endfunction
" :help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
	let n = a:nr
	let r = ""
	while n
		let r = '0123456789ABCDEF'[n % 16] . r
		let n = n / 16
	endwhile
	return r
endfunc
" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
	let out = ''
	let ix = 0
	while ix < strlen(a:str)
		let out = out . Nr2Hex(char2nr(a:str[ix]))
		let ix = ix + 1
	endwhile
	return out
endfunc
set laststatus=2
"ステータスラインに文字コードと改行文字を表示する
set statusline=[%n]%1*%m%*%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=[%<%{fnamemodify(getcwd(),':~')}]%-8([%{GetB()}]%)\ %-11(%l,%c%V%)\ %4P

"" template file setting
" autocmd BufNewFile	*.php	0r ~/vimfiles/templates/php.txt
" autocmd BufNewFile	*.html	0r ~/vimfiles/templates/html.txt
