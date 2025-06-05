local M = {}
local map = vim.keymap.set

-- export on_attach & capabilities
M.on_attach = function(client, bufnr)
	local function opts(desc)
		return {
			buffer = bufnr,
			desc = "LSP " .. desc,
		}
	end
	map("n", "gD", function()
		Snacks.picker.lsp_declarations()
	end, opts("Go to declaration"))
	map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Show signature help"))
	map({ "n", "v" }, "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, opts("Code action"))
	map("n", "gd", function()
		Snacks.picker.lsp_definitions()
	end)
	map("n", "gr", function()
		Snacks.picker.lsp_references()
	end, opts("Show references"))
	map("n", "gi", function()
		Snacks.picker.lsp_implementations()
	end, opts("Go to implementation"))
	map("n", "gy", function()
		Snacks.picker.lsp_type_definitions()
	end, opts("Go to type definition"))
	map("n", "[d", function()
		vim.diagnostic.goto_prev({
			severity = {
				min = vim.diagnostic.severity.WARN,
				max = vim.diagnostic.severity.ERROR,
			},
		})
	end)
	map("n", "]d", function()
		vim.diagnostic.goto_next({
			severity = {
				min = vim.diagnostic.severity.WARN,
				max = vim.diagnostic.severity.ERROR,
			},
		})
	end)
	if client:supports_method("textDocument/inlayHint") then
		vim.lsp.inlay_hint.enable(true)
	end
end

return M
