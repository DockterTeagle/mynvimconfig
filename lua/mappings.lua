-- add yours here
local wk = require("which-key")
local map = vim.keymap.set
require("nvchad.mappings")
local mappings = {
	n = {
		["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
		["<F6>"] = { "<cmd>CompilerOpen<CR>", "open the compiler" },
		["<S-F6>"] = { "<cmd>CompilerToggleResults<CR>", "toggle results" },
		["<leader>dtb"] = {
			function()
				require("dap").toggle_breakpoint()
			end,
			"Add breakpoint at line",
		},
		["<leader>dsb"] = {
			function()
				require("dap").step_back()
			end,
			"Step back",
		},
		["<leader>dsi"] = {
			function()
				require("dap").step_into()
			end,
			"Step into function",
		},
		["<leader>dso"] = {
			function()
				require("dap").step_over()
			end,
			"Step over function",
		},
		["<leader>dsO"] = {
			function()
				require("dap").step_out()
			end,
			"Step out of function",
		},
		["<leader>dc"] = {
			"<cmd> DapContinue <CR>",
			"Start or continue the debugger",
		},
		["<leader>dus"] = {
			function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scopes)
				sidebar.open()
			end,
			"Open debugging sidebar",
		},
		["<leader>dC"] = {
			function()
				require("dap").run_to_cursor()
			end,
			"Run to cursor",
		},
		["<leader>dd"] = {
			function()
				require("dap").disconnect()
			end,
			"disconnect from the session",
		},
		["<leader>dss"] = {
			function()
				require("dap").session()
			end,
			"Get session",
		},
		["<leader>dpt"] = {
			function()
				require("dap").pause.toggle()
			end,
			"Pause",
		},
		["<leader>drt"] = {
			function()
				require("dap").repl.toggle()
			end,
			"toggle Repl",
		},
		["<leader><leader>s"] = {
			function()
				require("luasnip.loaders.from_lua").load({ paths = vim.g.lua_snippets_path })
			end,
			"reload LuaSnip snippets",
		},
		-- ["<leader>mp"] = { "<cmd> MarkdownPreview<CR>", "Open Preview" },
		-- ["<leader>mc"] = { "<cmd> MarkdownPreviewStop<CR>", "Close Preview" },
		-- ["<leader>fp"] = { "<cmd> ProjectMgr<CR>", "Open Projects" },
		["<leader>lg"] = { "<cmd> LazyGit<CR>", "Load Lazy Git" },
		["<leader>tqf"] = { "<cmd> TodoQuickFix<CR>", "Call TodoQuickFix" },
		["<leader>tll"] = { "<cmd> TodoLocList<CR>" },
		["<leader>tte"] = { "<cmd> TodoTelescope<CR>" },
		-- ["<leader>op"] = {
		-- 	function()
		-- 		local peek = require("peek")
		-- 		if peek.is_open() then
		-- 			peek.close()
		-- 		else
		-- 			peek.open()
		-- 		end
		-- 	end,
		-- 	desc = "Peek (Markdown Preview)",
		-- },
		["-"] = {
			"<cmd>Oil<CR>",
			"openOil",
		},
	},
}
for mode, maps in pairs(mappings) do
	for key, val in pairs(maps) do
		map(mode, key, val[1], { desc = val[2] })
	end
end
map("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
	desc = "Toggle Spectre",
})
map("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word",
})
map("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word",
})
map("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
	desc = "Search on current file",
})
--TODO: make the ui for spectre not trash
map("n", "]c", function()
	if vim.wo.diff then
		return "]c"
	end
	vim.schedule(function()
		require("gitsigns").next_hunk()
	end)
	return "<Ignore>"
end, { expr = true, desc = "Next git hunk" })

map("n", "[c", function()
	if vim.wo.diff then
		return "[c"
	end
	vim.schedule(function()
		require("gitsigns").prev_hunk()
	end)
	return "<Ignore>"
end, { expr = true, desc = "Previous git hunk" })
map("n", "<leader>rn", ":IncRename ", { desc = "rename the current thing" })
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, desc = "get lsp info" })
wk.add({
	{ "<leader>n", group = "Neo" },
	{ "<leader>ng", "<cmd>Neogit<CR>", desc = "Open neogit", mode = "n" },
	{ "<leader>d", group = "debug" },
})
map({ "n", "v" }, "<leader>y", [["+y]], { silent = true, desc = "Copy to System Clipboard" })
map("n", "<leader>Y", [["+Y]], { silent = true, desc = "Copy to system clipboard" })

-- Delete to void register
map({ "n", "v" }, "<leader>D", [["_d]], { silent = true, desc = "Delete to void register" })
