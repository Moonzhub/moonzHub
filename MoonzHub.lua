-- Wait until the game is fully loaded
repeat task.wait() until game:IsLoaded()

-- Table that maps Game IDs or Place IDs to script URLs
local Games = {
    [2753915549] = "https://darkscripts.space/scripts/5b4750bf-25f3-42fb-9afa-f530a4d57fcd_1323075388615688227.lua",
    [8737602449] = "https://darkscripts.space/scripts/6d353c7e-4a4e-493b-b68a-ee0abb4253e8_1323075388615688227.lua",
    [920587237] = "https://darkscripts.space/scripts/b152ae5d-ec61-4f87-9af2-00f04ebb8bce_1323075388615688227.lua",
}

-- Check if the current game matches any in the Games table
for gameID, scriptURL in pairs(Games) do
    -- Match either by GameId or PlaceId
    if gameID == game.GameId or gameID == game.PlaceId then
        -- Execute the corresponding script
        local success, errorMsg = pcall(function()
            loadstring(game:HttpGet(scriptURL))()
        end)

        -- Handle any errors that occur during script loading
        if not success then
            warn("Failed to load script: " .. errorMsg)
        end

        break -- Stop the loop once a match is found and the script is executed
    end
end