-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir

-- Color table for highlights
-- stylua: ignore
local colors = {
    bg       = '#202328',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
local config = {
	options = {
		-- Disable sections and component separators
		-- component_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		--        theme = "tokyonight",
		--theme = {
		-- We are going to use lualine_c an lualine_x as left and
		-- right section. Both are highlighted by c theme .  So we
		-- are just setting default looks o statusline
		--normal = { c = { fg = colors.fg, bg = colors.bg } },
		--inactive = { c = { fg = colors.fg, bg = colors.bg } },
		--},
        -- theme = "monokai-pro",
		globalstatus = true,
		disabled_filetypes = { "Outline", "aerial", "alpha", "neo-tree", "NvimTree" }, -- disable startup dashboard
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
	statusline = {

		lualine_c = { "filename" },
	},
}

-- Inserts a component in lualine_c at left section
local function push_left(component)
	table.insert(config.sections.lualine_c, component)
end

local function push_mid_left(component)
	table.insert(config.sections.lualine_b, component)
end

local function push_far_left(component)
	table.insert(config.sections.lualine_a, component)
end

-- Inserts a component in lualine_x at right section
local function push_right(component)
	table.insert(config.sections.lualine_x, component)
end

local function push_far_right(component)
	table.insert(config.sections.lualine_z, component)
end

push_left {
 function()
  return '▊'
end,
 color = { fg = colors.blue }, -- Sets highlighting of component
 padding = { left = 0, right = 1 }, -- We don't need space before this
}


-- push_left({
-- 	"filename",
-- 	cond = conditions.buffer_not_empty,
-- 	--color = { fg = colors.magenta, gui = 'bold' },
-- })

push_left({
	function()
		local project_name = require("project_nvim").get_current_project()
		if not project_name then
            project_name = "No Active Project"
        end
        return project_name
	end,
	icon = "",
})



push_mid_left({
	"branch",
	icon = "",
	--    color = { fg = colors.violet, gui = 'bold' },
})

push_left({ "location" })

--ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
--ins_left {
--  function()
--    return '%='
--  end,
--}

push_left({
	"diff",
	-- Is it me or the symbol for modified us really weird
	symbols = { added = " ", modified = "󰝤 ", removed = " " },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.orange },
		removed = { fg = colors.red },
	},
	-- cond = conditions.hide_in_width,
})

-- show the currently active project

push_right({
	-- copilot status
	"copilot",
})

push_right({
	-- filesize component
	"filetype",
	cond = conditions.buffer_not_empty,
})

-- push_far_right({
-- 	-- Lsp server name .
-- 	function()
-- 		local msg = "No Active Lsp"
-- 		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
-- 		local clients = vim.lsp.get_active_clients()
-- 		if next(clients) == nil then
-- 			return msg
-- 		end
-- 		for _, client in ipairs(clients) do
-- 			local filetypes = client.config.filetypes
-- 			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
-- 				return client.name
-- 			end
-- 		end
-- 		return msg
-- 	end,
-- 	icon = "",
-- })
-- 
-- Add components to right sections
-- push_right({
-- 	"o:encoding", -- option component same as &encoding in viml
-- 	fmt = string.upper, -- I'm not sure why it's upper case either ;)
-- 	cond = conditions.hide_in_width,
-- 	color = { fg = colors.green, gui = "bold" },
-- })

push_right({
	"fileformat",
	fmt = string.upper,
	icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
	color = { fg = colors.green, gui = "bold" },
})

-- -- battery support
 local nvimbattery = {
 	function()
 		return require("battery").get_status_line()
 	end,
 	color = { fg = colors.violet, bg = colors.bg },
 }

push_right {
 function()
  return '▊'
end,
 color = { fg = colors.blue }, -- Sets highlighting of component
 padding = { left = 1, right = 0 }, -- We don't need space before this
}


return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "kyazdani42/nvim-web-devicons" },
	config = function()
		require("lualine").setup(config)
	end,
}
