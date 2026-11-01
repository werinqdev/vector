local required_functions = {
    "hookfunction",
    "getloadedmodules",
    "request",
    "cloneref"
}

local function _check()
    local passed = {}
    for _, func in required_functions do
        if getgenv()[func] then
            table.insert(passed, func)
        end
    end

    if passed == required_functions then
        return true
    end

    return false
end

return _check()
