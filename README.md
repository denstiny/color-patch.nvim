# Preface

I usually like to make some modifications for the colorschemes I love to match my personal preference. In the past, I had three options:

- Creating a PR for that colorscheme: It's my own preference, and I don't think it's likely to be accepted.
- Maintaining my own fork: I need to track the upstream updates myself.
- Writing ad hoc code for different colors in my `.vimrc`: Ugly.

Therefore, I created this plugin to centralize all colorscheme patches in one place, typically in my dotfiles repository, and have them load automatically when I type `:color xxx` .

## ✨ Features
- 🎨 Automatically lazy-loads colorschemes
- 📦 Conveniently manage patches of different themes

## 📦 Installation
> lazy.nvim
```lua
require("lazy").setup({
    "denstiny/color-patch.nvim",
    dependencies = "rebelot/kanagawa.nvim",
    config = function()
        local color_patch = require("color-patch")
        color_patch.setup({
            -- setting default load colorscheme
            use = {
                --- colorscheme name
                name = "kanagawa", -- default ""
                --- Whether to use lazy loading 
                lazy = true -- default true
            },
            -- Setting any theme will load it
            all = function()
                vim.cmd([[hi Normal guibg=None]])
            end,
            kanagawa = {
                -- scheme patch
                patch = function()
                    vim.cmd([[
                            hi StatusLine guibg=bg
                            hi EndOfBuffer guifg=bg
                            hi LineNr      guibg=bg guifg=bg
                            hi link MyLineNr LineNr
                            hi LineNr      guibg=bg
                            hi link MyLineNr LineNr
                            hi NormalFloat guibg=bg
                            hi NormalNC    guibg=bg
                            hi SignColumn  guibg=bg
                            hi WinBar      guibg=bg
                            hi WinBarNc    guibg=bg
                            hi VertSplit   guibg=bg
                            hi FloatBorder guibg=bg
                    ]])
                end,
                -- scheme config
                config = function()
                    require('kanagawa').setup({})
                end
            }
        })
    end,
    event = "UiEnter"
}
``` 

## inspiration
[vim-color-patch](https://github.com/skywind3000/vim-color-patch)
