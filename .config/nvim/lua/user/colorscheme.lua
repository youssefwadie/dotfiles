local colorscheme = "gruvbox"
vim.opt.background = "dark"
-- vim.g.tokyonight_style = "night"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

