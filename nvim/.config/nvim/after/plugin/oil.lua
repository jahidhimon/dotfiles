require("oil").setup({
  columns = { 
    "icon",
  },
  view_options = {
    show_hidden = true,
    natural_order = false
  },
  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
})
