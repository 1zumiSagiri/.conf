return {

    -- =====================
    -- Theme
    -- =====================
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000,
        config = function()
            vim.cmd("colorscheme onedark")
        end
    },

    -- =====================
    -- Treesitter
    -- =====================
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            local ok, configs = pcall(require, "nvim-treesitter.configs")
            if not ok then return end

            configs.setup({
                ensure_installed = {
                    "lua",
                    "cpp",
                    "rust",
                    "go",
                    "typst",
                    "ocaml",
                    "haskell",
                    "latex"
                },
                highlight = { enable = true },
            })
        end
    },

    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Tree" },
        },
        config = function()
            require("nvim-tree").setup({})
        end
    },

    -- =====================
    -- Telescope
    -- =====================
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- =====================
    -- LSP
    -- =====================
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lsp")
        end
    },

    -- =====================
    -- Completion
    -- =====================
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip"
        },
        config = function()
            require("completion")
        end
    },

    -- Lean / Coq
    { "julian/lean.nvim", ft = "lean" },
    { "whonore/Coqtail",  ft = "coq" },

    -- typst
    {
        "chomosuke/typst-preview.nvim",
        ft = "typst",
    },

    -- OCaml
    {
        "tarides/ocaml.nvim",
        config = function()
            require("ocaml").setup()
        end
    },

    -- =====================
    -- Error diagnostics
    -- =====================
    {
        "folke/trouble.nvim",
        event = "LspAttach",
        opts = {
            modes = {
                diagnostics = {
                    auto_open = true,
                    auto_close = true
                },
                test = {
                    mode = "diagnostics",
                    preview = {
                        type = "split",
                        relative = "win",
                        position = "right",
                        size = 0.3,
                    },
                },
            },
        },
        cmd = { "Trouble" },
    },
}
