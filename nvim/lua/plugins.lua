-- ===========================================================
-- plugins.lua  (for Neovim 0.12 vim.pack)
-- ===========================================================

-- Treesitter nvim-treesitter
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.cmd("TSUpdate")
    end
  end,
})

vim.pack.add({
  -- Theme
  "https://github.com/olimorris/onedarkpro.nvim",

  -- Treesitter
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },

  -- File tree
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-tree/nvim-tree.lua",

  -- Telescope
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",

  -- LSP
  "https://github.com/neovim/nvim-lspconfig",

  -- Completion
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  "https://github.com/L3MON4D3/LuaSnip",
  "https://github.com/hrsh7th/nvim-cmp",

  -- Lean / Rocq
  "https://github.com/julian/lean.nvim",
  "https://github.com/whonore/Coqtail",

  -- Typst
  "https://github.com/chomosuke/typst-preview.nvim",

  -- OCaml
  "https://github.com/tarides/ocaml.nvim",

  -- LaTeX
  "https://github.com/lervag/vimtex",

  -- Diagnostics
  "https://github.com/folke/trouble.nvim",
})

-- ===========================================================
-- Plugin configs
-- ===========================================================

-- Theme
vim.cmd("colorscheme onedark")

-- Treesitter
local ok, ts_configs = pcall(require, "nvim-treesitter.configs")
if ok then
  ts_configs.setup({
    ensure_installed = {
      "lua", "cpp", "rust", "go", "typst",
      "ocaml", "haskell", "latex",
    },
    highlight = { enable = true },
  })
end

-- File tree
require("nvim-tree").setup({})
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle File Tree" })

require("lsp")

require("completion")

-- OCaml
require("ocaml").setup()

-- VimTeX
vim.g.vimtex_view_general_viewer = "okular"
vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]

-- Trouble
require("trouble").setup({
  modes = {
    diagnostics = {
      auto_open = true,
      auto_close = true,
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
})

