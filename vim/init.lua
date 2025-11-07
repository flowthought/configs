-- ========== Bootstrap plugin manager (lazy.nvim) ==========
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Leader key
vim.g.mapleader = " "

-- ========== Plugins ==========
require("lazy").setup({
  -- File tree (NERDTree) - classic gVim-style
  { "preservim/nerdtree", cmd = { "NERDTreeToggle", "NERDTreeFind" } },
  -- Themes
  "tomasr/molokai",
  "morhetz/gruvbox",
  "humanoid-colors/vim-humanoid-colorscheme",
  -- Git
  "tpope/vim-fugitive",
  "airblade/vim-gitgutter",
  -- Extensions
  "ctrlpvim/ctrlp.vim",
  "tpope/vim-commentary",
  "tpope/vim-surround",
  "godlygeek/tabular",
  "tpope/vim-repeat",
  "junegunn/limelight.vim",
  "junegunn/goyo.vim",
  -- Languages
  "rust-lang/rust.vim",
  "hail2u/vim-css3-syntax",
  -- Statusline
  "vim-airline/vim-airline",
  "vim-airline/vim-airline-themes",
})

-- ========== Options ==========
vim.opt.showmode = false                -- noshowmode
vim.opt.number = true
vim.opt.laststatus = 2
vim.opt.clipboard = "unnamed"           -- use system clipboard (Linux users may prefer 'unnamedplus')
vim.opt.backspace = "indent,eol,start"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.belloff = "all"
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.tabpagemax = 15
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hidden = true
vim.opt.confirm = true
vim.opt.ruler = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wildmenu = true
vim.opt.wildmode = "full"
vim.opt.wildignore:append({ "*.bmp","*.gif","*.ico","*.jpg","*.png","*.pdf","*.swp" })
vim.opt.updatetime = 1000
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

-- Matchit (like `runtime macros/matchit.vim`)
vim.cmd("packadd matchit")

-- ========== Keymaps ==========
local map = vim.keymap.set
local opts = { silent = true }

-- jk -> Esc
map("i", "jk", "<Esc>", opts)

-- NERDTree
map("n", "<C-n>", ":NERDTreeToggle<CR>", opts)

-- Toggle relative numbers (F7) in normal & insert
map("n", "<F7>", ":set relativenumber!<CR>", opts)
map("i", "<F7>", "<C-o>:set relativenumber!<CR>", opts)

-- Toggle search highlight (F2)
map("n", "<F2>", ":set hlsearch!<CR>", opts)

-- Make Y behave like C/D
map("n", "Y", "y$", opts)

-- Leader shortcuts
map("n", "<leader>e", ":e ", { silent = false })
map("n", "<leader>f", ":FZF<CR>", opts)
map("n", "<leader>or", ":e ./**/*", { silent = false })
map("n", "<leader>oh", ":e %<.h<CR>", opts)
map("n", "<leader>oc", ":e %<.cpp<CR>", opts)
map("n", "<leader>ov", ":e %<.cc<CR>", opts)
map("n", "<leader>oo", ":e! %<CR>", opts)
map("n", "<leader>on", ":new | only<CR>", opts)
map("n", "<leader>vv", ":e $MYVIMRC<CR>", opts)
map("n", "<leader>vl", ":source $MYVIMRC<CR>", opts)

-- Diffs
vim.opt.diffopt:append("vertical")
map("n", "<leader>od", ":windo diffthis<CR>", opts)
map("n", "<leader>oD", ":windo diffoff<CR>", opts)

-- Window management
map("n", "<leader>0", "<C-w>c", opts)
map("n", "<leader>1", "<C-w>o", opts)
map("n", "<leader>2", "<C-w>v", opts)
map("n", "<leader>3", "<C-w>s", opts)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Buffers
map("n", "<leader>b", ":b ", { silent = false })
map("n", "<leader>]", ":bn<CR>", opts)
map("n", "<leader>[", ":bp<CR>", opts)
map("n", "<leader>d", ":bp | bd #<CR>", opts)

-- Tabs (Ctrl-Tab may not be available on all platforms/terms)
map("n", "<C-Tab>", "gt", opts)
map("n", "<C-S-Tab>", "gT", opts)
map("n", "<leader>n", ":tabnew %<CR>", opts)
map("n", "<leader>tn", ":tabnew<CR>", opts)
map("n", "<leader>td", ":tabclose<CR>", opts)
map("n", "<leader>to", ":tabnew ", { silent = false })

-- File
map("n", "<leader>w", ":w<CR>", opts)

-- Lookup, quickfix nav
map("n", "<leader>lw", function()
  vim.cmd(("Lookup %s %s"):format(vim.fn.expand("<cword>"), vim.fn.getcwd()))
end, opts)
map("n", "<leader>ll", ":Lookup ", { silent = false })
map("n", "[q", ":cp<CR>", opts)
map("n", "]q", ":cn<CR>", opts)

-- Use '.' as a verb in visual mode; repeat last :substitute with flags
map("v", ".", [[:'<,'>normal.<CR>]], opts)
map("v", "&", ":&&<CR>", opts)
map("n", "&", ":&&<CR>", opts)

-- Move by display lines
for _, m in ipairs({ "n", "v", "o" }) do
  map(m, "j", "gj", opts)
  map(m, "k", "gk", opts)
  map(m, "0", "g0", opts)
  map(m, "$", "g$", opts)
  map(m, "^", "g^", opts)
  map(m, "gj", "j", opts)
  map(m, "gk", "k", opts)
  map(m, "g0", "0", opts)
  map(m, "g$", "$", opts)
  map(m, "g^", "^", opts)
end

-- Command-line: expand %% to current file's directory
vim.keymap.set("c", "%%", function()
  return (vim.fn.getcmdtype() == ":" and (vim.fn.expand("%:h") .. "/")) or "%%"
end, { expr = true })

-- ========== Commands ==========
-- Grep/Ag integration
-- if vim.fn.executable("ag") == 1 then
--   vim.opt.grepprg = "ag --nogroup --nocolor --vimgrep $*"
--   vim.opt.grepformat = "%f:%l:%c:%m"
--   vim.g.ctrlp_user_command = "ag %s -l --nocolor -g \"\""
-- end


-- ripgrep integration for :grep and CtrlP
if vim.fn.executable("rg") == 1 then
  -- Use ripgrep for :grep
  vim.opt.grepprg = "rg --color=never"

  -- Use ripgrep for CtrlP's file listing
  -- (%s is substituted by CtrlP)
  vim.g.ctrlp_user_command = 'rg %s --files --color=never --glob ""'
else
  -- Notify once on startup if rg is missing
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      vim.api.nvim_echo(
        { { "rg not found. CtrlP will use default user command", "WarningMsg" } },
        false,
        {}
      )
    end,
  })
end

-- :Lookup -> run grep silently and open quickfix
vim.api.nvim_create_user_command("Lookup", function(args)
  vim.cmd("silent grep! " .. args.args)
  vim.cmd("copen")
end, { nargs = "+" })

-- ========== Filetype preferences ==========
local filepref = vim.api.nvim_create_augroup("filepref", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = filepref,
  pattern = { "markdown", "py" },
  callback = function() vim.opt_local.textwidth = 80; vim.opt_local.fileformat = "unix" end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = filepref,
  pattern = { "cpp" },
  callback = function() vim.opt_local.shiftwidth = 2; vim.opt_local.tabstop = 2; vim.opt_local.textwidth = 80 end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = filepref,
  pattern = { "c", "cpp", "cs", "java" },
  callback = function() vim.opt_local.commentstring = "// %s" end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = filepref,
  pattern = { "html", "css", "hs" },
  callback = function() vim.opt_local.shiftwidth = 2; vim.opt_local.tabstop = 2 end,
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = filepref,
  pattern = "*.xaml",
  callback = function() vim.bo.filetype = "xml" end,
})

-- Fugitive: clear transient buffers
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "fugitive://*",
  callback = function() vim.opt_local.bufhidden = "delete" end,
})

-- ========== Airline ==========
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#tabline#show_buffers"] = 0
vim.g["airline#extensions#tabline#fnamemod"] = ":t"
vim.g.airline_powerline_fonts = 1
vim.g["airline#extensions#tabline#show_tab_type"] = 0

-- ========== CtrlP ==========
vim.g.ctrlp_working_path_mode = "rw"
vim.g.ctrlp_root_markers = { "tags", ".ctrlproot", ".git", ".stfolder" }
vim.g.ctrlp_clear_cache_on_exit = 0
-- (Your <leader>b mapping above opens :b for buffer number; keep extras)
vim.keymap.set("n", "<leader>B", ":CtrlPBuffer<CR>", opts)
vim.keymap.set("n", "<leader>M", ":CtrlPMRU<CR>", opts)

-- ========== Writing (Goyo/Limelight) ==========
vim.g.goyo_height = 37
map("n", "<leader>gg", ":Goyo<CR>", opts)
map("n", "<leader>ll", ":Limelight!!<CR>", opts)

-- ========== Machine-specific override ==========
-- Mirrors: if !empty(glob("~/_wvimrc")) | source ~/_wvimrc | endif
do
  local path = vim.fn.expand("~/_wvimrc")
  if vim.fn.empty(vim.fn.glob(path)) == 0 then
    vim.cmd("source " .. path)
  end
end

-- ========== Neovide niceties (optional, safe no-op elsewhere) ==========
if vim.g.neovide then
  -- Better macOS/Windows clipboard integration is automatic; nothing required.
  -- Set a comfortable font / scale if you like:
  -- vim.o.guifont = "JetBrainsMono Nerd Font:h14"
  -- vim.g.neovide_scale_factor = 1.0
end

vim.opt.guifont="Victor\\ Mono:h14"
