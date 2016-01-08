" .vimrc
"
set backspace=2  " backspace can join lines 
set joinspaces   " insert two spaces after a period after line join 
set hh=0         " this combined with ea should autobalance help 
set magic        " do the right thing with regex's 
set nobackup     " backups are for wimps!  
set ruler        " display row,col ruler 
set showcmd      " helps avoid command-mode typos 
set showmatch    " show matching delimiter for parentheses, braces, etc 
set showmode     " show which mode I am in 
set noet         " don't expand tab 
set nojs         " don't join spaces
set ea           " this should autobalance windows
set expandtab    " insert space characters whenever the tab key is pressed
set tabstop=4    " Controls the number of space characters that will be inserted when the tab key is pressed
set shiftwidth=4 " Changes the number of space characters inserted for indentation
set hlsearch     " Highlight Search Results
set background=dark "If you use a dark background set this to make the fonts a better color
set nowrap
syntax enable
set paste
set ruler
set viminfo='10,\"100,:20,%,n~/.viminfo
" Return the cursor to the last edit position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm$"|endif|endif
" set smartindent  " this is pretty nifty most of the time 
" set number     " Good for writing code.
" setlocal spell spelllang=en_us
" set spellfile=~/.vim/spellfile.{encoding}.add
" set nospell
" ab css Chad S. Sherrell

" Leaves the content of the buffer on the screen upon exiting exit
set t_ti= t_te=

nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

"colors phd



