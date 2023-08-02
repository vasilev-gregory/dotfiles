vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true


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


-- zen
require("zen-mode").setup({
	window = {
		width = .99
	},
	plugins = {
		tmux = { enabled = false },
	}
})

require("catppuccin").setup({
	transparent_background = true,
})

vim.cmd.colorscheme "catppuccin"
local augroup = vim.api.nvim_create_augroup("numbertoggle", {})

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
   pattern = "*",
   group = augroup,
   callback = function()
      if vim.api.nvim_get_mode().mode ~= "i" then
         vim.opt.number = true
         vim.opt.relativenumber = true
      end
   end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
   pattern = "*",
   group = augroup,
   callback = function()
      vim.opt.number = false
      vim.opt.relativenumber = false
      vim.cmd "redraw"
   end,
})

