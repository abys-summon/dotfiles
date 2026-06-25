return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        require'nvim-treesitter'.setup {
            install_dir = vim.fn.stdpath('data') .. '/site' 
        }

        require'nvim-treesitter'.install { 'lua', 'javascript', 'python', 'html', 'css', 'vim', 'vimdoc', 'bash', 'scss', 'c', 'cpp', 'kitty', 'yuck', 'zsh', 'xml', 'typescript', 'json', 'hyprlang' }

        vim.api.nvim_create_autocmd('FileType', {

            pattern = { "lua", "python", "javascript", "html", "css", "c", "cpp", "vim", "bash", "scss", "json", "jsonc", "xml", "zsh", "yuck", "hyprlang" },

            callback = function() vim.treesitter.start() end,
        })
    end
}
