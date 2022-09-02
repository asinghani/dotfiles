set nocompatible
filetype off

runtime macros/matchit.vim

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" List of plugins

if $USE_TABNINE == "1"
    Plugin 'zxqfl/tabnine-vim'
endif

" Fundamental
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'xolox/vim-misc'
Plugin 'kana/vim-submode' 

" File-related
Plugin 'junegunn/fzf'
Plugin 'scrooloose/nerdtree'

" Text-editing
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Yggdroot/indentLine'

" Language support
Plugin 'geoffharcourt/vim-matchit'
Plugin 'sheerun/vim-polyglot'
Plugin 'jeetsukumaran/vim-pythonsense'
Plugin 'kylelaker/riscv.vim'
Plugin 'vhda/verilog_systemverilog.vim'
Plugin 'ARM9/arm-syntax-vim'

" Colors
Plugin 'phanviet/vim-monokai-pro'
Plugin 'altercation/vim-colors-solarized'

" Potentially useful plugins in the future
"Plugin 'xolox/vim-easytags'
"Plugin 'mattn/emmet-vim'
"Plugin 'majutsushi/tagbar'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'ervandew/supertab'
"Plugin 'w0rp/ale'
"Plugin 'isRuslan/vim-es6'
"Plugin 'dhruvasagar/vim-table-mode'
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'artur-shaik/vim-javacomplete2'
"Plugin 'rustushki/JavaImp.vim'
"Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'christoomey/rmvim.vim'


call vundle#end()



" Automatically set color scheme based on term config
if $ITERM_PROFILE == 'Light' || $LIGHT
    let g:solarized_termcolors=256
    syntax on
    set background=light
    colorscheme solarized
else
    syntax on
    set background=dark
    colorscheme monokai_pro
endif



" Generic display and text-editing config
set autoindent
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set splitbelow
set splitright
set encoding=utf-8
set mouse=a
set ruler
set ic
set number
set backspace=2
set timeoutlen=1000 ttimeoutlen=0
set ttyfast
silent! set re=1

" Builtin command remappings
let mapleader = ';'
command W w
command Wq wq
command WQ wq
command Q q

nmap <leader>c :bd<CR>
nmap <leader>, :bp<CR>
nmap <leader>. :bn<CR>

" Other mappings

" Movement between panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Resizing of panes
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


"  syntastic
command STM :SyntasticToggleMode

" Switch between bufs faster
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



" Syntax-highlighting things

" highlight python 'self', when followed by a comma, a period or a parenth
augroup PythonCustomization
   :autocmd FileType python syn match pythonExceptions "\(\W\|^\)\@<=self\([\.,)]\)\@="
augroup END

highlight Pmenu ctermbg=gray guibg=gray
highlight PmenuSel ctermbg=yellow guibg=yellow
highlight LineNr term=bold cterm=NONE ctermfg=Gray ctermbg=NONE gui=NONE guifg=Gray guibg=NONE
hi SpellBad ctermbg=red guibg=red ctermfg=black guifg=black
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE

" File-specific syntax config
autocmd BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.s,*.S set filetype=arm

" Avoid conceal issues with markdown/json
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:indentLine_conceallevel = 0
let g:indentLine_setConceal = 2
let g:indentLine_concealcursor = ""



" Execution configs (mildly useful)
command Python :vertical terminal python3 %
command Python3 :vertical terminal python3 % 


" Other misc syntax-related fixing
let g:pymode_rope = 0
let g:syntastic_python_checkers=['flake8']
let python_highlight_all=1
let g:syntastic_html_checkers = []

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Indent line and gutter
let g:indentLine_color_term = 241
let g:indentLine_color_gui = '#626262'
let indentLine_char = '|'
set colorcolumn=80

" File browsing/access
let NERDTreeShowHidden=1
map <C-B> :NERDTreeToggle<CR>
nmap <leader>f :FZF<CR>

" Useful text editing thingies
nmap <leader>e :call NERDComment("n", "Toggle")<CR>
noremap x "_x
vnoremap p "_dP
nnoremap <Space> @q

" Better seperator character
set fillchars=vert:│
:nnoremap <C-g> :buffers<CR>:buffer<Space>



""" Unused, possibly useful in the future

" Emmet (faster HTML)
"let user_emmet_expandabbr_key = '<C-G>'
"let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall

" Tags
"set tags=~/.vimtags
"let g:easytags_events = ['BufReadPost', 'BufWritePost']
"let g:easytags_async = 1
"let g:easytags_dynamic_files = 2
"let g:easytags_resolve_links = 1
"let g:easytags_suppress_ctags_warning = 1

" Table mode
"let g:table_mode_corner='|'
"
"function! s:isAtStartOfLine(mapping)
"  let text_before_cursor = getline('.')[0 : col('.')-1]
"  let mapping_pattern = '\V' . escape(a:mapping, '\')
"  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
"  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
"endfunction
"
"inoreabbrev <expr> <bar><bar>
"          \ <SID>isAtStartOfLine('\|\|') ?
"          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
"inoreabbrev <expr> __
"          \ <SID>isAtStartOfLine('__') ?
"          \ '<c-o>:silent! TableModeDisable<cr>' : '__'



" Status bar config
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


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#buffer_min_count = 2

"let g:airline_section_a = '%#__accent_bold#%{airline#util#wrap(airline#parts#mode(),0)}%#__restore__#%{airline#util#append(airline#parts#crypt(),0)}%{airline#util#append(airline#parts#paste(),0)}%{airline#util#append(airline#extensions#keymap#status(),0)}%{airline#util#append(airline#parts#spell(),0)}%{airline#util#append("",0)}%{airline#util#append("",0)}%{airline#util#append(airline#parts#iminsert(),0)}'
