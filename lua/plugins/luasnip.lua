return {
  "L3MON4D3/LuaSnip",
	version = "v2.*",
	dependencies = { "saadparwaiz1/cmp_luasnip" },
	build = "make install_jsregexp",
	config = function()
		local luasnip = require("luasnip")

		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/luasnippets" })

		vim.keymap.set({ "i", "s" }, "<Tab>", function()
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				return "<Tab>"
			end
		end, { expr = true })

		vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				return "<S-Tab>"
			end
		end, { expr = true })
	end,
}
