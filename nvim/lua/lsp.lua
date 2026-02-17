local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                checkThirdParty = false,
            },
            format = {
                enable = true,
            },
        },
    },
})

vim.lsp.enable("lua_ls")

local servers = {
    "clangd",
    "rust_analyzer",
    "gopls",
    -- "ocamllsp", -- managed by ocaml.nvim
    "hls",
    "texlab"
}

for _, server in ipairs(servers) do
    vim.lsp.config(server, {
        capabilities = capabilities,
    })
    vim.lsp.enable(server)
end

vim.lsp.config("tinymist", {
    cmd = { "tinymist" },
    filetypes = { "typst" },
    settings = {
        formatterMode = "typstyle",
    },
    capabilities = capabilities,
})

vim.lsp.enable("tinymist")
