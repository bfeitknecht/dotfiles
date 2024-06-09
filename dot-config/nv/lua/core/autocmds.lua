local autocmd = vim.api.nvim_create_autocmd

-- dont list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})





----- WIP ------------------------------------------

-- autocmd({ "CmdlineEnter", "RecordingEnter" }, {
--   callback = function()
--     vim.opt.cmdheight = 1
--   end,
-- })
-- 
-- autocmd({ "CmdlineLeave", "RecordingLeave" }, {
--   callback = function()
--     vim.opt.cmdheight = 0
--   end,
-- })

-- -- Function to set cmdheight to 1
-- local function show_cmdline()
--   vim.opt.cmdheight = 1
-- end
-- 
-- -- Function to set cmdheight to 0
-- local function hide_cmdline()
--   vim.opt.cmdheight = 0
-- end
-- 
-- -- Create autocommands
-- vim.api.nvim_create_autocmd({"CmdlineEnter", "RecordingEnter"}, {
--   callback = show_cmdline,
-- })
-- 
-- vim.api.nvim_create_autocmd({"CmdlineLeave", "RecordingLeave"}, {
--   callback = hide_cmdline,
-- })

-- vim.opt.cmdheight = 0

