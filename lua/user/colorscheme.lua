local colorscheme = "darkplus"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify_once("colorscheme" .. colorscheme .. " not found!")
  return
end
