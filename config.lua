--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
require('nvim-autopairs').disable()
lvim.colorscheme = "onedarkest"
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard

-- wrap visual selection in single quotes
vim.api.nvim_buf_set_keymap(0, 'v', ",'", [[c'<c-r>"'<esc>]], { noremap = true})
vim.api.nvim_buf_set_keymap(0, 'v', ',"', [[c"<c-r>""<esc>]], { noremap = true})

-- *
-- Settings
-- *
local init_custom_options = function()
  local custom_options = {
    relativenumber = true, -- Set relative numbered lines
    colorcolumn = "100", -- Indent line at what column? Set something like '99999' to not display it
    scrolloff = 5, -- Determines the number of context lines you would like to see above and below the cursor
    ignorecase = true, -- Ignore case in search
    smartcase = true, -- Case-sensitive search when search term contains uppercase characters. Otherwise, case-sensitive search.  timeoutlen = 200, -- Time to wait for a mapped sequence to complete (in milliseconds)
  }

  for k, v in pairs(custom_options) do
    vim.opt[k] = v
  end
end
init_custom_options()

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
--lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode = {
  -- Disable Ex mode, beause what the fuck is that...
  ["Q"] = "<NOP>",

  -- Alternative way to save
  ["<C-s>"] = ":w<CR>",

  -- Tab navigation
  ["<C-m>p"] = ":tabp<CR>",
  ["<C-m>l"] = ":tabl<CR>",

  -- -- Better window movement
  -- { "<C-h>", "<C-w>h" },
  -- { "<C-j>", "<C-w>j" },
  -- { "<C-k>", "<C-w>k" },
  -- { "<C-l>", "<C-w>l" },

  -- -- Resize with arrows
  ["<Up>"] = ":resize +2<CR>",
  ["<Down>"] = ":resize -2<CR>",
  ["<Left>"] = ":vertical resize -2<CR>",
  ["<Right>"] = ":vertical resize +2<CR>",

  -- -- QuickFix
  -- ["]q"] = ":cnext<CR>",
  -- ["[q"] = ":cprev<CR>",
  -- ["<C-q>"] = ":call QuickFixToggle()<CR>",

}
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
--lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.terminal.open_mapping = "<c-t>"
lvim.builtin.nvimtree.setup.view.side = "left"
--lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "cpp",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" }, args = { '--line-width', '100' } },
  { command = "isort", filetypes = { "python" }, args = { '--profile', 'black', 'combina-as' } },
  --   {
  --     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --     command = "prettier",
  --     ---@usage arguments to pass to the formatter
  --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --     extra_args = { "--print-with", "100" },
  --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --     filetypes = { "typescript", "typescriptreact" },
  --   },
}


-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "pylint", filetypes = { "python" } },
  {
    command = "mypy",
    filetypes = { "python"},
    extra_args = { "--ignore-missing-imports" },
  },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"},
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
}

lvim.plugins = {
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require "lsp_signature".on_attach()
    end
  },
  { "lunarvim/colorschemes" },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup({
        suggestion = { enabled = false },
        panel = { enabled = false }
      })
    end
  },
  --  {
  --    "folke/zen-mode.nvim",
  --    cmd = "ZenMode",
  --    event = "BufRead",
  --    config = function()
  --      require("zen-mode").setup({
  --        window = {
  --          backdrop = 1,
  --          height = 0.85, -- height of the Zen window
  --          options = {
  --            signcolumn = "no", -- disable signcolumn
  --            number = false, -- disable number column
  --            relativenumber = false, -- disable relative numbers
  --            -- cursorline = false, -- disable cursorline
  --            -- cursorcolumn = false, -- disable cursor column
  --            -- foldcolumn = "0", -- disable fold column
  --            -- list = false, -- disable whitespace characters
  --          },
  --        },
  --        plugins = {
  --          gitsigns = { enabled = false }, -- disables git signs
  --          -- your configuration comes here
  --          -- or leave it empty to use the default settings
  --          -- refer to the configuration section below
  --        },
  --      })
  --    end,
  --  },
}

---------------------------
-- github copilot related configs
local ok, copilot = pcall(require, "copilot")
if not ok then
  return
end

copilot.setup {
  suggestion = {
    keymap = {
      accept = "<c-l>",
      next = "<c-j>",
      prev = "<c-k>",
      dismiss = "<c-h>",
    },
  },
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<c-a>", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)
--
-- Below config is required to prevent copilot overriding Tab with a suggestion
-- when you're just trying to indent!
local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end
local on_tab = vim.schedule_wrap(function(fallback)
    local cmp = require("cmp")
    if cmp.visible() and has_words_before() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
    else
        fallback()
    end
end)
lvim.builtin.cmp.mapping["<Tab>"] = on_tab
---------------------------


-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
