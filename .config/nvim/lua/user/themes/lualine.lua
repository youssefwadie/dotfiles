local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
		return
end

lualine.setup {
		options = {
				theme = 'gruvbox',
				section_separators = { left = '', right = '' },
				component_separators = { left = '', right = '' }
		}
}
