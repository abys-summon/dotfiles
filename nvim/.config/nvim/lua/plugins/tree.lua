return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup({
            view = {
                width = 30,
                side = "left",
            },
            renderer = {
                highlight_opened_files = "all",
                indent_markers = { enable = true },
            },
        })
        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Explorador de archivos" })
    end,
}
