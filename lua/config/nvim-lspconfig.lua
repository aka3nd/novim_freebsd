--local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require("lspconfig").html.setup({
	capabilities = capabilities,

	configurationSection = { "html", "css", "javascript" },
	embeddedLanguages = {
		css = true,
		javascript = true,
	},
	provideFormatter = true,
})

require("lspconfig").bashls.setup({
	cmd = { "bash-language-server", "start" },
	filetypes = { "bash", "sh" },
})

require("lspconfig").clangd.setup({
	capabilities = capabilities,
	cmd = {"/usr/local/bin/clangd18"},
	filetypes = {"cpp", "c"},
})


-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { "cssls", "pyright", "ts_ls", "gopls","rust_analyzer" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		-- on_attach = my_custom_on_attach,
		capabilities = capabilities,
	})
end

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
