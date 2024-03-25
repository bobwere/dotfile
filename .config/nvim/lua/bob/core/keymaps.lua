-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--nnoremap("<C-d>", "<C-d>zz")
--nnoremap("<C-u>", "<C-u>zz")
--nnoremap("n", "nzzzv")
--nnoremap("N", "Nzzzv")

keymap.set("n", "<leader>pd", vim.cmd.Ex)

keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>")

keymap.set("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>")

keymap.set("n", "<leader>gsy", "<cmd> GoTagAdd yaml <CR>")

keymap.set("n", "<leader>ds", function()
  local widgets = require("dap.ui.widgets")
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end)

keymap.set("n", "<leader>dgt", function()
  require("dap.go").debug_test()
end)

keymap.set("n", "<leader>dgl", function()
  require("dap.go").debug_last()
end)

keymap.set("n", "<leader>rcu", function()
  require("crates").upgrade_all_crates()
end)
