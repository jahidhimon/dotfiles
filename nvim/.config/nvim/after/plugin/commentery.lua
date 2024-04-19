vim.keymap.set("n", "<leader>\\", vim.cmd.Commentary);

local autocmd = vim.api.nvim_create_autocmd

autocmd('Filetype', {
  pattern = { 'ruby' },
  command = 'setlocal commentstring=# %s'
})

