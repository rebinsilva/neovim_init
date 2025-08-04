" vim:set foldmethod=marker:
"
" TODO
" fzf.vim needs configuring (different from fzf plugin)
"
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators

" On-demand loading
Plug 'scrooloose/nerdtree'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --clangd-completer' }
" Plug 'WolfgangMehner/vim-plugins'
" Plugin 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'christoomey/vim-run-interactive'
" Plugin 'gabrielsimoes/cfparser.vim'
" Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
" Plug 'vim-scripts/indentpython.vim'
" Plug 'nvie/vim-flake8'
Plug 'ryanoasis/vim-devicons'
Plug 'vimwiki/vimwiki'
Plug 'itchyny/calendar.vim', {'on': 'Calendar'}
" Plug 'majutsushi/tagbar'
" Plug 'lifepillar/gruvbox' " Change i3 to this colorscheme
Plug 'gruvbox-community/gruvbox' " Change i3 to this colorscheme
Plug 'SirVer/ultisnips'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'sbdchd/neoformat'
" Plug 'vim-latex/vim-latex'
Plug 'lervag/vimtex'
Plug 'puremourning/vimspector'
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'mboughaba/i3config.vim'
Plug 'udalov/kotlin-vim', {'for': 'kotlin'}
Plug 'python-mode/python-mode', { 'for': 'python'}
Plug 'rust-lang/rust.vim'
Plug 'preservim/tagbar'
Plug 'goerz/jupytext.nvim'

" Initialize plugin system
call plug#end()
" All of your Plugins must be added before the following line

" Commands
" PlugInstall [name ...] [#threads]	Install plugins
" PlugUpdate [name ...] [#threads]	Install or update plugins
" PlugClean[!]				Remove unlisted plugins (bang version will clean without prompt)
" PlugUpgrade				Upgrade vim-plug itself
" PlugStatus				Check the status of plugins
" PlugDiff				Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path]		Generate script for restoring the current snapshot of the plugins

filetype plugin indent on    " required

" For plugin YouCompleteMe {{{
let g:ycm_confirm_extra_conf=0
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_error_symbol = 'xx'
" }}}
" For plugin airline {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
let airline#extensions#syntastic#error_symbol = 'E:'
let airline#extensions#syntastic#stl_format_err = '%E{[%fe(#%e)]}'
let airline#extensions#syntastic#warning_symbol = 'W:'
let airline#extensions#syntastic#stl_format_warn = '%W{[%fw(#%w)]}'
let g:airline#extensions#vimtex#enabled = 1
let g:airline#extensions#vimtex#left = "{"
let g:airline#extensions#vimtex#right = "}"
let g:airline#extensions#vimtex#main = ""
let g:airline#extensions#vimtex#sub_main = "m"
let g:airline#extensions#vimtex#sub_local = "l"
let g:airline#extensions#vimtex#compiled = "c₁"
let g:airline#extensions#vimtex#continuous = "c"
let g:airline#extensions#vimtex#viewer = "v"
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ycm#error_symbol = 'E:'
let g:airline#extensions#ycm#warning_symbol = 'W:'
" }}}
" For plugin airline-themes {{{
" let g:airline_theme='solarized_flood'
let g:airline_theme='gruvbox'
" }}}
" For plugin syntastic {{{
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_compiler_options = "-std=gnu11"
let g:syntastic_cuda_compiler_options = "-std=c11"
let g:ycm_show_diagnostics_ui = 0 " Disabling ycm checkers for syntastic
set sessionoptions-=blank "To remove error window from getting saved
let g:syntastic_shell = "/bin/sh"
let g:syntastic_python_checkers = ["python"]
let g:syntastic_tex_checkers = []
" }}}

" For plugin ALE {{{
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1


" Turn off Syntax highlighting to speeden up ALE fix

function! SyntaxTurnOff()
  "Turns syntax off only in current buffer
  exec "syntax clear"
endfunction

function! SyntaxTurnOn()
  exec "syntax on"
endfunction

augroup SyntaxTempOffGroup
    autocmd!
    autocmd User ALEFixPre     call SyntaxTurnOff()
    autocmd User ALEFixPost    call SyntaxTurnOn()
augroup END

" FIXERS
let g:ale_fixers = {
	\   '*': ['remove_trailing_lines', 'trim_whitespace'],
	\ 'cpp': ['clang-format'],
	\ 'python': ['ruff'],
    \}
let g:ale_c_clangformat_options = "-style='{BasedOnStyle: Google, IndentWidth: 4, UseTab: Always, TabWidth: 4 }'"


" }}}
" For plugin nerdTree {{{
" autocmd vimenter * NERDTree
map <C-q> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}
" For plugin calendar.vim {{{
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
" }}}
" For plugin Vimwiki {{{
let g:vimwiki_use_calendar = 1
let g:vimwiki_use_mouse = 1
let g:vimwiki_list = [{'path': '~/vimwiki',
        \ 'template_path': '~/.config/nvim/vimwiki/templates/',
        \ 'template_default': 'default',
        \ 'template_ext': '.html',
		\ 'auto_export': 1,
		\ 'auto_toc': 1}]
" }}}
" For plugin vimtex {{{
" With neovim, it is useful to start the LaTeX editing session with `nvim --listen /tmp/nvimserver` (e.g. by using an alias)
let g:tex_flavor = 'latex'
" let g:vimtex_view_general_viewer = 'okular'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
" let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_view_general_viewer = 'zathura'
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

if empty(v:servername) && exists('*remote_startserver')
call remote_startserver('VIM')
endif


" Using UltiSnips#Anon
inoremap <silent> __ __<c-r>=UltiSnips#Anon('_{$1}$0', '__', '', 'i')<cr>
inoremap <silent> ^^ ^^<c-r>=UltiSnips#Anon('^{$1}$0', '^^', '', 'i')<cr>


nnoremap <localleader>lt :call vimtex#fzf#run()<cr>
" let g:vimtex_compiler_progname = 'nvr'
" }}}
" For plugin Vimspector {{{
" packadd! vimspector
let g:vimspector_enable_mappings = 'HUMAN'
" }}}
" For plugin tagbar {{{
nmap <F4> :TagbarToggle<CR>
" }}}

" For Cscope {{{
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
	    cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
	    cs add $CSCOPE_DB
	endif
	set csverb
" The following maps all invoke one of the following cscope search types:
"
"	0 or s: Find this C symbol
"	1 or g: Find this definition
"	2 or d: Find functions called by this function
"	3 or c: Find functions calling this function
"	4 or t: Find this text string
"	6 or e: Find this egrep pattern
"	7 or f: Find this file
"	8 or i: Find files #including this file
"	9 or a: Find places where this symbol is assigned a value
	nmap <Space>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <Space>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <Space>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <Space>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <Space>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <Space>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <Space>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <Space>d :cs find d <C-R>=expand("<cword>")<CR><CR>
	nmap <Space>a :cs find a <C-R>=expand("<cword>")<CR><CR>

	nmap <C-Space>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-Space>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-Space>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>a :vert scs find a <C-R>=expand("<cword>")<CR><CR>
endif
" }}}

syntax enable

packadd! matchit
packadd! termdebug
packadd! shellmenu
packadd! justify
runtime! ftplugin/man.vim

" set background=dark
colorscheme gruvbox
" colorscheme solarized

let python_highlight_all=1
syntax on

set mouse=a
set number
set showcmd
set linebreak
set clipboard=unnamedplus
set incsearch
set softtabstop=4
set tabstop=4
set shiftwidth=4
set cursorline
set mousefocus
set mousehide
set modeline
set scrolloff=2

nmap <F2> :set hls!<ENTER>
imap <F2> <ESC>:set hls!<ENTER>a
map  <silent> <F7>    <Esc>:cprevious<CR>
map  <silent> <F8>    <Esc>:cnext<CR>
