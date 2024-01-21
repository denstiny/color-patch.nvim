-- @author      : denstiny (2254228017@qq.com)
-- @file        : init
-- @created     : 星期日 1月 21, 2024 15:25:36 CST
-- @github      : https://github.com/denstiny
-- @blog        : https://denstiny.github.io

local apt = vim.api
local fn = vim.fn
local M = {}
local utils = require("utils")

function M.setup(opts)
    utils.set_user_config(opts)
    config = utils.default

    utils.autocmd({ "ColorScheme" }, {
        callback = function(opts)
            themename = opts.match
            config.all()

            if M.patchs[themename] ~= nil then
                M.patchs[themename]()
            end
        end
    })
end

return M
