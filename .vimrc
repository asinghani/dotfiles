set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Other Plugins

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'scrooloose/nerdtree'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'

Plugin 'Raimondi/delimitMate'
Plugin 'mattn/emmet-vim'
Plugin 'kana/vim-submode' 
"Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'Siphalor/vim-atomified'
Plugin 'phanviet/vim-monokai-pro'
"Plugin 'w0rp/ale'
Plugin 'jeetsukumaran/vim-pythonsense'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Yggdroot/indentLine'
Plugin 'isRuslan/vim-es6'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'rustushki/JavaImp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/rmvim.vim'
Plugin 'zxqfl/tabnine-vim'
Plugin 'sheerun/vim-polyglot'

call vundle#end()


filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

let g:indentLine_color_term = 241
let g:indentLine_color_gui = '#626262'

syntax on
set background=dark
colorscheme default

augroup PythonCustomization
  " highlight python self, when followed by a comma, a period or a parenth
   :autocmd FileType python syn match pythonExceptions "\(\W\|^\)\@<=self\([\.,)]\)\@="
augroup END

highlight Pmenu ctermbg=gray guibg=gray
highlight PmenuSel ctermbg=yellow guibg=yellow
highlight LineNr term=bold cterm=NONE ctermfg=Gray ctermbg=NONE gui=NONE guifg=Gray guibg=NONE

let g:pymode_rope = 0

" set clipboard=unnamed
let python_highlight_all=1

let indentLine_char = ''

set encoding=utf-8

set mouse=a
set ruler
set ic

set number 

let g:syntastic_html_checkers = []

let mapleader = ';'

nmap <leader>e :call NERDComment("n", "Toggle")<CR>

let NERDTreeShowHidden=1

set tags=./tags;,~/.vimtags
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

map <C-V> :NERDTreeToggle<CR>
map <C-B> :TagbarToggle<CR>

nmap <silent> <leader>b :TagbarToggle<CR>:
"#autocmd BufEnter * nested :call tagbar#autoopen(0)

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nmap <leader>= <C-W>=


call submode#enter_with('grow/shrink', 'n', 's', '<leader>l', ':vertical resize -1<CR>')
call submode#enter_with('grow/shrink', 'n', 's', '<leader>h', ':vertical resize +1<CR>')
call submode#map('grow/shrink', 'n', 's', 'l', ':vertical resize -1<CR>')
call submode#map('grow/shrink', 'n', 's', 'h', ':vertical resize +1<CR>')


call submode#enter_with('grow/shrink', 'n', 's', '<leader>k', ':resize -1<CR>')
call submode#enter_with('grow/shrink', 'n', 's', '<leader>j', ':resize +1<CR>')
call submode#map('grow/shrink', 'n', 's', 'k', ':resize -1<CR>')
call submode#map('grow/shrink', 'n', 's', 'j', ':resize +1<CR>')

let g:submode_timeout = 0
let g:submode_keep_leaving_key = 1

"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
"let g:SuperTabContextDefaultCompletionType = "<C-X><C-O>"

"let g:jedi#use_splits_not_buffers = "bottom"
let g:jedi#completions_command = "<C-G>"
"#let g:jedi#documentation_command = "<C-K>"

let g:jedi#popup_on_dot = 0

set backspace=2

"nnoremap <silent> <Leader>l :vertical resize -1<CR>
"nnoremap <silent> <Leader>h :vertical resize +1<CR>
"nnoremap <silent> <Leader>k :resize +1<CR>
"nnoremap <silent> <Leader>j :resize -1<CR>

let user_emmet_expandabbr_key = '<C-G>'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall




nmap <leader>c :bd<CR>
nmap <leader>, :bp<CR>
nmap <leader>. :bn<CR>

nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :blast<CR>

let c = 1
while c <= 99
  execute "nnoremap " . c . "gb :" . c . "b\<CR>"
  let c += 1
endwhile



set splitbelow
set splitright

command! -nargs=1 Silent
            \   execute 'silent !' . <q-args>
            \ | execute 'redraw!'

command P Silent sp p
command Play Silent sp play
command Pause Silent sp pause
command S Silent sp n
command Skip Silent sp next


func! s:strfind(s,find,start)
        if type(a:find)==1
                let l:i = a:start
                while l:i<len(a:s)
                        if strpart(a:s,l:i,len(a:find))==a:find
                                return l:i
                        endif
                        let l:i+=1
                endwhile
                return -1
        elseif type(a:find)==3
                " a:find is a list
                let l:i = a:start
                while l:i<len(a:s)
                        let l:j=0
                        while l:j<len(a:find)
                                if strpart(a:s,l:i,len(a:find[l:j]))==a:find[l:j]
                                        return [l:i,l:j]
                                endif
                                let l:j+=1
                        endwhile
                        let l:i+=1
                endwhile
                return [-1,-1]
        endif
endfunc

func! s:strreplace(s,find,replace)
        if len(a:find)==0
                return a:s
        endif
        if type(a:find)==1 && type(a:replace)==1
                let l:ret = a:s
                let l:i = s:strfind(l:ret,a:find,0)
                while l:i!=-1
                        let l:ret = strpart(l:ret,0,l:i).a:replace.strpart(l:ret,l:i+len(a:find))
                        let l:i = s:strfind(l:ret,a:find,l:i+len(a:replace))
                endwhile
                return l:ret
        elseif  type(a:find)==3 && type(a:replace)==3 && len(a:find)==len(a:replace)
                let l:ret = a:s
                let [l:i,l:j] = s:strfind(l:ret,a:find,0)
                while l:i!=-1
                        let l:ret = strpart(l:ret,0,l:i).a:replace[l:j].strpart(l:ret,l:i+len(a:find[l:j]))
                        let [l:i,l:j] = s:strfind(l:ret,a:find,l:i+len(a:replace[l:j]))
                endwhile
                return l:ret
        endif

endfunc

" s:strreplace("abc",["a","b"],["b","a"])


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_min_count = 2

"let g:airline_section_a = '%#__accent_bold#%{airline#util#wrap(airline#parts#mode(),0)}%#__restore__#%{airline#util#append(airline#parts#crypt(),0)}%{airline#util#append(airline#parts#paste(),0)}%{airline#util#append(airline#extensions#keymap#status(),0)}%{airline#util#append(airline#parts#spell(),0)}%{airline#util#append("",0)}%{airline#util#append("",0)}%{airline#util#append(airline#parts#iminsert(),0)}'

hi SpellBad ctermbg=red guibg=red ctermfg=black guifg=black

command Python :vertical terminal python % 
set ttyfast
silent! set re=1


let g:table_mode_corner='|'

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'




command W w
command Wq wq
command WQ wq
command Q q

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

autocmd Filetype java setlocal omnifunc=javacomplete#Complete 
setlocal completefunc=javacomplete#CompleteParamsInfo 

nmap <leader>ji <Plug>(JavaComplete-Imports-Add)

" set timeout " Do time out on mappings and others
" set ttimeoutlen=0
" set timeoutlen=2000 " Wait {num} ms before timing out a mapping

"if !has('gui_running')
"    set ttimeoutlen=10
"    augroup FastEscape
"        autocmd!
"        au InsertEnter * set timeoutlen=0
"        au InsertLeave * set timeoutlen=1000
"    augroup END
"endif

set timeoutlen=1000 ttimeoutlen=0

noremap x "_x
vnoremap p "_dP
nnoremap <Space> @q

" Better seperator character
set fillchars=vert:│
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE

:nnoremap <C-g> :buffers<CR>:buffer<Space>


autocmd BufNewFile,BufRead *.md set filetype=markdown

