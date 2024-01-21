local M = {
    default = {
        use = {
            name = "",
            lazy = true
        },
        all = function() end,
    },
    group = vim.api.nvim_create_augroup("color-patch", { clear = true })
}

function M.autocmd(event, opt)
    opt.group = M.group
    vim.api.nvim_create_autocmd(event, opt)
end

---@param opts table
function M.set_user_config(opts)
    if type(opts) == "table" and opts ~= {} then
        M.default = vim.tbl_deep_extend("force", M.default, opts)
    end
end

--- use scheme config
function M.use_scheme_config()
    local name = M.default.use.name
    if M.default[name] ~= nil then
        M.default[name].config()
    end
end

--- switch color theme
function M.use_scheme()
    if M.default.use.lazy then
        M.autocmd({ "UiEnter" }, {
            callback = function()
                M.use_scheme_config()
                vim.cmd("colorscheme " .. M.default.use.name)
                M.use_patch(M.default.use.name)
            end
        })
    else
        M.use_scheme_config()
        vim.cmd("colorscheme " .. M.default.use.name)
        M.use_patch(M.default.use.name)
    end
end

--- start color theme after use patch
---@param name string
function M.use_patch(name)
    M.default.all()
    if M.default[name] ~= nil and M.default[name].patch ~= nil then
        M.default[name].patch()
    end
end

M.autocmd({ "ColorScheme" }, {
    callback = function(_)
        themename = _.match
        M.use_patch(themename)
    end
})

return M
