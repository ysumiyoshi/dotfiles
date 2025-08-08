vim.cmd([[let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim/bin/python']])
vim.cmd([[let g:python_host_prog = $PYENV_ROOT.'/versions/neovim2/bin/python']])

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.g.mapleader = " " -- キーマップリーダー

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup("plugins")

require('basic')
require('backup')
require('indent')
require('color')
require('editor')
require('diff')
require('buffer')
require('statusline')
require('search')
-- こっからした未確認ちゃんと棚卸する
require('window')
require('mapping')
require('extension')

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "typescript",
--   callback = function()
--     local git_root = vim.fn.system("git rev-parse --show-toplevel"):gsub("\n", "")
--     if vim.v.shell_error == 0 and git_root ~= "" then
--       vim.b.quickrun_config = {
--         exec = "ts-node --project " .. git_root .. "/tsconfig.json %s"
--       }
--     end
--   end
-- })
--
-- vim.api.nvim_create_autocmd("FileType", {
--   group = tsGroup,
--   pattern = { "typescript", "javascript" },
--   callback = function()
--     local git_root = vim.fn.system("git rev-parse --show-toplevel"):gsub("\n", "")
--     if vim.v.shell_error == 0 and git_root ~= "" then
--       vim.b.quickrun_config = {
--         exec = "ts-node --project " .. git_root .. "/tsconfig.json %s"
--       }
--     else
--       vim.notify("Git root not found for JS/TS file", vim.log.levels.WARN)
--     end
--   end
-- })
