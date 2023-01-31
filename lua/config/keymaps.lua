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

-- wk.register({ ["<leader>l"] = { name = "+Lsp" } })

-- lazy
map("n", "<leader>L", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- map("n", "<leader>l", "<cmd>w<cr><esc>", { desc = "kabom" })

--
-- PERF: hop can be used in telescope / file explorer to quicly navigate. use j and k
-- for hop.vim in visual mode
-- easy-motion like
-- Hop

wk.register({ ["<leader>h"] = { name = "+Hop" } })

-- map("n", "<leader>h", "", { desc = "Hop" })

map("v", "<leader>hw", "<cmd>HopWordAC<cr>", { desc = "Hop words AC" })
map("v", "<leader>hb", "<cmd>HopWordBC<cr>", { desc = "Hop words BC" })
map("v", "<leader>hj", "<cmd>HopLineAC<cr>", { desc = "Hop lines AC" })
map("v", "<leader>hk", "<cmd>HopLineBC<cr>", { desc = "Hop lines BC" })

map("n", "<leader>hw", "<cmd>HopWordAC<cr>", { desc = "Hop words AC" })
map("n", "<leader>hb", "<cmd>HopWordBC<cr>", { desc = "Hop words BC" })
map("n", "<leader>hj", "<cmd>HopLineAC<cr>", { desc = "Hop lines AC" })
map("n", "<leader>hk", "<cmd>HopLineBC<cr>", { desc = "Hop lines BC" })

-- anywhere
map("v", "<leader>ha", "<cmd>HopAnywhereAC<cr>", { desc = "Hop anywhere AC" })
map("v", "<leader>hA", "<cmd>HopAnywhereBC<cr>", { desc = "Hop anywhere AC" })

map("n", "<leader>ha", "<cmd>HopAnywhereAC<cr>", { desc = "Hop anywhere AC" })
map("n", "<leader>hA", "<cmd>HopAnywhereBC<cr>", { desc = "Hop anywhere AC" })

-- anywhere currentline
map("v", "<leader>hc", "<cmd>HopAnywhereCurrentLine<cr>", { desc = "Hop anywhere currentline" })
map("n", "<leader>hc", "<cmd>HopAnywhereCurrentLine<cr>", { desc = "Hop anywhere currentline" })

-- sneak like
map("v", "<leader>hs", "<cmd>HopChar2AC<cr>", { desc = "Hop 2 character AC" })
map("v", "<leader>hS", "<cmd>HopChar2BC<cr>", { desc = "Hop 2 character BC" })

map("n", "<leader>hs", "<cmd>HopChar2AC<cr>", { desc = "Hop 2 character AC" })
map("n", "<leader>hS", "<cmd>HopChar2BC<cr>", { desc = "Hop 2 character BC" })

--
