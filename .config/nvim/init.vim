"       _
"__   _(_)_ __ ___  _ __ ___
"\ \ / / | '_ ` _ \| '__/ __|
" \ V /| | | | | | | | | (__
"(_)_/ |_|_| |_| |_|_|  \___|
"

" Environment variables:
	set nocompatible
	filetype on
	filetype plugin on
	syntax on
	filetype plugin indent on
	let mapleader=","
	set conceallevel=0
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
	set spell spelllang=en_us,de_de			" spellchecker

" Autocommands and keyboard-shortcuts
	autocmd ColorScheme * highlight Conceal ctermfg=red ctermbg=0
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
	" highlighting
Plug 'purescript-contrib/purescript-vim' " syntax highlighting for Purs
Plug 'pangloss/vim-javascript'           " better highlighting & concealment for js
Plug 'elzr/vim-json'                     " improved highlighting for JSON
Plug 'mboughaba/i3config.vim'            " i3config syntax highlighting
Plug 'baskerville/vim-sxhkdrc'           " sxhkd syntax highlighting
"Plug 'plasticboy/vim-markdown'           " syntax highlighting for markdown
Plug 'vim-pandoc/vim-pandoc' 			 " control Pandoc through vim (for markdown)
Plug 'vim-pandoc/vim-pandoc-syntax'      " markdown (pandoc-flavour) syntax highlighting
Plug 'vim-pandoc/vim-rmarkdown'          " rmarkdown syntax highlighting
Plug 'rust-lang/rust.vim' 				 " Rust Syntax ( and more...)
Plug 'ap/vim-css-color'                  " color background for colors : #ffff00
	" prettyfy
Plug 'dylanaraps/wal.vim'           " pywal theme integration
Plug 'ehamberg/vim-cute-python'     " unicode characters == -> ≡
Plug 'vim-airline/vim-airline'      " nicer status bar
Plug 'godlygeek/tabular'            " align code along specified characters
Plug 'noahfrederick/vim-skeleton'   " templates for new files
Plug 'Raimondi/delimitMate'         " auto close brackets
Plug 'andymass/vim-matchup'         " finds closing and opening statements () <></> better
Plug 'vifm/vifm.vim'                " use vifm inside vim
Plug 'tpope/vim-commentary'         " comment stuff out with gc
"Plug 'dag/vim2hs'                   " tools for haskell dev
Plug 'neovimhaskell/haskell-vim'
Plug 'terryma/vim-multiple-cursors' " ctrl+n for selecting more same text (like sublime)
Plug 'junegunn/fzf.vim'             " fuzzy finder for commands
	" Spell / Grammar checking
Plug 'rhysd/vim-grammarous'         " Correct spelling / grammar mistakes
	" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
	" Special characters
Plug 'joom/latex-unicoder.vim' 			" Allow unicode input of math symbols using latex notation
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

" markdown
	let g:vim_markdown_folding_disabled = 1

" JavaScipt
	let g:javascript_conceal_function                  = "ƒ"
	let g:javascript_conceal_null                      = "∅"
	"let g:javascript_conceal_this                      = "@"
	let g:javascript_conceal_return                    = "↳"
	let g:javascript_conceal_undefined                 = "¿"
	let g:javascript_conceal_NaN                       = "ℕ"
	let g:javascript_conceal_prototype                 = "¶"
	let g:javascript_conceal_static                    = "•"
	let g:javascript_conceal_super                     = "Ω"
	let g:javascript_conceal_arrow_function            = "↦"
	let g:javascript_conceal_noarg_arrow_function      = "∅"
	let g:javascript_conceal_underscore_arrow_function = "∅"
	" augroup javascript_folding
	" 	au!
	" 	au FileType javascript setlocal foldmethod=syntax
	" augroup END

" Grammarous settings
	let g:grammarous#languagetool_cmd = 'languagetool'
	let g:grammarous#use_vim_spelllang = 1
	let g:grammarous#default_comments_only_filetypes = {
        \ '*' : 1, 'help' : 0, 'markdown' : 0,
        \ }
	let g:grammarous#hooks = {}
	function! g:grammarous#hooks.on_check(errs) abort
		nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
		nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
	endfunction

	function! g:grammarous#hooks.on_reset(errs) abort
		nunmap <buffer><C-n>
		nunmap <buffer><C-p>
	endfunction

" COC settins
	set hidden
	set nobackup
	set nowritebackup
	set updatetime=300
	set shortmess+=c
	set signcolumn=yes

	" Go through completion propositions with TAB
		inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
		inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
		function! s:check_back_space() abort
			let col = col('.') - 1
			return !col || getline('.')[col - 1]  =~# '\s'
		endfunction
	" Use <c-space> to trigger completion.
		inoremap <silent><expr> <c-space> coc#refresh()
	" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
	" position. Coc only does snippet and additional edit on confirm.
		if exists('*complete_info')
			inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
		else
			imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
		endif
	" Use `[g` and `]g` to navigate diagnostics
		nmap <silent> [g <Plug>(coc-diagnostic-prev)
		nmap <silent> ]g <Plug>(coc-diagnostic-next)
	" GoTo code navigation.
		nmap <silent> gd <Plug>(coc-definition)
		nmap <silent> gy <Plug>(coc-type-definition)
		nmap <silent> gi <Plug>(coc-implementation)
		nmap <silent> gr <Plug>(coc-references)
	" Use K to show documentation in preview window.
		nnoremap <silent> K :call <SID>show_documentation()<CR>
		function! s:show_documentation()
		  if (index(['vim','help'], &filetype) >= 0)
			execute 'h '.expand('<cword>')
		  else
			call CocAction('doHover')
		  endif
		endfunction
	" Highlight the symbol and its references when holding the cursor.
		autocmd CursorHold * silent call CocActionAsync('highlight')
	" Symbol renaming.
		nmap <leader>rn <Plug>(coc-rename)
	" Formatting selected code.
		xmap <leader>f  <Plug>(coc-format-selected)
		nmap <leader>f  <Plug>(coc-format-selected)
	" Automatic actions
		augroup mygroup
		  autocmd!
		  " Setup formatexpr specified filetype(s).
		  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
		  " Update signature help on jump placeholder.
		  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
		augroup end
	" Applying codeAction to the selected region.
	" Example: `<leader>aap` for current paragraph
		xmap <leader>a  <Plug>(coc-codeaction-selected)
		nmap <leader>a  <Plug>(coc-codeaction-selected)
	" Remap keys for applying codeAction to the current line.
		nmap <leader>ac  <Plug>(coc-codeaction)
	" Apply AutoFix to problem on the current line.
		nmap <leader>qf  <Plug>(coc-fix-current)
	" Introduce function text object
	" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
		xmap if <Plug>(coc-funcobj-i)
		xmap af <Plug>(coc-funcobj-a)
		omap if <Plug>(coc-funcobj-i)
		omap af <Plug>(coc-funcobj-a)
	" Use <TAB> for selections ranges.
	" NOTE: Requires 'textDocument/selectionRange' support from the language server.
	" coc-tsserver, coc-python are the examples of servers that support it.
		nmap <silent> <TAB> <Plug>(coc-range-select)
		xmap <silent> <TAB> <Plug>(coc-range-select)
	" Add `:Format` command to format current buffer.
	command! -nargs=0 Format :call CocAction('format')
	" Add `:Fold` command to fold current buffer.
	command! -nargs=? Fold :call     CocAction('fold', <f-args>)
	" Add `:OR` command for organize imports of the current buffer.
	command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
	" Add (Neo)Vim's native statusline support.
	" NOTE: Please see `:h coc-status` for integrations with external plugins that
	" provide custom statusline: lightline.vim, vim-airline.
		set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

	" Mappings using CoCList:
	" Show all diagnostics.
		nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
	" Manage extensions.
		nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
	" Show commands.
		nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
	" Find symbol of current document.
		nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
	" Search workspace symbols.
		nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
	" Do default action for next item.
		nnoremap <silent> <space>j  :<C-u>CocNext<CR>
	" Do default action for previous item.
		nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
	" Resume latest coc list.
		nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

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

" vim-skeleton
	let g:skeleton_replacements = {}
	function! g:skeleton_replacements.DATE()
		return strftime("%Y-%m-%d %a %H:%M %S")
	endfunction
	function! g:skeleton_replacements.AUTHOR()
		return "Luca Leon Happel"
	endfunction

" latex-unicoder.vim
	let g:unicoder_cancel_normal = 1
	let g:unicoder_cancel_insert = 1
	let g:unicoder_cancel_visual = 1
	nnoremap <C-l> :call unicoder#start(0)<CR>
	inoremap <C-l> <Esc>:call unicoder#start(1)<CR>
	vnoremap <C-l> :<C-u>call unicoder#selection()<CR>

" ____       _   _   _
"/ ___|  ___| |_| |_(_)_ __   __ _ ___
"\___ \ / _ \ __| __| | '_ \ / _` / __|
" ___) |  __/ |_| |_| | | | | (_| \__ \
"|____/ \___|\__|\__|_|_| |_|\__, |___/
"                            |___/

	" restore folds when reopening files
		augroup remember_folds
		  autocmd!
		  autocmd BufWinLeave * mkview
		  autocmd BufWinEnter * silent! loadview
		augroup END
	" hide/show concealed strings
		map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
	" enable spellchecker with F1
		map <F1> :set spell!<CR>
	" open new terminal with F4
		map <F4> :!urxvt<space>&<enter><enter>
	" prettyfy file
		nnoremap <F3> mzgggqG`z

	" GO
		autocmd FileType go noremap <F5> <ESC>:GoRun
	" HASKELL
		autocmd FileType haskell setlocal tabstop=2
		autocmd FileType haskell setlocal shiftwidth=2
		autocmd FileType haskell setlocal expandtab
		autocmd FileType cabal setlocal tabstop=2
		autocmd FileType cabal setlocal shiftwidth=2
		autocmd FileType cabal setlocal expandtab
	" LaTex
		autocmd FileType tex map <F5> :!pdflatex<space>%<enter>
	" RMARKDOWN
		" If it is a bookdown book
		if filereadable("_build.sh")
			autocmd FileType rmarkdown map <F5> :!./_build.sh<enter>
		" Otherwise
		else
			autocmd FileType rmarkdown map <F5> :!Rscript<space>-e<space>'library(rmarkdown);render("%")'<enter>
		endif
		autocmd FileType rmadkdown setlocal expandtab
	" MARKDOWN
		autocmd FileType markdown setlocal expandtab
