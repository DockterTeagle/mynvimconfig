# My NeoVim configuration
Based on `NvChad`


times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.016  000.016: --- NVIM STARTING ---
000.894  000.878: event init
001.647  000.753: early init
001.879  000.232: locale set
001.985  000.106: init first window
002.461  000.477: inits 1
002.481  000.019: window checked
002.484  000.004: parsing arguments
003.348  000.057  000.057: require('vim.shared')
003.485  000.057  000.057: require('vim.inspect')
003.562  000.058  000.058: require('vim._options')
003.565  000.211  000.096: require('vim._editor')
003.568  000.355  000.088: require('vim._init_packages')
003.571  000.732: init lua interpreter
003.941  000.370: expanding arguments
003.972  000.031: inits 2
004.433  000.461: init highlight
004.435  000.002: waiting for UI
005.142  000.707: done waiting for UI
005.196  000.054: clear screen
005.229  000.012  000.012: require('vim.keymap')
005.457  000.248: init default mappings & autocommands
005.932  000.067  000.067: sourcing /usr/share/nvim/runtime/ftplugin.vim
005.992  000.033  000.033: sourcing /usr/share/nvim/runtime/indent.vim
006.379  000.135  000.135: require('core.utils')
006.562  000.090  000.090: require('plugins.configs.lazy_nvim')
007.035  000.470  000.470: require('core.mappings')
007.039  000.657  000.097: require('core.default_config')
007.124  000.057  000.057: require('custom.mappings')
008.503  000.102  000.102: require('vim.fs')
009.111  003.019  002.067: require('core')
011.059  000.186  000.186: require('lazy')
011.101  000.017  000.017: require('ffi')
011.395  000.235  000.235: require('vim.uri')
011.415  000.309  000.074: require('vim.loader')
011.660  000.220  000.220: require('lazy.stats')
011.887  000.196  000.196: require('lazy.core.util')
012.210  000.317  000.317: require('lazy.core.config')
012.747  000.308  000.308: require('lazy.core.handler')
013.367  000.609  000.609: require('lazy.core.plugin')
013.388  001.171  000.255: require('lazy.core.loader')
014.561  000.056  000.056: require('custom.configs.overrides')
015.430  000.179  000.179: require('cmp.utils.debug')
015.910  000.194  000.194: require('cmp.utils.char')
015.922  000.485  000.291: require('cmp.utils.str')
016.495  000.124  000.124: require('cmp.utils.misc')
016.606  000.105  000.105: require('cmp.utils.buffer')
016.872  000.263  000.263: require('cmp.utils.api')
016.884  000.750  000.257: require('cmp.utils.keymap')
016.891  000.967  000.217: require('cmp.utils.feedkeys')
017.816  000.108  000.108: require('cmp.types.cmp')
018.157  000.334  000.334: require('cmp.types.lsp')
018.341  000.180  000.180: require('cmp.types.vim')
018.345  000.781  000.160: require('cmp.types')
018.352  000.968  000.186: require('cmp.config.mapping')
018.563  000.209  000.209: require('cmp.utils.cache')
019.141  000.329  000.329: require('cmp.config.compare')
019.147  000.580  000.251: require('cmp.config.default')
019.163  001.958  000.201: require('cmp.config')
019.186  002.293  000.335: require('cmp.utils.async')
019.453  000.142  000.142: require('cmp.utils.pattern')
019.458  000.270  000.128: require('cmp.context')
019.795  000.100  000.100: require('cmp.matcher')
019.802  000.220  000.120: require('cmp.entry')
019.807  000.348  000.127: require('cmp.source')
020.063  000.179  000.179: require('cmp.utils.event')
020.509  000.120  000.120: require('cmp.utils.options')
020.515  000.235  000.115: require('cmp.utils.window')
020.517  000.450  000.215: require('cmp.view.docs_view')
020.814  000.134  000.134: require('cmp.utils.autocmd')
020.823  000.305  000.171: require('cmp.view.custom_entries_view')
020.934  000.109  000.109: require('cmp.view.wildmenu_entries_view')
021.024  000.088  000.088: require('cmp.view.native_entries_view')
021.273  000.247  000.247: require('cmp.view.ghost_text_view')
021.285  001.476  000.099: require('cmp.view')
021.477  006.394  000.377: require('cmp.core')
021.768  000.155  000.155: require('cmp.config.sources')
021.935  000.163  000.163: require('cmp.config.window')
021.999  007.431  000.719: require('cmp')
022.018  007.607  000.120: require('custom.plugins')
022.761  000.107  000.107: require('lazy.core.handler.event')
022.769  000.191  000.084: require('lazy.core.handler.ft')
022.949  000.174  000.174: require('lazy.core.handler.cmd')
023.247  000.293  000.293: require('lazy.core.handler.keys')
023.831  000.063  000.063: sourcing /home/christopher/.local/share/nvim/lazy/vimtex/ftdetect/cls.vim
023.894  000.027  000.027: sourcing /home/christopher/.local/share/nvim/lazy/vimtex/ftdetect/tex.vim
023.943  000.018  000.018: sourcing /home/christopher/.local/share/nvim/lazy/vimtex/ftdetect/tikz.vim
024.562  000.037  000.037: sourcing /home/christopher/.local/share/nvim/lazy/rust.vim/ftdetect/rust.vim
025.879  000.203  000.203: sourcing /usr/share/nvim/runtime/filetype.lua
038.057  000.510  000.510: require('nvchad.tabufline.lazyload')
038.092  001.453  000.943: require('nvchad')
038.095  001.702  000.249: sourcing /home/christopher/.local/share/nvim/lazy/ui/plugin/init.lua
038.755  000.105  000.105: sourcing /home/christopher/.local/share/nvim/lazy/nvim-web-devicons/plugin/nvim-web-devicons.vim
039.047  000.243  000.243: require('nvchad.icons.devicons')
039.561  000.008  000.008: require('vim.F')
039.974  000.402  000.402: require('nvim-web-devicons.icons-default')
040.092  000.895  000.485: require('nvim-web-devicons')
042.451  000.113  000.113: sourcing /home/christopher/.local/share/nvim/lazy/trouble.nvim/plugin/trouble.vim
043.165  000.377  000.377: require('pretty-fold')
043.385  000.053  000.053: sourcing /home/christopher/.local/share/nvim/lazy/vimtex/plugin/vimtex.vim
043.995  000.340  000.340: sourcing /home/christopher/.local/share/nvim/lazy/vim-gutentags/plugin/gutentags.vim
044.424  000.110  000.110: sourcing /home/christopher/.local/share/nvim/lazy/projectmgr.nvim/plugin/projectmgr.vim
045.849  000.146  000.146: sourcing /home/christopher/.local/share/nvim/lazy/nvim-dap/plugin/dap.lua
046.483  000.341  000.341: require('dap.utils')
046.516  001.325  000.839: require('dap')
046.526  001.797  000.472: require('nvim-dap-virtual-text')
046.903  000.233  000.233: sourcing /home/christopher/.local/share/nvim/lazy/vim-tmux-navigator/plugin/tmux_navigator.vim
047.081  000.064  000.064: sourcing /usr/share/nvim/runtime/plugin/editorconfig.lua
047.218  000.114  000.114: sourcing /usr/share/nvim/runtime/plugin/man.lua
047.446  000.203  000.203: sourcing /usr/share/nvim/runtime/plugin/matchparen.vim
047.526  000.060  000.060: sourcing /usr/share/nvim/runtime/plugin/nvim.lua
047.625  000.077  000.077: sourcing /usr/share/nvim/runtime/plugin/shada.vim
047.689  000.024  000.024: sourcing /usr/share/nvim/runtime/plugin/spellfile.vim
047.897  037.710  020.171: require('plugins')
047.901  041.854  001.126: sourcing /home/christopher/.config/nvim/init.lua
047.908  000.498: sourcing vimrc file(s)
048.271  000.054  000.054: sourcing /usr/share/nvim/runtime/filetype.lua
048.542  000.100  000.100: sourcing /usr/share/nvim/runtime/syntax/synload.vim
048.653  000.313  000.213: sourcing /usr/share/nvim/runtime/syntax/syntax.vim
048.669  000.394: inits 3
052.041  003.372: reading ShaDa
053.164  000.145  000.145: require('trouble.config')
053.173  000.286  000.141: require('trouble.util')
053.397  000.221  000.221: require('trouble.providers.qf')
053.489  000.089  000.089: require('trouble.providers.telescope')
054.765  000.317  000.317: require('vim.lsp.log')
055.452  000.682  000.682: require('vim.lsp.protocol')
055.801  000.168  000.168: require('vim.lsp._snippet_grammar')
055.882  000.076  000.076: require('vim.highlight')
055.898  000.441  000.197: require('vim.lsp.util')
055.912  001.841  000.401: require('vim.lsp.handlers')
056.017  000.104  000.104: require('vim.lsp.rpc')
056.061  000.040  000.040: require('vim.lsp.sync')
056.145  000.082  000.082: require('vim.lsp.semantic_tokens')
056.238  000.090  000.090: require('vim.lsp.buf')
056.336  000.096  000.096: require('vim.lsp.diagnostic')
056.422  000.083  000.083: require('vim.lsp.codelens')
056.460  002.888  000.552: require('vim.lsp')
056.463  002.971  000.083: require('trouble.providers.lsp')
056.510  000.045  000.045: require('trouble.providers.diagnostic')
056.546  003.779  000.167: require('trouble.providers')
056.605  000.057  000.057: require('trouble.text')
056.645  000.037  000.037: require('trouble.folds')
056.648  004.099  000.226: require('trouble.renderer')
056.658  004.253  000.154: require('trouble.view')
056.716  000.057  000.057: require('trouble.colors')
056.882  000.131  000.131: require('vim.diagnostic')
056.908  004.634  000.193: require('trouble')
057.033  000.358: opening buffers
057.051  000.018: BufEnter autocommands
057.054  000.002: editing files in windows
057.488  000.336  000.336: sourcing /home/christopher/.local/share/nvim/lazy/vim-gutentags/autoload/gutentags.vim
057.713  000.059  000.059: require('projectmgr.helpers')
057.722  000.129  000.070: require('projectmgr.file_adapter')
057.783  000.059  000.059: require('projectmgr.window')
057.845  000.060  000.060: require('projectmgr.manage')
059.313  000.105  000.105: require('nvim-treesitter.utils')
060.318  000.132  000.132: require('vim.treesitter.language')
060.378  000.052  000.052: require('vim.func')
060.457  000.075  000.075: require('vim.func._memoize')
060.477  000.446  000.187: require('vim.treesitter.query')
060.576  000.098  000.098: require('vim.treesitter._range')
060.593  000.772  000.228: require('vim.treesitter.languagetree')
060.601  001.000  000.229: require('vim.treesitter')
061.295  001.974  000.973: require('nvim-treesitter.parsers')
061.844  000.177  000.177: require('nvim-treesitter.compat')
062.219  000.258  000.258: require('nvim-treesitter.ts_utils')
062.230  000.382  000.124: require('nvim-treesitter.tsrange')
062.302  000.070  000.070: require('nvim-treesitter.caching')
062.314  000.830  000.201: require('nvim-treesitter.query')
062.343  000.962  000.132: require('nvim-treesitter.configs')
062.349  001.050  000.088: require('nvim-treesitter.info')
062.460  000.110  000.110: require('nvim-treesitter.shell_command_selectors')
062.484  003.453  000.214: require('nvim-treesitter.install')
062.560  000.074  000.074: require('nvim-treesitter.statusline')
062.601  000.040  000.040: require('nvim-treesitter.query_predicates')
062.603  004.088  000.520: require('nvim-treesitter')
062.927  004.472  000.385: sourcing /home/christopher/.local/share/nvim/lazy/nvim-treesitter/plugin/nvim-treesitter.lua
063.041  000.083  000.083: require('plugins.configs.treesitter')
065.071  000.088  000.088: require('nvim-treesitter.highlight')
065.202  000.070  000.070: require('nvim-treesitter.indent')
065.557  000.253  000.253: sourcing /home/christopher/.local/share/nvim/lazy/telescope.nvim/plugin/telescope.lua
066.524  000.058  000.058: sourcing /home/christopher/.local/share/nvim/lazy/plenary.nvim/plugin/plenary.vim
067.129  000.082  000.082: require('plenary.bit')
067.201  000.067  000.067: require('plenary.functional')
067.249  000.543  000.393: require('plenary.path')
067.296  001.519  000.918: require('plenary.log')
067.313  001.573  000.054: require('telescope.log')
067.568  000.137  000.137: require('plenary.job')
067.670  000.099  000.099: require('plenary.strings')
067.743  000.070  000.070: require('telescope.state')
067.750  000.435  000.129: require('telescope.utils')
067.756  002.094  000.085: require('telescope.sorters')
067.908  000.049  000.049: require('telescope.previewers.previewer')
068.303  000.040  000.040: require('telescope.deprecated')
069.777  001.667  001.628: require('telescope.config')
069.837  000.055  000.055: require('telescope.from_entry')
069.919  002.008  000.286: require('telescope.previewers.term_previewer')
070.356  000.200  000.200: require('telescope.previewers.utils')
070.588  000.227  000.227: require('plenary.scandir')
070.718  000.796  000.369: require('telescope.previewers.buffer_previewer')
070.727  002.968  000.115: require('telescope.previewers')
071.143  000.072  000.072: require('plenary.window.border')
071.198  000.052  000.052: require('plenary.window')
071.309  000.109  000.109: require('plenary.popup.utils')
071.313  000.363  000.130: require('plenary.popup')
071.424  000.110  000.110: require('telescope.pickers.scroller')
071.509  000.059  000.059: require('telescope.actions.state')
071.736  000.226  000.226: require('telescope.actions.utils')
071.950  000.103  000.103: require('telescope.actions.mt')
071.980  000.241  000.138: require('telescope.actions.set')
072.182  000.112  000.112: require('telescope.config.resolve')
072.187  000.205  000.094: require('telescope.pickers.entry_display')
072.572  001.842  000.638: require('telescope.actions')
072.576  006.991  000.087: require('plugins.configs.telescope')
072.794  000.087  000.087: require('telescope._extensions')
072.798  000.164  000.076: require('telescope')
074.777  000.054  000.054: require('plenary.tbl')
074.783  000.149  000.095: require('plenary.vararg.rotate')
074.784  000.252  000.103: require('plenary.vararg')
074.878  000.092  000.092: require('plenary.errors')
074.884  000.482  000.138: require('plenary.async.async')
075.127  000.083  000.083: require('plenary.async.structs')
075.136  000.144  000.061: require('plenary.async.control')
075.142  000.203  000.059: require('plenary.async.util')
075.145  000.260  000.057: require('plenary.async.tests')
075.147  000.925  000.184: require('plenary.async')
075.245  000.095  000.095: require('telescope.debounce')
075.372  000.124  000.124: require('telescope.mappings')
075.476  000.101  000.101: require('telescope.pickers.highlights')
075.546  000.067  000.067: require('telescope.pickers.window')
075.597  000.049  000.049: require('telescope.pickers.layout')
075.751  000.108  000.108: require('telescope.algos.linked_list')
075.759  000.161  000.053: require('telescope.entry_manager')
075.854  000.094  000.094: require('telescope.pickers.multi')
075.883  001.952  000.335: require('telescope.pickers')
077.439  001.453  001.453: require('telescope.make_entry')
077.996  000.551  000.551: require('telescope.finders.async_static_finder')
078.578  000.226  000.226: require('plenary.class')
078.601  000.452  000.226: require('telescope._')
078.605  000.605  000.153: require('telescope.finders.async_oneshot_finder')
078.712  000.105  000.105: require('telescope.finders.async_job_finder')
078.722  002.838  000.124: require('telescope.finders')
078.728  004.928  000.138: require('telescope._extensions.themes')
078.915  000.167  000.167: require('telescope._extensions.terms')
079.317  000.275  000.275: require('fzf_lib')
079.326  000.406  000.131: require('telescope._extensions.fzf')
079.342  021.479  003.857: require('telescope')
079.465  000.120  000.120: require('projectmgr.telescope_picker')
079.469  021.947  000.100: require('projectmgr')
079.632  000.295: VimEnter autocommands
079.773  000.141: UIEnter autocommands
744.199  000.676  000.676: require('vim.version')
745.049  664.896  664.220: sourcing /usr/share/nvim/runtime/autoload/provider/clipboard.vim
745.080  000.411: before starting main loop
745.932  000.671  000.671: require('nvchad.statusline.default')
746.198  000.447: first screen update
746.202  000.003: --- NVIM STARTED ---


times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.013  000.013: --- NVIM STARTING ---
000.482  000.469: event init
000.614  000.132: early init
000.886  000.272: locale set
000.974  000.088: init first window
001.630  000.656: inits 1
001.642  000.013: window checked
001.651  000.009: parsing arguments
002.644  000.065  000.065: require('vim.shared')
002.900  000.127  000.127: require('vim.inspect')
002.990  000.063  000.063: require('vim._options')
002.993  000.342  000.152: require('vim._editor')
002.996  000.507  000.100: require('vim._init_packages')
003.000  000.842: init lua interpreter
004.077  001.077: expanding arguments
004.129  000.052: inits 2
004.741  000.612: init highlight
