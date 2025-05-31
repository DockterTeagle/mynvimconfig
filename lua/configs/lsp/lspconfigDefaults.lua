local M = {}
local map = vim.keymap.set

-- export on_attach & capabilities
M.on_attach = function(client, bufnr)
	if client and bufnr then
		local function opts(desc)
			return { buffer = bufnr, desc = "LSP " .. desc }
		end
		if client.name == "ruff" then
			client.server_capabilities.hoverProvider = false
		end
		map("n", "gd", function()
			Snacks.picker.lsp_definitions()
		end)
		map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
		map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
		map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
		-- map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Show signature help"))

		map({ "n", "v" }, "<leader>ca", function()
			vim.lsp.buf.code_action()
		end, opts("Code action"))
		map("n", "gr", vim.lsp.buf.references, opts("Show references"))
	end
end

return M
