local status_ok_mason, mason = pcall(require, "mason")
local status_ok_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")

if not status_ok_mason or not status_ok_lspconfig then
	return
end

mason.setup()

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
--
mason_lspconfig.setup_handlers  {
		function (server_name)
				local opts = {
					on_attach = require("user.lsp.handlers").on_attach,
					capabilities = require("user.lsp.handlers").capabilities,
				}

				 if server_name == "sumneko_lua" then
					local sumneko_opts = require("user.lsp.settings.sumneko_lua")
					opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
				 end

				 if server_name == "pyright" then
					local pyright_opts = require("user.lsp.settings.pyright")
					opts = vim.tbl_deep_extend("force", pyright_opts, opts)
				 end
				 if server_name == "jdtls" then
						 local jdtls_opts = require("user.lsp.settings.jdtls")
						 opts = vim.tbl_deep_extend("force", jdtls_opts, opts)
				 end

				-- This setup() function is exactly the same as lspconfig's setup function.
				-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
				lspconfig[server_name].setup{}

		end
}

