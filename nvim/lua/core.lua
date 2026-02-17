vim.opt.number = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.ttimeoutlen = 0

vim.keymap.set("n", "<leader>f", function()
    local ft = vim.bo.filetype

    local lsp_supported = vim.tbl_filter(function(client)
        return client.server_capabilities.documentFormattingProvider
    end, vim.lsp.get_clients({ bufnr = 0 }))

    if #lsp_supported > 0 then
        vim.lsp.buf.format({ async = true })
        return
    end

    if ft == "json" then
        vim.cmd("%!jq .")
    else
        vim.notify("No formatter available for filetype: " .. ft, vim.log.levels.WARN)
    end
end, { desc = "Format buffer" })
