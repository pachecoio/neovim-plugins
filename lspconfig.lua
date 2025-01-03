local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  "html",
  "cssls",
  "pyright",
  "gopls"
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  root_dir = lspconfig.util.root_pattern "package.json",
  single_file_support = false,
  capabilities = nvlsp.capabilities,
}

lspconfig.elixirls.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  -- requires installing elixir-ls with homebrew
  cmd = { "/opt/homebrew/Cellar/elixir-ls/0.26.1/bin/elixir-ls" },
}

return {}
