
".vimrc

syntax enable

" allow moving between buffers with unsaved changes
set hidden

" solarized is awesome but can't get it working
" with oh-my-zsh+tmux+vim -> copy paste
"set t_Co=256

"let g:solarized_termcolors=256
"set background=dark
"set background=light
"colorscheme solarized
"toggle color scheme calls togglebg function from solarized
"call togglebg#map("<f4>")

":set paste
:map <f2>   :set paste!<cr>:set paste?<cr>
:imap <f2>   :set paste<cr>
:map <f3>   :set number!<cr>:set number?<cr>
:imap <f3>   :set number<cr>

:map <F5> :w<cr>:!node %<cr>
:map <F6> :w<cr>:!node app.js<cr>
:map <F7> :w<cr>:!git commit -a<cr>
":map <f7> :w<cr>:!git commit -am "comments and spacing"<cr>

filetype plugin on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set autoindent smartindent
":set cindent

" Restore last buffer cursor position on reload
" May also be achieved by simply using either `" or '"
" http://stackoverflow.com/questions/774560/in-vim-how-do-i-get-a-file-to-open-at-the-same-line-number-i-closed-it-at-last
if has("autocmd")
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
    endif

" ignorecase for searches
set ignorecase
" override ignorecase if search includes uppercase
set smartcase

" treat *.json files as javascript
autocmd BufNewFile,BufRead *.json set ft=javascript

" Better matching including HTML (divs, etc)
source /usr/share/vim/addons/plugin/matchit.vim
"source /usr/share/vim/vim73/plugin/matchit.vim
"source /usr/share/vim/vim70/macros/matchit.vim
