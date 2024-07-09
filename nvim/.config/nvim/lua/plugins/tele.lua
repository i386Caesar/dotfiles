-- require('telescope').load_extension('harpoon')
require('telescope').load_extension('git_worktree')

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        size = {
          width = "95%",
          height = "95%",
        },
      },
    },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },
    mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>fo', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>o', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>fl', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>fS', require('telescope.builtin').git_status, { desc = '' })
vim.keymap.set('n', '<leader>fm', ":Telescope harpoon marks<CR>", { desc = 'Harpoon [M]arks' })
vim.keymap.set("n", "<leader>fr", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", { silent = true })
vim.keymap.set("n", "<leader>fR", "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", { silent = true })
-- vim.api.nvim_set_keymap("n", "ft", ":TodoTelescope<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader><tab>", "<Cmd>lua require('telescope.builtin').commands()<CR>", {noremap=false})

