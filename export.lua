package.loaded["lush_theme.nv-cosmos"] = nil

local theme = require('lush_theme.nv-cosmos')
local lushwright = require('shipwright.transform.lush')
local name = 'nv-cosmos'

-- Call run and give the colorscheme theme
---@diagnostic disable = undefined-global
run(theme,
	-- convert to a list of vimscript commands
	lushwright.to_vimscript,
	-- pass it through a vim-compatible script (removes blend)
	lushwright.vim_compatible_vimscript,
	-- Add a few housekeeping lines to make it work
	{prepend, {
		'" Maintainer: Fede Pujol',
		"",
		"set background=dark",
		"hi clear",
		"if exists('syntax_on')",
		"\tsyntax reset",
		"endif",
		"let g:colors_name='"..name.."'",
		""
	}},
	-- write the theme to a file
	{overwrite, "colors/"..name..".vim"}
)
