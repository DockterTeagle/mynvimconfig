local wk = require("which-key")
local map = vim.keymap.set
-- map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- tabufline
map("n", "<leader>b", "<cmd>new<CR>", { desc = "buffer new" })

map("n", "<tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "previous buffer" })
map("n", "<S-tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "previous buffer" })

map("n", "<leader>x", function()
	require("snacks").bufdelete.delete()
end, { desc = "buffer close" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })

map("n", "<leader>ff", "<cmd>Telescope find_files <cr>", { desc = "telescope find files" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
	vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "whichkey query lookup" })
local mappings = {
	n = {
		["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
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
				require("dap").pause()
			end,
			"Pause",
		},
		["<leader>drt"] = {
			function()
				require("dap").repl.toggle()
			end,
			"toggle Repl",
		},
		-- ["<leader>mp"] = { "<cmd> MarkdownPreview<CR>", "Open Preview" },
		-- ["<leader>mc"] = { "<cmd> MarkdownPreviewStop<CR>", "Close Preview" },
		-- ["<leader>fp"] = { "<cmd> ProjectMgr<CR>", "Open Projects" },
		["<leader>tTt"] = { "<cmd>Trouble todo toggle<CR>", desc = "Todo(Trouble)" },
		["<leader>Tll"] = { "<cmd> TodoLocList<CR>" },
		["<leader>Tte"] = { "<cmd> TodoTelescope<CR>" },

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

map("n", "<leader>rn", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true, desc = "rename the current thing" })
wk.add({
	{ "<leader>n", group = "Neo" },
	{ "<leader>ng", "<cmd>Neogit<CR>", desc = "Open neogit", mode = "n" },
	{ "<leader>d", group = "debug" },
	{ "<leader>gh", group = "(g)it (h)unk" },
	{ "<leader>nG", group = "(n)eo(G)en" },
	{ "<leader>t", group = "trouble" },
	{ "<leader>T", group = "TODO" },
})
map({ "n", "v" }, "<leader>y", [["+y]], { silent = true, desc = "Copy to System Clipboard" })
map("n", "<leader>Y", [["+Y]], { silent = true, desc = "Copy to system clipboard" })

-- Delete to void register
map({ "n", "v" }, "<leader>D", [["_d]], { silent = true, desc = "Delete to void register" })

map({ "n" }, "<leader>dlb", function()
	require("telescope").extensions.dap.list_breakpoints({})
end, { silent = true, desc = "List asll breakpoints" })
map("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "next Todo Comment" })
map("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous Todo Comment" })
vim.keymap.set("n", "zR", function()
	require("ufo").openAllFolds()
end, { desc = "open All Folds(ufo)" })
map("n", "zM", function()
	require("ufo").closeAllFolds()
end, { desc = "close all Folds(UFO)" })
vim.keymap.set("n", "zr", function()
	require("ufo").openFoldsExceptKinds()
end, { desc = "open Folds Except Kinds" })
vim.keymap.set("n", "zm", function()
	require("ufo").closeFoldsWith()
end, { desc = "closed all folds with simlair properties " })
vim.keymap.set("n", "K", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		vim.lsp.buf.hover()
	end
end, { desc = "super key for LSP and fold" })
vim.keymap.set("n", "<leader>nGf", function()
	require("neogen").generate()
end, { noremap = true, silent = true, desc = "(N)eo(G)en(f)unction" })
vim.keymap.set("n", "<leader>nGc", function()
	require("neogen").generate({
		type = "class",
	})
end, { noremap = true, silent = true, desc = "(n)eo(G)en (c)lass" })
vim.keymap.set("n", "<leader>nGF", function()
	require("neogen").generate({ type = "file" })
end, { noremap = true, silent = true, desc = "(n)eo(G)en(F)ile" })
vim.keymap.set("n", "<leader>tqt", "<cmd>Trouble qflist toggle<CR>", { desc = "Toggle qflist with trouble" })
vim.keymap.set(
	"n",
	"<leader>tdt",
	"<CMD>Trouble diagnostics toggle<CR>",
	{ desc = "toggle diagnostics through trouble" }
)
map("n", "<leader>Re", function()
	require("refactoring").refactor("Extract Function")
end)
map("n", "<leader>tcs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
map(
	"n",
	"<leader>tcl",
	"<CMD>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP Definitions(Trouble)" }
)
vim.keymap.del("n", "gra")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grn")
vim.keymap.del("n", "grr")
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
