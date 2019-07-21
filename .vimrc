execute pathogen#infect()
syntax on
filetype plugin indent on

set t_Co=256
set encoding=utf-8

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:ctrlp_clear_cache_on_exit = 0

" highlight cursor line
function s:SetCursorLine()
    set cursorline
    hi cursorline cterm=none ctermbg=235
endfunction

set background=dark
set nu
set tabstop=4
set shiftwidth=4
set expandtab
set relativenumber
set ic
set nowrap
set list listchars=tab:\ \ 
set foldmethod=syntax
set foldlevel=99
set hlsearch
set re=1
set ttyfast
set lazyredraw

" jump 10 lines up and down with ctrl-k and ctrl-j
nnoremap <C-k> 10k
nnoremap <C-j> 10j
" jump between buffers with ) and (
nnoremap ) :bn<CR>
nnoremap ( :bp<CR>
" delete buffer with D
nnoremap D :bd<CR>
" add empty line below with #
nnoremap # o<ESC>k
" mark all words under cursor without moving with gm
nnoremap gm *N
" to search and replace recursively word under the cursor in all files press 'gr', edit word before /g and press enter
nnoremap gr yiw:! git grep -lz <C-r>" \| xargs -0 sed -i '' -e 's/<C-r>"/<C-r>"/g'
nnoremap gp :<C-r>"
" remove highlighted words with space
nnoremap <Space> :noh<CR>
" close window with X
nnoremap X :q<CR>
map <C-l> <C-w>l
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-Right> <C-w>l
map <C-Left> <C-w>h
map <C-Down> <C-w>j
map <C-Up> <C-w>k
"<Right>
"<Up>
"<Down>
" toggle nerd tree with ctrl-n
map <C-n> :NERDTreeToggle<CR>

if has('persistent_undo')
    set undofile
    silent !mkdir ~/.vim_undo_backup > /dev/null 2>&1
    set undodir=~/.vim_undo_backup
endif

" beautify your function folds
function! NeatFoldText()
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction

" beautify color-scheme
function! s:def_base_syntax()
    syntax match commonOperator "\(=\|^=\|+=\|&&\|-=\|<=\|>=\|<<=\|>>=\|&=\|\\=\|*=\||=\|!=\|||\)"
    syntax match basicTypes "\(u\?int\(8\|16\|32\|64\)\?\(*\)\?\s\|\w\+_t\(\s\|;\|)\|*\)\@=\)"
    hi link basicTypes Type
    hi commonOperator ctermfg=cyan
    hi Folded ctermbg=233 ctermfg=white cterm=bold
    hi Search ctermbg=darkgray ctermfg=NONE
    hi Comment ctermfg=lightblue
    hi LineNr ctermfg=darkgray
    hi CursorLineNr ctermfg=gray
    hi Type ctermfg=red
    hi NonText ctermfg=238
    hi Comment ctermfg=244
    hi PreCondit ctermfg=13
    " mark extra white spaces
    hi ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    syn match Tabs "\t"
    hi Tabs ctermbg=lightred guibg=red
endfunction

function! s:c_syntax()
    syntax match cCustomFunc "\w\+\s*(\@=" contains=cCustomParen
    syntax match cCustomFuncDec "\(char\s\+\|\*\s*\|void\s\+\|u\?int\(8\|16\|32\|64\)\?\s\+\|struct \w\+\s\+\|return_t\s\+\)\@<=\w\+\s*\((\)\@=" contains=cCustomParen,cType,Integers,cCustomScope
    hi link cCustomFunc Function
    hi Function ctermfg=lightblue
    hi cCustomFuncDec ctermfg=green
endfunction

function! s:cpp_syntax()
    syntax match moreTypes "\(stringstream\|string\)"
    syntax match cCustomFunc "\w\+\s*(\@=" contains=cCustomParen
    syntax match cCustomFuncDec "\(::\|bool\s\+\|string\s\+\|\*\s*\|void\s\+\|u\?int\(8\|16\|32\|64\)\?\s\+\|struct \w\+\s\+\|return_t\s\+\)\@<=\w\+\s*\((\)\@=" contains=cCustomParen,cType,Integers,cCustomScope
    syntax match cCustomScope "::"
    syntax match cCustomClass "\w\+\s*::" contains=cCustomScope
    hi cCustomClass ctermfg=13
    hi link cCustomFunc Function
    hi Function ctermfg=lightblue
    hi cCustomFuncDec ctermfg=green
    hi link moreTypes Type
endfunction

augroup my_syntax
    au!
"    autocmd FileType c call <SID>c_syntax()
"    autocmd FileType cpp call <SID>cpp_syntax()
    autocmd FileType * call <SID>def_base_syntax()
    autocmd VimEnter * call s:SetCursorLine()
    autocmd bufEnter * let b:colors_on=0
augroup END


let b:colors_on=0
function! ToggleColors()
    if b:colors_on
        let b:colors_on=0
        syntax off
        syntax on
        call <SID>def_base_syntax()
    else
        let b:colors_on=1
        call <SID>TurnOnColors()
    endif
endfunction

set foldtext=NeatFoldText()

function! s:TurnOnColors()
    if (&filetype == 'c')
        call <SID>c_syntax()
    elseif (&filetype == 'cpp')
        call <SID>cpp_syntax()
    endif
endfunction

" toggle cursor-colum
fu! ToggleCurline ()
    if &cursorcolumn
        set nocursorcolumn
    else
        set cursorcolumn
    endif
endfunction

function! ToggleComment()
    execute "normal ^"
    if '//' == strpart(getline("."), col(".")-1, 2)
        execute "normal xx"
    else
        execute "normal 0i//"
    endif
endfunction

function! ToggleHome()
    let a:cur_pos = col(".")
    execute "normal ^"

    if a:cur_pos == col(".")
        execute "normal 0"
    endif
endfunction

function! s:ToggleBlame()
    if &l:filetype ==# 'fugitiveblame'
        close
    else
        Gblame
    endif
endfunction

function! NumberToggle()
    if(&rnu == 1)
        set nornu
    else
        set rnu
    endif
endfunc

inoremap jj <ESC>:set rnu<CR>
nnoremap i :set nornu<CR>i
nnoremap co :call ToggleColors()<CR>

let mapleader = ","
" use gb to toggle Gblame
nnoremap <silent>gb :call <SID>ToggleBlame()<CR>
" use home button to toggle between first character of line and beggining of
" line
map <Home> :call ToggleHome()<CR>
" use ctrl-/ to comment/uncomment
map <C-_> :call ToggleComment()<CR>
" toggle cursor-colum with cl
map cl :call ToggleCurline()<CR>
" map gig to :!git grep -in, allowing free text to come after
map gig :Gitgrep 
" map gis to git grep -in word under cursor
map gis yiw:Gitgrep <C-r>"<CR>

" map gip to git grep -in word under cursor and open in new buffer
map gip :sp<CR>yiw:Gitgrep <C-r>"<CR>
nnoremap gt :! ctags -R . &<CR><CR>

fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
nnoremap fff :call ShowFuncName() <CR>

