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
require("lspconfig").lua_ls.setup({
	capabilities = capabilities,
	cmd = {"lua-language-server"},
	--cmd = {"/home/aka/.local/share/nvim/mason/packages/lua-language-server/libexec/bin/lua-language-server"},
	filetypes = { "lua" },
	--root_dir = util.root_pattern(root_files),
	single_file_support = true,
})

require("lspconfig").clangd.setup({
	capabilities = capabilities,
	cmd = {"/usr/local/bin/clangd18"},
	filetypes = {"cpp", "c"},
})

require("lspconfig").rust_analyzer.setup({
	capabilities = capabilities,
	--cmd = {"rust-analyzer"},
	cmd = {"/usr/local/bin/rust-analyzer"},
	filetypes = {"rust"},
	single_file_support = true,
	settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
            checkOnSave = {
                --command = "clippy", -- Gunakan `clippy` untuk analisis kode lebih ketat
                command = "check",
            },
            procMacro = {
                enable = true,
            },
            files = {
                watcher = "client", -- Paksa mode single file tanpa Cargo
            },
        },
    },
})

require("lspconfig").gopls.setup({
	capabilities = capabilities,
	cmd = {"gopls"},
	filetypes = {"go"},
	root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
            gofumpt = true,
        },
    },
})


-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { "cssls", "pyright", "ts_ls"}
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		-- on_attach = my_custom_on_attach,
		capabilities = capabilities,
	})
end

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
