-- Constructs the path to where lazy.nvim should be installed.
-- vim.fn.stdpath("data") usually resolves to ~/.local/share/nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Checks if lazy.nvim exists at lazypath
-- If not, it clones the latest stable branch using a minimal Git clone.
-- --filter=blob:none: skips file contents for faster clone.
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end


-- Prepends lazy.nvim to the runtime path (rtp), making it usable in require
vim.opt.rtp:prepend(lazypath)

-- Loads lazy plugin
require("lazy").setup({
    spec = "nimaidev.lazy",
    change_detection = { notify = false }
})
