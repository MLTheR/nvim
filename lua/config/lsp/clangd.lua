local util = require("lspconfig.util")
local caps = require("cmp_nvim_lsp").default_capabilities()

local M = {}

M.cmd = {
  "C:/msys64/mingw64/bin/clangd.exe",

  "--background-index",
  "--clang-tidy",
  "--completion-style=detailed",
  "--header-insertion=never",
  "--fallback-style=Google",
}

M.filetypes = { "c", "cpp", "objc", "objcpp" }

M.root_dir = function(fname)
  return util.root_pattern(
    "compile_commands.json",
    ".clangd",
    ".git"
  )(fname) or util.path.dirname(fname)
end

M.on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
end

M.capabilities = caps

return M

