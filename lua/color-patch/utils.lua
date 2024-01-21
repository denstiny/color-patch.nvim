local M = {
    default = {
        all = function() end,
        patch = {}
    }
}

---@param opts table
function M.set_user_config(opts)
    if type(opts) == "table" and opts ~= {} then
        M.default = vim.tbl_deep_extend("force", M.default, opts)
    end
end

M.group = vim.api.nvim_create_augroup("color-patch", { clear = true })
M.autocmd = function(event, opt)
    opt.group = M.group
    vim.api.nvim_create_autocmd(event, opt)
end

return M
