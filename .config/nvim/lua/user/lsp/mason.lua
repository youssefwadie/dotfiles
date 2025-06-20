-- Safe require
local ok_mason, mason = pcall(require, "mason")
local ok_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")

if not ok_mason or not ok_mason_lspconfig then
  return
end

-- Setup mason
mason.setup()

-- Setup mason-lspconfig
mason_lspconfig.setup {
  ensure_installed = { "lua_ls", "pyright", "jdtls" }, -- replace as needed
  automatic_installation = false, -- deprecated and should be removed
  automatic_enable = true,        -- new behavior: automatically enable LSP servers
}

-- Setup specific servers using vim.lsp.config
vim.lsp.config("lua_ls", vim.tbl_deep_extend("force",
  require("user.lsp.settings.sumneko_lua"),  -- now renamed or aliased to lua_ls
  {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }
))

vim.lsp.config("pyright", vim.tbl_deep_extend("force",
  require("user.lsp.settings.pyright"),
  {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }
))

vim.lsp.config("jdtls", vim.tbl_deep_extend("force",
  require("user.lsp.settings.jdtls"),
  {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }
))

