local required_functions = {
    "hookfunction",
    "getloadedmodules",
    "request",
    "cloneref"
}

local function _sameKeys(t1, t2)
    for key in pairs(t1) do
        if t2[key] == nil then
            return false
        end
    end

    for key in pairs(t2) do
        if t1[key] == nil then
            return false
        end
    end

    return true
end

local function _check()
    local passed = {}
    for _, func in required_functions do
        if getgenv()[func] then
            table.insert(passed, func)
        end
    end

    if _sameKeys(passed, required_functions) then
        return true
    end

    return false
end

return _check()
