set nocompatible              " be iMproved, required
filetype off  

" Specify a directory for plugins
" " - For Neovim: stdpath('data') . '/plugged'
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
"
Plug 'junegunn/vim-easy-align'

Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdtree-project-plugin'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'mattn/emmet-vim'

" Javascript Development 
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'christoomey/vim-system-copy'
Plug 'grvcoelho/vim-javascript-snippets'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'airblade/vim-rooter'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'mxw/vim-jsx'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pedrohdz/vim-yaml-folds'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }

Plug 'HerringtonDarkholme/yats.vim'

Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'sjl/gundo.vim'
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'



" Initialize plugin system
 call plug#end()

set number
set rtp+=/usr/local/opt/fzf

" Settings {{{
" " Switch syntax highlighting on, when the terminal has colors
syntax on
"
" " Use vim, not vi api
set nocompatible
"
" " No backup files
set nobackup
"
" " No write backup
set nowritebackup
"
" " No swap file
set noswapfile
"
" " Command history
set history=10000
"
" " Always show cursor
set ruler
"
" " Show incomplete commands
set showcmd
"
" " Incremental searching (search as you type)
set incsearch
"
" " Highlight search matches
set hlsearch
"
" " Ignore case in search
set smartcase
"
" " Make sure any searches /searchPhrase doesn't need the \c escape character
set ignorecase
"
" " A buffer is marked as ‘hidden’ if it has unsaved changes, and it is not
" currently loaded in a window
" " if you try and quit Vim while there are hidden buffers, you will raise an
" error:
" " E162: No write since last change for buffer “a.txt”
set hidden
"
" " Turn word wrap off
set nowrap
"
" " Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start
"
" " Convert tabs to spaces
 set expandtab
"
" " Set tab size in spaces (this is for manual indenting)
 set tabstop=2
"
" " The number of spaces inserted for a tab (used for auto indenting)
 set shiftwidth=2
"
" " Turn on line numbers
set number
"
" " Highlight tailing whitespace
" " See issue: https://github.com/Integralist/ProVim/issues/4
set list listchars=tab:\ \ ,trail:·
"
" " Get rid of the delay when pressing O (for example)
" "
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
 set timeout timeoutlen=1000 ttimeoutlen=100
"
" " Always show status bar
set laststatus=2
"
" " Set the status line to something useful
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)
"
" " Hide the toolbar
set guioptions-=T
"
" " Autoload files that have changed outside of vim
set autoread
"
" " Use system clipboard
" "
" http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
set clipboard+=unnamed
"
" " Don't show intro
set shortmess+=I
"
" " Better splits (new windows appear below and to the right)
set splitbelow
set splitright
"
" " Highlight the current line
set cursorline
"
" " Ensure Vim doesn't beep at you every time you make a mistype
set visualbell
"
" " Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu
"
" " redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw
"
" " highlight a matching [{()}] when cursor is placed on start/end character
set showmatch
"
" " Set built-in file system explorer to use layout similar to the NERDTree
" plugin
" let g:netrw_liststyle=3
"
" " Always highlight column 80 so it's easier to see where
" " cutoff appears on longer screens
autocmd BufWinEnter * highlight ColorColumn ctermbg=darkred
set colorcolumn=120
" " }}}

colorscheme gruvbox
set encoding=UTF-8
set background=dark
set autoindent
set softtabstop=2
syntax enable
nnoremap <leader><space> :nohlsearch<CR>
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent
map :w :up
map :q :confirm q
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
let mapleader=","       " leader is comma
inoremap jk <esc>
inoremap kj <esc>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>a :Ag
" Alte remaps -> good ones
nnoremap Y y$
" Keep it in center
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
" undo break points
inoremap , ,<c-g>U
inoremap . .<c-g>U
inoremap ! !<c-g>U
inoremap ? ?<c-g>U
inoremap [ [<c-g>U
" jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "" ) . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "" ) . 'j'
" Moving Text

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m +1<CR>==
nnoremap <leader>k :m -2<CR>==



" save session
nnoremap <leader>s :mksession<CR>
" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|node_modules)$'
" CtrlP
map <leader>t <C-p>
map <leader>y :CtrlPBuffer<cr>
let g:ctrlp_show_hidden=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_max_height=30
"
" " CtrlP -> override <C-o> to provide options for how to open files
let g:ctrlp_arg_map = 1
"
" " CtrlP -> files matched are ignored when expanding wildcards
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store
"
" " CtrlP -> use Ag for searching instead of VimScript
" " (might not work with ctrlp_show_hidden and ctrlp_custom_ignore)
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"
" " CtrlP -> directories to ignore when fuzzy finding
let g:ctrlp_custom_ignore = '\v[\/]((node_modules)|\.(git|svn|grunt|sass-cache))$'
"
" " Ack (uses Ag behind the scenes)
let g:ackprg = 'ag --nogroup --nocolor --column'
"
" " Airline (status line)
let g:airline_powerline_fonts = 1

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction


let g:xml_syntax_folding = 0
let g:yats_host_keyword = 1
imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let b:ale_fixers = ['eslint']
let g:ale_fix_on_save = 1

"========== FZF Config =============

" This is the default extra key bindings
let g:fzf_action = {
   \ 'ctrl-t': 'tab split',
   \ 'ctrl-x': 'split',
   \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

map <C-f> :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>


let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
"
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


"Get Files
command! -bang -nargs=? -complete=dir Files
 \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg -g "!dist/" -g "!package-lock.json" -g "!yarn.lock" -g "!.git" -g "!node_modules" --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options':'--exact --delimiter : --nth 4..'}), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg  -g "!dist/" -g "!package-lock.json" -g "!yarn.lock" -g "!.git" -g "!node_modules" --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)


"========== END  FZF Config =========
" Emmet config
let g:user_emmet_leader_key='<C-y>'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" End Emmmet config 

" Prettier config
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync
" max line length that prettier will wrap on
let g:prettier#config#print_width = 80

" number of spaces per indentation level
let g:prettier#config#tab_width = 2

" use tabs over spaces
let g:prettier#config#use_tabs = 'false'

" print semicolons
let g:prettier#config#semi = 'true'

" single quotes over double quotes
let g:prettier#config#single_quote = 'true'

" print spaces between brackets
let g:prettier#config#bracket_spacing = 'false'

" put > on the last line instead of new line
let g:prettier#config#jsx_bracket_same_line = 'true'

" none|es5|all
let g:prettier#config#trailing_comma = 'all'

" flow|babylon|typescript|css|less|scss|json|graphql|markdown
let g:prettier#config#parser = 'typescript'

" cli-override|file-override|prefer-file
let g:prettier#config#config_precedence = 'prefer-file'

" End prettier config

" NERDTress Ctrl+n
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>


let g:coc_global_extensions = [
	  \ 'coc-tsserver',
	  \ 'coc-prettier',
	  \ 'coc-eslint'
  \ ]
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>gf :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gs :G<CR>
nnoremap <leader>gc :GCheckout<CR>

augroup filetype_yaml
    autocmd!
    autocmd BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
    autocmd FileType yaml |
        setlocal shiftwidth=2 |
        setlocal softtabstop=2 |
        setlocal tabstop=2
augroup END 
