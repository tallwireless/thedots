-- Basic settings
vim.o.number = true -- Enable line numbers
vim.o.relativenumber = false -- Enable relative line numbers
vim.o.tabstop = 4 -- Number of spaces a tab represents
vim.o.shiftwidth = 4 -- Number of spaces for each indentation
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.smartindent = true -- Automatically indent new lines
vim.o.wrap = false -- Disable line wrapping
vim.o.cursorline = true -- Highlight the current line
vim.o.termguicolors = true -- Enable 24-bit RGB colors


-- Syntax highlighting and filetype plugins
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

-- Leader key
vim.g.mapleader = ' ' -- Space as the leader key

require("config.lazy")

vim.cmd('colorscheme tokyonight')

local set = vim.opt

------- SEARCH AND PATTERNS --------
set.incsearch = true    --incrementally search on /, don't wait for return
set.hlsearch = true            -- Highlight searches by default
set.ignorecase = true          -- Case insensitive search...
set.smartcase = true            -- ...unless uppercase letters are used in the search


------ Display ----------
set.scrolloff=3          -- Keep 3 lines below and above the cursor
set.background=dark

------ Windows
--set hidden                  -- Hide any buffer not in a window

-------- Messages, Info, Status
set.shortmess:append("a")            -- Use [+] [RO] [w] for modified, read-only, modified
set.showcmd = true                 -- Display what command is waiting for an operator
set.ruler = true                  -- Show pos below the win if there's no status line
set.laststatus = 2            -- Always show statusline, even if only 1 window
set.showtabline = 2
--set.noshowmode = true
set.report = 0                -- Notify me whenever any lines have changed
--set.vb t_vb=                -- Disable visual bell!  I hate that flashing.

------ Editing
--set.backspace = 2              -- Backspace over autoindent, EOL, and BOL
set.infercase = true              -- Try to guess at case for insertions if not a match
set.showmatch = true              -- Briefly jump to the previous matching paren
set.matchtime = 2             -- For .2 seconds
set.formatoptions:append("n")        -- gq recognizes numbered lists, and will try to
set.formatoptions:append("1")        -- break before, not after, a 1 letter word
--set.nowrap = true                 -- Turn off word wrap
set.textwidth = 100


------ Folding
set.foldmethod = "indent"       -- By default, use syntax to determine folds
set.foldlevelstart = 99       -- All folds open by default



--- Import Per filetype overrides ----
require("filetypes")

