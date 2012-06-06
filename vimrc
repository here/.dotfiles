
".vimrc

call pathogen#infect()

syntax enable

" allow moving between buffers with unsaved changes
set hidden


"let g:solarized_termcolors=256
set background=dark
"set background=light
colorscheme solarized
"toggle color scheme calls togglebg function from solarized
call togglebg#map("<f4>")

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

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
    endif

" Now imported with pathogen?
"source /usr/share/vim/vim73/plugin/matchit.vim
"source /usr/share/vim/vim70/macros/matchit.vim
