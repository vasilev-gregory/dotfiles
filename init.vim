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

	Plug 'nvim-tree/nvim-tree.lua'

	Plug 'sheerun/vim-polyglot'
	Plug 'catppuccin/nvim', { 'as': 'catppuccin' }


call plug#end()


""" BASIC

set mouse=

filetype plugin on

"https://vimtricks.com/p/what-is-set-hidden/
set hidden

" tabs & panes
set splitbelow
set splitright

nnoremap H gT
nnoremap L gt

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


""" PLUGS

" zen-mode
nnoremap <leader>z :ZenMode<cr>

" nerdcommenter
nmap <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle

""" golang stuff
" deoplete
let g:deoplete#enable_at_startup = 1

" vim-go
let g:go_auto_sameids = 1

"Highlight white space after `[]`. 
let g:go_highlight_array_whitespace_error = 0

"Highlight white space around the receive operator (`<-`) that doesn't follow the standard style. 
let g:go_highlight_chan_whitespace_error = 0

"Highlight commonly used library types (`io.Reader`, etc.). 
let g:go_highlight_extra_types = 0

"Highlight instances of tabs following spaces. >
let g:go_highlight_space_tab_error = 0

"Highlight trailing white space. >
let g:go_highlight_trailing_whitespace_error = 0

"Highlight operators such as `:=` , `==`, `-=`, etc.
let g:go_highlight_operators = 0

"Highlight function and method declarations.
let g:go_highlight_functions = 0

"Highlight the variable names in parameters (including named return parameters) in function declarations. Setting this implies the functionality from |'g:go_highlight_functions'|.
let g:go_highlight_function_parameters = 0

"Highlight function and method calls.
let g:go_highlight_function_calls = 0

"Highlight struct and interface names.
let g:go_highlight_types = 0

"Highlight struct field names.
let g:go_highlight_fields = 0

"Highlights build constraints.
let g:go_highlight_build_constraints = 0

"Highlight go:generate directives.
let g:go_highlight_generate_tags = 0

"Highlight spelling errors in strings when |spell| is enabled.
let g:go_highlight_string_spellcheck = 1

"Highlight printf-style formatting verbs inside string literals.
let g:go_highlight_format_strings = 1

"Highlight variable names in variable declarations (`x` in ` x :=`).
let g:go_highlight_variable_declarations = 0

"Highlight variable names in variable assignments (`x` in `x =`).
let g:go_highlight_variable_assignments = 0

"Highlight diagnostic errors.
let g:go_highlight_diagnostic_errors = 1

"Highlight diagnostic warnings.
let g:go_highlight_diagnostic_warnings = 1

nnoremap gs :vsplit<CR>:GoDef<CR>
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>l <Plug>(go-lint)
autocmd FileType go nmap <leader>m <Plug>(go-metalinter)
autocmd FileType go map <C-n> :cnext<CR>
autocmd FileType go map <C-p> :cprevious<CR>

" nvim tree
nmap <leader><leader> :NvimTreeToggle<CR>


lua << EOF
local hint = [[
 Arrow^^^^^^   Select region with <C-v> 
 ^ ^ _K_ ^ ^   _f_: surround it with box
 _H_ ^ ^ _L_
 ^ ^ _J_ ^ ^                      _<Esc>_
]]

local ok_hydra, Hydra = pcall(require, "hydra")
if ok_hydra then
	local Hydra = require('hydra')

	Hydra({
	   name = 'Draw Diagram',
	   hint = hint,
	   config = {
	      color = 'pink',
	      invoke_on_body = true,
	      hint = {
		 border = 'rounded'
	      },
	      on_enter = function()
		 vim.o.virtualedit = 'all'
	      end,
	   },
	   mode = 'n',
	   body = '<leader>d',
	   heads = {
	      { 'H', '<C-v>h:VBox<CR>' },
	      { 'J', '<C-v>j:VBox<CR>' },
	      { 'K', '<C-v>k:VBox<CR>' },
	      { 'L', '<C-v>l:VBox<CR>' },
	      { 'f', ':VBox<CR>', { mode = 'v' }},
	      { '<Esc>', nil, { exit = true } },
	   }
	})
end

-- tree
require("nvim-tree").setup({
	actions = {
		open_file = {
			quit_on_open = true,
			window_picker = {
				enable = true, 
				picker = default,
				chars = "fjdksla;"
			}
		}
	},
	renderer = {
		icons = {
			show = {
				file = false, 
				folder = false, 
				folder_arrow = false, 
				git = false, 
				modified = false,
			},
			glyphs = {
				default = "", 
				symlink = ""
			}
		}
	}
})

require("catppuccin").setup({
	transparent_background = true,
})

vim.cmd.colorscheme "catppuccin"

EOF
