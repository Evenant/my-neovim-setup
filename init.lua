require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

-- directories local to the current directory
vim.opt.rtp:append(".cache")
vim.opt.rtp:append(".local")

-- Use tabs instead of spaces
vim.opt.expandtab = false

-- Tab size
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- disable the recommended options for python
vim.cmd("let g:python_recommended_style = 0")


