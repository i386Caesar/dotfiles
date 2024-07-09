-- Mapping Leader Key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable Space key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Basic mappings
vim.api.nvim_set_keymap('n', '<space><space>', "<cmd>set nohlsearch<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-c>', "<cmd>%y+<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-x>', "<cmd>%d<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-d>', "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', "<C-u>zz", { noremap = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Toggle Undotree
vim.keymap.set('n', '<leader>u', ":UndotreeToggle<CR>", { noremap = true, silent = true })

-- Toggle InspectTree
vim.keymap.set('n', '<leader>i', ":InspectTree<CR>", { noremap = true, silent = true })

-- Delete without yanking
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Paste without yanking
vim.keymap.set('x', '<leader>p', [["_dP]])

-- Navigate to next and previous locations with centering
vim.api.nvim_set_keymap('n', '<leader>k', "<cmd>lnext<CR>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>j', "<cmd>lprev<CR>zz", { noremap = true, silent = true })

-- Replace current word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Center search results
vim.api.nvim_set_keymap('n', 'n', "nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', "Nzzzv", { noremap = true, silent = true })

-- Join lines and keep cursor position
vim.api.nvim_set_keymap('n', 'J', "mzJ`z", { noremap = true, silent = true })

-- Quit without saving
vim.keymap.set("n", "<leader>q", ":q!<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>w", ":wq<CR>", {silent = true, noremap = true})

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Floaterm
vim.keymap.set("n", "<leader>tt", ":FloatermNew! --height=0.9 --width=0.9 <CR>" , {silent = true, noremap = true})
vim.keymap.set("n", "<leader>tp", ":FloatermNew! --height=0.9 --width=0.9 python %<CR>" , {silent = true, noremap = true})
vim.keymap.set("n", "<leader>tc", ":FloatermNew! --height=0.9 --width=0.9 clang++ % -o %< && ./%<<CR>" , {silent = true, noremap = true})
vim.keymap.set("n", "<leader>tr", ":FloatermNew! --height=0.9 --width=0.9 cargo build && cargo run<CR>" , {silent = true, noremap = true})

vim.keymap.set("n", "<leader>y", "<cmd>CellularAutomaton make_it_rain<CR>" , {silent = true, noremap = true})
