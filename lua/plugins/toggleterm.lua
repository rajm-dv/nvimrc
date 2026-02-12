return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			direction = "float",
			shade_terminals = true,
		})

		vim.keymap.set("n", "<C-B>", function()
			local filename = vim.fn.expand("%:p")
			local root = "/mnt/d/CP"
			local exe = root .. "/a.exe"
			local cmd = string.format(
				'g++ -std=c++23 -O2 -Wall "%s" -o "%s" && "%s" < "%s/input.txt" > "%s/output.txt" && type "%s/output.txt"',
				filename,
				exe,
				exe,
				root,
				root,
				root,
				root
			)

			require("toggleterm.terminal").Terminal
				:new({ cmd = cmd, close_on_exit = false, direction = "float" })
				:toggle()
		end, { noremap = true, silent = true })

		vim.keymap.set("n", "<C-o>", function()
			vim.cmd("edit D:/CP/output.txt")
		end, { noremap = true, silent = true })
	end,
}
