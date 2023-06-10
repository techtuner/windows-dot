local g = vim.g

g.nord_contrast = true
g.nord_borders = false
g.nord_disable_background = false
g.nord_italic = false
g.nord_uniform_diff_background = true
g.nord_bold = false

vim.cmd [[colorscheme nord]]

require('nord').set()
