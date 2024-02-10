-- Editor Settings

-- Enable line numbers
vim.opt.number = true

-- Enable mouse input for all modes
vim.opt.mouse = 'a'

-- Ignore case when executing a search
vim.opt.ignorecase = true

-- Find upper case if included in search
vim.opt.smartcase = true

-- Show highlights from previous search
vim.opt.hlsearch = false

-- Wrap text
vim.opt.wrap = true

-- Preserve the indentation of a virtual line. 
-- These "virtual lines" are the ones only visible when wrap is enabled
vim.opt.breakindent = true

-- Tab character space. Default value = 8
vim.opt.tabstop = 4

-- Amount of characters Neovim will use to indent a line. 
-- This option influences the keybindings << and >>. 
-- Default value = 8
vim.opt.shiftwidth = 4

-- Transform a tab to spaces
vim.opt.expandtab = false

---------------------------------------------------------------------------

-- Keybindings

-- Because Neovim doesnt have enough already :)
-- vim.keymap.set({mode}, {lhs}, {rhs}, {opts})

-- Save changes made to a file with Space + w.
vim.keymap.set('n', '<space>w', '<cmd>write<cr>', {desc = 'Save'})

-- Copy to Clipboard
vim.keymap.set({'n', 'x'}, 'cc', '"+y')

-- Paste from clipboard
vim.keymap.set({'n', 'x'}, 'pc', '"+p')

-- Delete without changing the registers
vim.keymap.set({'n', 'x'}, 'x', '"_x')
vim.keymap.set({'n', 'x'}, 'X', '"_d')

---------------------------------------------------------------------------

-- Plugins

-- Install lazy.nvim

local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  if vim.g.plugins_ready then
    return
  end

  -- You can "comment out" the line below after lazy.nvim is installed
  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)

  require('lazy').setup(plugins, lazy.opts)
  vim.g.plugins_ready = true
end

-- Store in Neovim data folder so path is independent of OS.
lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

--------------------------------------------------------------------------

-- Configure lazy
lazy.opts = {}

--------------------------------------------------------------------------

-- Enable Plugins
lazy.setup({
	-- Theme
	{'maxmx03/dracula.nvim'},
	-- Status line
	{'nvim-lualine/lualine.nvim'},
	-- Icons
	{'kyazdani42/nvim-web-devicons'},
})

-- Apply Theme
vim.opt.termguicolors = true
vim.cmd.colorscheme 'dracula'

-- Configure lualine
require('lualine').setup()


--------------------------------------------------------------------------

-- Vimscript Plugins

-- Netrw - Neovim file explorer
-- Hide help text in banner
vim.g.netw_banner = 0

-- Set window size
vim.g.netrw_winsize = 30


--------------------------------------------------------------------------

-- User Commands

-- {name} must be a string and start with an uppercase
-- {command} if a string it must be a valid vimscript or it can a lua function
-- {opts} must be a lua table. If no options, provide an empty, {}, table

-- vim.api.nvim_create_user_command({name}, {command}, {opts})

-- Reload Config
vim.api.nvim_create_user_command('RC', 'source $MYVIMRC', {})

--------------------------------------------------------------------------

-- Autocommands

-- {event} must be a string
-- {opts} must be a lua command
-- see :help events for useful options

-- vim.api.nvim_create_autocmd({event}, opts})

--------------------------------------------------------------------------

-- User Modules

-- We can use lua modules to split our configuration into smaller pieces.
-- A common convention is to put every module we create into a single folder. 
-- We do this to avoid any potential conflict with a plugin. Lots of people 
-- call this module user (you can use another name). To make this module we
-- need to create a couple of folders inside our config folder. 
-- First create a lua folder, and inside that create a user folder. 
-- You can do it with this command.
-- :call mkdir(stdpath("config") . "/lua/user", "p")

-- Call scripts below
-- require('user.settings')
--------------------------------------------------------------------------

