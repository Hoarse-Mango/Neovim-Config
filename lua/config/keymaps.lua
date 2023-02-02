-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- funct to create prefix names
local wk = require("which-key")

-- vim go
-- lvim.builtin.which_key.mappings["g"] = {
--   name = "Golang (vim-go)",
--   s = { "<cmd>GoFillStruct<cr>", "Go Fill Struct" },
--   t = { "<cmd>GoAddTags<cr>", "Go Add Tags" },
--   T = { "<cmd>GoTest<cr>", "Go Test Function" },
--   e = { "<cmd>GoIfErr<cr>", "Go Auto Generate 'if err" }
-- }

-- lazy
map("n", "<leader>L", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- harpoon
wk.register({ ["<leader>h"] = { name = "+Harpoon" } })
map("n", "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Mark for Harpoon" })
map("n", "<leader>ht", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Toggle Quick Menu" })
map("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Go to next" })
map("n", "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev<cr>", { desc = "Go to previous" }) -- FIX: not working?

--
-- p = { "<cmd>lua require('harpoon.ui').nav_prev<cr>", "Go to previous" },
--   a = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Go to file 1" },
--   b = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Go to file 2" },
--   c = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Go to file 3" },
--   d = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Go to file 4" },
