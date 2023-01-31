-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- local opt = vim.opt

-- to make vim behave like normal editor (delete, change and cut will not register new value in main paste registry)
-- local opt = { noremap = true, silent = true }

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- map("n", ",<Space>", ":nohlsearch<CR>", { silent = true })

local opt = { silent = true }

map("i", "jk", "<esc>l", opt) -- added l when escaped to normal mode as to not make the cursor move back 1 line

-- FIX: not yet working
map("n", "d", '"_d', opt)
-- map("n", "d", '"_d', opt)
-- map("n", "dd", "_dd", opt)
-- map("n", "D", "_D", opt)
-- map("n", "c", "_c", opt)
-- map("n", "C", "_C", opt)
-- map("n", "x", "_x", opt)
-- vim.keymap.set("n", "X", "_X", opt)

-- vim.keymap.set("v", "d", '"_d', nil)
-- vim.keymap.set("v", "D", "_D", nil)
-- vim.keymap.set("v", "c", "_c", nil)
-- vim.keymap.set("v", "C", "_C", nil)
-- vim.keymap.set("v", "x", "_x", nil)
-- vim.keymap.set("v", "X", "_X", nil)

-- make vim background to be transparant
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local hl_groups = {
      "Normal",
      "SignColumn",
      "NormalNC",
      "TelescopeBorder",
      "NvimTreeNormal",
      "EndOfBuffer",
      "MsgArea",
    }
    for _, name in ipairs(hl_groups) do
      vim.cmd(string.format("highlight %s ctermbg=none guibg=none", name))
    end
  end,
})
vim.opt.fillchars = "eob: "
