repeat until game:IsLoaded()
local tpservice = game:GetService("TeleportService")
local plr = game.Players.LocalPlayer
local request = (syn and syn.request) or (http and http.request) or http_request

local SupportedGames = {
    [6152116144] = {
        ['Name'] = "ProjectSlayers",
        ['Maintenance'] = false,
    }
}

if SupportedGames[game.PlaceId] then
    local getName = SupportedGames[game.PlaceId].Name
    local checkMT = SupportedGames[game.PlaceId].Maintenance
    local g
    local p = pcall(function() g = game:HttpGet("https://raw.githubusercontent.com/GramxPerson/GramxProject/main/GamesSupported/"..getName..'.gp') end)
    if p == true and not checkMT then
        loadstring(g)()
    elseif p == true and checkMT then
        plr:Kick('[GP] System\nscript on maintenance/updating\nJoin discord for more info \ndiscord.gg/rH6yZ83ESq\n')
        setclipboard('discord.gg/rH6yZ83ESq')
     
        if request then
            request(
                {
                    Url = "http://127.0.0.1:6463/rpc?v=1",
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json",
                        ["Origin"] = "https://discord.com"
                    },
                    Body = game:GetService("HttpService"):JSONEncode(
                        {
                            cmd = "INVITE_BROWSER",
                            args = {code = "rH6yZ83ESq"},
                            nonce = game:GetService("HttpService"):GenerateGUID(false)
                        }
                    )
                }
            )
        end
    end
else
    plr:Kick('[GP] System\nGame not supported\nJoin discord for more info \ndiscord.gg/rH6yZ83ESq\n')
    setclipboard('discord.gg/rH6yZ83ESq')

     
    if request then
        request(
            {
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["Origin"] = "https://discord.com"
                },
                Body = game:GetService("HttpService"):JSONEncode(
                    {
                        cmd = "INVITE_BROWSER",
                        args = {code = "rH6yZ83ESq"},
                        nonce = game:GetService("HttpService"):GenerateGUID(false)
                    }
                )
            }
        )
    end
end
