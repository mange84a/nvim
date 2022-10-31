require("gruvbox").setup({
    overrides = {
        SignColumn = { bg = "#282828" },
        GitSignsAdd = { bg = "#282828", fg = "#689d6a" },
        GitSignsDelete = { bg = "#282828", fg = "#cc241d" },
        GitSignsChange = { bg = "#282828", fg = "#d65d0e" },
        NvimTreeFolderIcon = { fg = "#665c54" },
        NvimTreeExecFile = { fg = "#f9f5d7", bold = false }
       
    },
    palette_overrides = {
    }
})
vim.cmd("colorscheme gruvbox")
