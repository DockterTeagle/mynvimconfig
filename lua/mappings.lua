-- add yours here
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

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- tabufline
map("n", "<leader>b", "<cmd>new<CR>", { desc = "buffer new" })

map("n", "<tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "previous buffer" })
map("n", "<S-tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "previous buffer" })

map("n", "<leader>x", "<CMD>bd<CR>", { desc = "buffer close" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })

map("n", "<leader>ff", "<cmd>Telescope frecency<cr>", { desc = "telescope find files" })
map(
	"n",
	"<leader>fa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "telescope find all files" }
)

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
-- map("n", "<leader>h", function()
-- 	require("nvchad.term").new({ pos = "sp" })
-- end, { desc = "terminal new horizontal term" })

-- map("n", "<leader>v", function()
-- 	require("nvchad.term").new({ pos = "vsp" })
-- end, { desc = "terminal new vertical term" })

-- toggleable
-- map({ "n", "t" }, "<A-v>", function()
-- 	require("nvchad.term").toggle({ pos = "vsp", id = "vtoggleTerm" })
-- end, { desc = "terminal toggleable vertical term" })

-- map({ "n", "t" }, "<A-h>", function()
-- 	require("nvchad.term").toggle({ pos = "sp", id = "htoggleTerm" })
-- end, { desc = "terminal toggleable horizontal term" })

-- map({ "n", "t" }, "<A-i>", function()
-- 	require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
-- end, { desc = "terminal toggle floating term" })

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
		require("gitsigns").nav_hunk("first")
	end)
	return "<Ignore>"
end, { expr = true, desc = "Next git hunk" })

map("n", "[c", function()
	if vim.wo.diff then
		return "[c"
	end
	vim.schedule(function()
		require("gitsigns").nav_hunk("prev")
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

map({ "n" }, "<leader>dlb", function()
	require("telescope").extensions.dap.list_breakpoints({})
end, { silent = true, desc = "List asll breakpoints" })
