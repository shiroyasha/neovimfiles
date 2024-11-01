local status,  lualine = pcall(require, "lualine")
if not status then
  return
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {
      { 
        'mode', 
        fmt = function(str) return str:sub(1,1) end
      }
    },
    lualine_b = {'diagnostics'},
    lualine_c = {
      {
        'filename',
        path = 1,
        shorting_target = 0
      },
    },
    lualine_x = {},
    lualine_y = {'progress', 'location'},
    lualine_z = {}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        'filename',
        path = 1,
        shorting_target = 0
      },
    },
    lualine_x = {},
    lualine_y = {'progress', 'location'},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
