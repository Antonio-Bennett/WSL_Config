require'bufferline'.setup {
  ---[[
  highlights = {
    -- BASE COLOURS
    fill = {guibg = "#282c35"},
    background = {guibg = "#282c35"},
    tab_close = {guibg = "#282c35"},
    separator = {guifg = "#282c35", guibg = "#282c35"},
    duplicate = {guibg = "#282c35"},
    modified = {guibg = "#282c35"},
    --[[
		buffer_visible = {
			--Not doing anything for some reason unless I understand incorrectly
            guifg = "#282c35",
            guibg = "#282c35",
		},--]]

    -- SELECTED COLOURS
    buffer_selected = {
      -- guifg = normal_fg,
      guibg = "#282c35",
      gui = "bold,italic"
    },
    duplicate_selected = {
      -- Not doing anything for some reason unless I understand incorrectly
      -- guifg = "#282c35",
      guibg = "#282c35"
    }
  } -- ]]
}
