let mapleader = "\<Space>"

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
	Plug 'preservim/nerdcommenter'
	"Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
	Plug 'tpope/vim-obsession'
	Plug 'folke/zen-mode.nvim'
	Plug 'tmux-plugins/vim-tmux'
	Plug 'christoomey/vim-tmux-navigator'
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
