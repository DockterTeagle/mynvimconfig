local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin
local tex_utils = require("snippets.LuaSnip.helper-functions").tex_utils
--    `0  ->  '\emptyset'                    vimtex#imaps#wrap_math
--  `2  ->  '\sqrt'                        vimtex#imaps#wrap_math
--  `6  ->  '\partial'                     vimtex#imaps#wrap_math
--  `8  ->  '\infty'                       vimtex#imaps#wrap_math
--  `=  ->  '\equiv'                       vimtex#imaps#wrap_math
--  `\  ->  '\setminus'                    vimtex#imaps#wrap_math
--  `.  ->  '\cdot'                        vimtex#imaps#wrap_math
--  `*  ->  '\times'                       vimtex#imaps#wrap_math
--  `<  ->  '\langle'                      vimtex#imaps#wrap_math
--  `>  ->  '\rangle'                      vimtex#imaps#wrap_math
--  `H  ->  '\hbar'                        vimtex#imaps#wrap_math
--  `+  ->  '\dagger'                      vimtex#imaps#wrap_math
--  `[  ->  '\subseteq'                    vimtex#imaps#wrap_math
--  `]  ->  '\supseteq'                    vimtex#imaps#wrap_math
--  `(  ->  '\subset'                      vimtex#imaps#wrap_math
--  `)  ->  '\supset'                      vimtex#imaps#wrap_math
--  `A  ->  '\forall'                      vimtex#imaps#wrap_math
--  `B  ->  '\boldsymbol'                  vimtex#imaps#wrap_math
--  `E  ->  '\exists'                      vimtex#imaps#wrap_math
--  `N  ->  '\nabla'                       vimtex#imaps#wrap_math
-- `jj  ->  '\downarrow'                   vimtex#imaps#wrap_math
-- `jJ  ->  '\Downarrow'                   vimtex#imaps#wrap_math
-- `jk  ->  '\uparrow'                     vimtex#imaps#wrap_math
-- `jK  ->  '\Uparrow'                     vimtex#imaps#wrap_math
-- `jh  ->  '\leftarrow'                   vimtex#imaps#wrap_math
-- `jH  ->  '\Leftarrow'                   vimtex#imaps#wrap_math
-- `jl  ->  '\rightarrow'                  vimtex#imaps#wrap_math
-- `jL  ->  '\Rightarrow'                  vimtex#imaps#wrap_math
--  `a  ->  '\alpha'                       vimtex#imaps#wrap_math
--  `b  ->  '\beta'                        vimtex#imaps#wrap_math
--  `c  ->  '\chi'                         vimtex#imaps#wrap_math
--  `d  ->  '\delta'                       vimtex#imaps#wrap_math
--  `e  ->  '\epsilon'                     vimtex#imaps#wrap_math
--  `f  ->  '\phi'                         vimtex#imaps#wrap_math
--  `g  ->  '\gamma'                       vimtex#imaps#wrap_math
--  `h  ->  '\eta'                         vimtex#imaps#wrap_math
--  `i  ->  '\iota'                        vimtex#imaps#wrap_math
--  `k  ->  '\kappa'                       vimtex#imaps#wrap_math
--  `l  ->  '\lambda'                      vimtex#imaps#wrap_math
--  `m  ->  '\mu'                          vimtex#imaps#wrap_math
--  `n  ->  '\nu'                          vimtex#imaps#wrap_math
--  `p  ->  '\pi'                          vimtex#imaps#wrap_math
--  `q  ->  '\theta'                       vimtex#imaps#wrap_math
--  `r  ->  '\rho'                         vimtex#imaps#wrap_math
--  `s  ->  '\sigma'                       vimtex#imaps#wrap_math
--  `t  ->  '\tau'                         vimtex#imaps#wrap_math
--  `y  ->  '\psi'                         vimtex#imaps#wrap_math
--  `u  ->  '\upsilon'                     vimtex#imaps#wrap_math
--  `w  ->  '\omega'                       vimtex#imaps#wrap_math
--  `z  ->  '\zeta'                        vimtex#imaps#wrap_math
--  `x  ->  '\xi'                          vimtex#imaps#wrap_math
--  `D  ->  '\Delta'                       vimtex#imaps#wrap_math
--  `F  ->  '\Phi'                         vimtex#imaps#wrap_math
--  `G  ->  '\Gamma'                       vimtex#imaps#wrap_math
--  `L  ->  '\Lambda'                      vimtex#imaps#wrap_math
--  `P  ->  '\Pi'                          vimtex#imaps#wrap_math
--  `Q  ->  '\Theta'                       vimtex#imaps#wrap_math
--  `S  ->  '\Sigma'                       vimtex#imaps#wrap_math
--  `U  ->  '\Upsilon'                     vimtex#imaps#wrap_math
--  `W  ->  '\Omega'                       vimtex#imaps#wrap_math
--  `X  ->  '\Xi'                          vimtex#imaps#wrap_math
--  `Y  ->  '\Psi'                         vimtex#imaps#wrap_math
-- `ve  ->  '\varepsilon'                  vimtex#imaps#wrap_math
-- `vf  ->  '\varphi'                      vimtex#imaps#wrap_math
-- `vk  ->  '\varkappa'                    vimtex#imaps#wrap_math
-- `vp  ->  '\varpi'                       vimtex#imaps#wrap_math
-- `vq  ->  '\vartheta'                    vimtex#imaps#wrap_math
-- `vr  ->  '\varrho'                      vimtex#imaps#wrap_math
return {
	s({ trig = ";a", snippetType = "autosnippet" }, {
		t("\\alpha"),
	}, { condition = tex_utils.in_mathzone }),
	s({ trig = ";b", snippetType = "autosnippet" }, {
		t("\\beta"),
	}, { condition = tex_utils.in_mathzone }),
	s({ trig = ";g", snippetType = "autosnippet" }, {
		t("\\gamma"),
	}, { condition = tex_utils.in_mathzone }),
	s({ trig = ";m", snippetType = "autosnippet" }, {
		t("\\mu"),
	}, { condition = tex_utils.in_mathzone }),
	s(
		{ trig = "ff", snippetType = "autosnippet", dscr = "fraction" },
		fmta("\\frac{<>}{<>}", {
			i(1),
			i(2),
		}),
		{ condition = tex_utils.in_mathzone } -- `condition` option passed in the snippet `opts` table
	),
}
