-- Use spac as leader key
vim.g.mapleader = " "

-- File navigation
-- Open File Explorer with <leader>pv
vim.keymap.set("n","<leader>pv", vim.cmd.Ex)

-- Move line up/ down using J /K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") 
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Smooth Join, Scroll, and Search Centering
vim.keymap.set("n", "J", "mzJ`z")          -- Join lines without moving cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")    -- Scroll down & center cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz")    -- Scroll up & center cursor
vim.keymap.set("n", "n", "nzzzv")          -- Next search result, center & unfold
vim.keymap.set("n", "N", "Nzzzv")          -- Prev search result, center & unfold


-- Clipboard and paste
vim.keymap.set("x", "<leader>p", [["_dP]])

-- In visual mode, paste over selected text without overwriting the clipboard.
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Yank (copy) into system clipboard using
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- treat Ctrl + c as Esc
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disable/Repurpose Keys
vim.keymap.set("n", "Q", "<nop>")

-- Opens a new tmux window running tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
 
-- Formatting and Navigation
-- format current buffer using lsp
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Navigate quickfix list (used by LSP, grep, etc.)
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz") 
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz") 

-- Navigate location list (buffer-local diagnostics
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Smart find and Replace
-- Search and replace current word in a file 
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Inser Go-style error check snippet
vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

-- source current file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)


-- lsp related
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
