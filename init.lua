-- Add Lazy.nvim to runtimepath
local lazypath = vim.fn.stdpath("config") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "williamboman/mason.nvim", config = true },
    { "williamboman/mason-lspconfig.nvim", config = true },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",  -- Automatically update parsers
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "python", "javascript", "html", "css" },  -- Install parsers
                highlight = { enable = true },  -- Enable syntax highlighting
                indent = { enable = true }  -- Enable automatic indentation
            })
        end
    },
    { "neovim/nvim-lspconfig" },

    -- FZF Plugin
    {
        "junegunn/fzf",
        build = function() vim.fn.system("yes | ./install") end, -- Ensure it's installed
    },
    {
        "junegunn/fzf.vim",
        config = function()
            -- Optional: Set keybindings for opening FZF
            vim.api.nvim_set_keymap("n", "<C-p>", ":Files<CR>", { noremap = true, silent = true })
        end
    }
})

-- Keybindings for LSP
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { silent = true })  -- Go to definition
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { silent = true })  -- Go to references
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { silent = true })  -- Hover documentation
vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", { silent = true })  -- Rename variable

-- Basic Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.termguicolors = true

vim.cmd("syntax on")
vim.cmd("colorscheme desert")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_keymap("n", "<C-p>", ":Files<CR>", { noremap = true, silent = true })  -- Bind :Files to Ctrl + P

