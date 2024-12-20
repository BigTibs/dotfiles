-- if not pcall(require, "luasnip") then
-- 	return
-- end

local ls = require("luasnip")
require("luasnip/loaders/from_vscode").lazy_load()

ls.config.set_config({
	history = false,

	updateevents = "TextChanged, TextChangedI",

	enable_autosnippets = false,
})

vim.keymap.set({ "i" }, "<C-K>", function()
	ls.expand_or_jump()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function()
	ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })

