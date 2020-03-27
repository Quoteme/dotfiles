"       _
"__   _(_)_ __ ___  _ __ ___
"\ \ / / | '_ ` _ \| '__/ __|
" \ V /| | | | | | | | | (__
"(_)_/ |_|_| |_| |_|_|  \___|
"

" Environment variables:
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number
	set relativenumber
	set tabstop=4
	set shiftwidth=4
	set clipboard=unnamedplus				" Allow for use of system-wide copy and paste functions
	set scrolloff=5							" Keep at least 3 lines above/below when scrolling
	set hlsearch							" Highlight search
	set noswapfile							" Don't use swap file
	set incsearch ignorecase				" Increase search
	set smartcase							" Override the 'ignorecase' option if the
											" search pattern contains upper case characters.
	"set foldenable							" enable folding
	"set foldmethod=syntax					" fold based on indent level
	set mouse=a
	set undofile undodir=~/.vim/tmp/undo/	" Set undofiles (undo files even if you exited the file)
	set splitbelow							" Splits open at the bottom and right
	set splitright
	set wildmode=longest,list,full			" Enable autocompletion:
	set wildmenu
	set lazyredraw							" redraw only when we need to.
	set colorcolumn=72						" limit the text input
	"set spell!								" spellchecker
	if has('nvim')
		" nothing
	else
		set pyxversion=3
	endif
	autocmd ColorScheme * highlight Conceal ctermfg=red ctermbg=0

" Autocommands and keyboard-shortcuts
	" Automatically deletes all tralling whitespace on save.
		autocmd BufWritePre * %s/\s\+$//e
	" Disables automatic commenting on newline:
		autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	" Make 0 go to the first character rather than the beginning
	" " of the line. When we're programming, we're almost always
	" " interested in working with text rather than empty space. If
	" " you want the traditional beginning of line, use ^
		nnoremap 0 ^
		nnoremap ^ 0
	" Fix the go to next line if wrap is enabled
		nnoremap <expr> j v:count ? 'j' : 'gj'
		nnoremap <expr> k v:count ? 'k' : 'gk'
	" Return to last edit position when opening files (You want this!)
		augroup Remember_cursor_position
			autocmd!
			autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
		augroup END
	" Show spaces as red if there's nothing after it (stole Greg Hurrel)
		augroup TrailWhiteSpaces
			highlight ColorColumn ctermbg=1
			autocmd BufWinEnter <buffer> match Error /\s\+$/
			autocmd InsertEnter <buffer> match Error /\s\+\%#\@<!$/
			autocmd InsertLeave <buffer> match Error /\s\+$/
			autocmd BufWinLeave <buffer> call clearmatches()
		augroup END


" ____  _
"|  _ \| |_   _  __ _
"| |_) | | | | |/ _` |
"|  __/| | |_| | (_| |
"|_|   |_|\__,_|\__, |
"               |___/
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
"Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'noahfrederick/vim-skeleton'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'ehamberg/vim-cute-python'
Plug 'ap/vim-css-color'
Plug 'scrooloose/nerdtree'
Plug 'Raimondi/delimitMate'
Plug 'andymass/vim-matchup'
Plug 'dylanaraps/wal.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'https://github.com/mboughaba/i3config.vim'
Plug 'vifm/vifm.vim'
Plug 'tpope/vim-commentary'
" Plug 'w0rp/ale'
Plug 'dag/vim2hs'
Plug 'vim-airline/vim-airline'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" DEOPLETE
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'Inazuma110/deoplete-greek'
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
	" requires aur/flow-bin
Plug 'wokalski/autocomplete-flow'
	" requires aur/python-jedi
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'Shougo/deoplete-clangx'
" Initialize plugin system
call plug#end()

" ____  _               ____       _   _   _
"|  _ \| |_   _  __ _  / ___|  ___| |_| |_(_)_ __   __ _ ___
"| |_) | | | | |/ _` | \___ \ / _ \ __| __| | '_ \ / _` / __|
"|  __/| | |_| | (_| |  ___) |  __/ |_| |_| | | | | (_| \__ \
"|_|   |_|\__,_|\__, | |____/ \___|\__|\__|_|_| |_|\__, |___/
"               |___/                              |___/
" i3 Syntax
	aug i3config_ft_detection
		au!
		au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
		au BufNewFile,BufRead ~/.config/wmderland/config set filetype=i3config
	aug end

" colorscheme
	colorscheme wal
	" colorscheme torte

" deoplet settings
	let g:deoplete#enable_at_startup = 1
	let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
	let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

" JavaScipt
	let g:javascript_conceal_function                  = "ƒ"
	let g:javascript_conceal_null                      = "∅"
	let g:javascript_conceal_this                      = "@"
	let g:javascript_conceal_return                    = "↳"
	let g:javascript_conceal_undefined                 = "¿"
	let g:javascript_conceal_NaN                       = "ℕ"
	let g:javascript_conceal_prototype                 = "¶"
	let g:javascript_conceal_static                    = "•"
	let g:javascript_conceal_super                     = "Ω"
	let g:javascript_conceal_arrow_function            = "↦"
	let g:javascript_conceal_noarg_arrow_function      = "∅"
	let g:javascript_conceal_underscore_arrow_function = "∅"
	set conceallevel=1
	augroup javascript_folding
		au!
		au FileType javascript setlocal foldmethod=syntax
	augroup END

" NERDTree key
	map <f2> :NERDTreeToggle<CR>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<c-b>"
	let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" vim2hs
	"let g:haskell_conceal_wide = 1

" delimitMate
	let delimitMate_expand_space=1
	let delimitMate_expand_cr=1

" airline
	"let g:airline_statusline_ontop=1


" ____       _   _   _
"/ ___|  ___| |_| |_(_)_ __   __ _ ___
"\___ \ / _ \ __| __| | '_ \ / _` / __|
" ___) |  __/ |_| |_| | | | | (_| \__ \
"|____/ \___|\__|\__|_|_| |_|\__, |___/
"                            |___/

	" hide/show concealed strings
		map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
	" enable spellchecker with F1
		map <f1> :set spell!<CR>
	" open new terminal with F4
		map <F4> :!urxvt<space>&<enter><enter>

	" GO
		autocmd FileType go noremap <F5> <ESC>:GoRun
	" HASKELL
		autocmd FileType haskell setlocal expandtab
	" LaTex
		autocmd FileType tex map <F5> :!pdflatex<space>%<enter>
