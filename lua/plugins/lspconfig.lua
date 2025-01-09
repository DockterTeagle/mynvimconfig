return {
	{
		"neovim/nvim-lspconfig",
		-- ft = {},
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		dependencies = {
			"tamago324/nlsp-settings.nvim",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		config = function(_, opts)
			require("configs.lsp.lspconfig")
			-- local servers = opts.servers
			-- local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
			-- local has_blink, blink = pcall(require, "blink.cmp")
			-- local capabilities = vim.tbl_deep_extend(
			-- 	"force",
			-- 	{},
			-- 	vim.lsp.protocol.make_client_capabilities() and require("blink.cmp").get_lsp_capabilities()
			-- )
			-- local function setup(server)
			-- 	local server_opts = vim.tbl_deep_extend("force", {
			-- 		capabilities = vim.deepcopy(capabilities),
			-- 	}, servers[server] or {})
			-- 	if server_opts.enabled == false then
			-- 		return
			-- 	end
			--
			-- 	if opts.setup[server] then
			-- 		if opts.setup[server](server, server_opts) then
			-- 			return
			-- 		end
			-- 	elseif opts.setup["*"] then
			-- 		if opts.setup["*"](server, server_opts) then
			-- 			return
			-- 		end
			-- 	end
			-- 	require("lspconfig")[server].setup(server_opts)
			-- end
		end,
	},
}
