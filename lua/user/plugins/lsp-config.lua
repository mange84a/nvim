require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "phpactor" }
})


local on_attach = function(_, _)
    -- goto definition
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    -- Toggle lsp on off
    vim.keymap.set('n', '<leader>td', function()
        vim.diagnostic.enable(not vim.diagnostic.is_enabled())
    end, { silent = true, noremap = true })


    
end

require("lspconfig").lua_ls.setup {
    on_attach = on_attach
    --Root dir
}

require("lspconfig").phpactor.setup {
    on_attach = on_attach,
    -- settings indentsize 4 spaces
    -- If wp-config.php exists, use as root_dir, else use .git
    root_dir = function(fname)
        return require("lspconfig/util").root_pattern 'wp-config.php'(fname)
             or require("lspconfig/util").root_pattern('.git')(fname)
        end,
    settings = {
        php = {
            format = {
                indent_size = 4,
                indent_style = "space"
            }
        }
    }
}


