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
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lspconfig").pyright.setup({
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "off",  -- No strict type checking
                            autoImportCompletions = false,  -- No auto-import suggestions
                            diagnosticMode = "openFilesOnly"  -- Lint only open files
                        }
                    }
                }
            })
        end
    },

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

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_keymap("n", "<C-p>", ":Files<CR>", { noremap = true, silent = true })  -- Bind :Files to Ctrl + P

