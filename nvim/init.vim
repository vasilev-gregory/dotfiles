let mapleader = "\<Space>"

let data_dir = '~/.local/share/nvim/site'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
	Plug 'preservim/nerdcommenter'
	Plug 'tpope/vim-obsession'
	Plug 'folke/zen-mode.nvim'
	Plug 'tmux-plugins/vim-tmux'
	Plug 'christoomey/vim-tmux-navigator'

	Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
	Plug 'AndrewRadev/splitjoin.vim'
	Plug 'SirVer/ultisnips'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

	Plug 'anuvyklack/hydra.nvim'
	Plug 'jbyuki/venn.nvim'
	"set ve=all

	Plug 'nvim-tree/nvim-tree.lua'

	Plug 'sheerun/vim-polyglot'
	Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
	Plug 'feline-nvim/feline.nvim'

	Plug 'sbdchd/neoformat'
	"Plug 'prettier/vim-prettier', {
		"\ 'do': 'yarn install --frozen-lockfile --production',
		"\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

	Plug 'mattn/emmet-vim'

	Plug 'othree/html5.vim'
	Plug 'pangloss/vim-javascript'
	Plug 'evanleck/vim-svelte', {'branch': 'main'}
	Plug 'othree/xml.vim'

	Plug 'vimwiki/vimwiki'
	"Plug 'github/copilot.vim'
	Plug 'takac/vim-hardtime'
	Plug 'easymotion/vim-easymotion'
call plug#end()


""" BASIC
set mouse=

set nocompatible
syntax on
filetype plugin on

set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э\\',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю\\.,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Э\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>

"https://vimtricks.com/p/what-is-set-hidden/
set hidden

" tabs & panes
set splitbelow
set splitright

nnoremap H gT
nnoremap L gt

" yank to system clipboard on Y
nnoremap Y "+y

" in insert or command mode move normally with ctrl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
tnoremap <C-h> <C-Left>
tnoremap <C-l> <C-Right>

nnoremap <silent> <C-W>t :res 10 <CR>
nnoremap <silent> <C-W>j :vertical res 40 <CR>

" term
tnoremap <Esc> <C-\><C-n>

augroup myterm | au!
    au TermOpen * if &buftype ==# 'terminal' | hori resize 10 | endif     
		set wfh
augroup end

function! FSQL()
    let saved_view = winsaveview()
    execute '%!python3 -c "import sqlparse, sys; sys.stdout.write(sqlparse.format(sys.stdin.read(), reindent=True))"'
    call winrestview(saved_view)
endfunction


""" PLUGS

" hardmode
let g:hardtime_default_on = 1
" easymotion
map ; <Plug>(easymotion-prefix)
" zen-mode
nnoremap <leader>z :ZenMode<cr>

" nerdcommenter
nmap <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle

""" golang stuff
" deoplete
let g:deoplete#enable_at_startup = 1

" vim-go
"let g:go_auto_sameids = 1

"Highlight white space after `[]`. 
"let g:go_highlight_array_whitespace_error = 0

"Highlight white space around the receive operator (`<-`) that doesn't follow the standard style. 
let g:go_highlight_chan_whitespace_error = 0

"Highlight commonly used library types (`io.Reader`, etc.). 
"let g:go_highlight_extra_types = 0

"Highlight instances of tabs following spaces. >
"let g:go_highlight_space_tab_error = 0

"Highlight trailing white space. >
"let g:go_highlight_trailing_whitespace_error = 0

"Highlight operators such as `:=` , `==`, `-=`, etc.
"let g:go_highlight_operators = 0

"Highlight function and method declarations.
"let g:go_highlight_functions = 0

"Highlight the variable names in parameters (including named return parameters) in function declarations. Setting this implies the functionality from |'g:go_highlight_functions'|.
"let g:go_highlight_function_parameters = 0

"Highlight function and method calls.
"let g:go_highlight_function_calls = 0

"Highlight struct and interface names.
"let g:go_highlight_types = 0

"Highlight struct field names.
"let g:go_highlight_fields = 0

"Highlights build constraints.
"let g:go_highlight_build_constraints = 0

"Highlight go:generate directives.
"let g:go_highlight_generate_tags = 0

"Highlight spelling errors in strings when |spell| is enabled.
"let g:go_highlight_string_spellcheck = 1

"Highlight printf-style formatting verbs inside string literals.
"let g:go_highlight_format_strings = 1

"Highlight variable names in variable declarations (`x` in ` x :=`).
"let g:go_highlight_variable_declarations = 0

"Highlight variable names in variable assignments (`x` in `x =`).
"let g:go_highlight_variable_assignments = 0

"Highlight diagnostic errors.
"let g:go_highlight_diagnostic_errors = 1

"Highlight diagnostic warnings.
"let g:go_highlight_diagnostic_warnings = 1

nnoremap gs :vsplit<CR>:GoDef<CR>
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>l <Plug>(go-lint)
autocmd FileType go nmap <leader>m <Plug>(go-metalinter)
autocmd FileType go map <C-n> :cnext<CR>
autocmd FileType go map <C-p> :cprevious<CR>

" nvim tree
nmap <leader><leader> :NvimTreeToggle<CR>
"nmap <leader><leader> :NvimTreeToggle<CR>:call win_execute(bufnr('term://*'), 'hori resize 10')<CR>
"function! ResizeTerm()
    "let term_win = win_findbuf(bufnr('term://*'))
    "if term_win != -1
        "call win_execute(term_win, 'hori resize 10')
    "endif
"endfunction

"nnoremap <leader><leader> :NvimTreeToggle<CR>:call ResizeTerm()<CR>
"nmap <leader><leader> :NvimTreeToggle<CR>:call win_execute(bufnr('term://*'), 'hori resize 10')<CR>


" telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>


augroup go_chat_syn
		autocmd!
		autocmd BufNewFile,BufRead *.go.chat set filetype=go
augroup end

lua dofile(vim.fn.expand('$HOME') .. '/dotfiles/nvim/init.lua')

" this gotta be AFTER lua file
highlight StatusLine guibg=#9b59b6 guifg=black
highlight StatusLineNC guibg=#8b49b6 guifg=black

