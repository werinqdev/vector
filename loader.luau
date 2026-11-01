local StarterGui = cloneref(game:GetService("StarterGui"))

local placeid = game.PlaceId
local url = "https://raw.githubusercontent.com/werinqdev/vector/refs/heads/main/games/"..placeid.."/main.luau"

local integritycheck = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/werinqdev/vector/refs/heads/main/integrity.luau", true
))()

if not integritycheck then
    StarterGui:SetCore("SendNotification", {
        Title = "Vector",
        Text = "Executor not supported!",
        Duration = 5,
        Button1 = "OK",
        Button2 = "I DONT CARE"
    })
    return
end

local function _getGameScript()
    local response = game:HttpGet(url)

    if response == "404: Not Found" then
        return nil
    end

    return response
end

local script = _getGameScript()
if not script then
    StarterGui:SetCore("SendNotification", {
        Title = "Vector",
        Text = "Game not supported!",
        Duration = 5,
        Button1 = "OK",
        Button2 = "I DONT CARE"
    })
else
    loadstring(script)()
end
