--------------------------------------------
---       © Copyright FuriousFoxGG       ---
---    https://github.com/FuriousF0xGG   ---
---     https://discord.gg/cPSAuJppyr    ---
--- Date Created: 03/18/2023 Time: 21:00 ---
--------------------------------------------

Citizen.Trace("\n===========\nLoading " ..GetCurrentResourceName().. "\nScript Enabled: " ..tostring(Config.ScriptEnabled).. "\n===========")

if Config.ScriptEnabled then
if GetCurrentResourceName() == "M-Teleport" then

TriggerEvent('chat:addSuggestion', '/'..Config.Teleport.TPBringCmd, '[STAFF ONLY] Teleport a User to you.', {{ name="ID", help="The ID You want to bring to you."}})
TriggerEvent('chat:addSuggestion', '/'..Config.Teleport.TPToCmd, '[STAFF ONLY] Teleport to a User.', {{ name="ID", help="The ID you want to teleport to." }})

--Don't question why I made a Config for just debugging, I'm just like that :)
    RegisterNetEvent("M:Teleport:DebugLog")
    AddEventHandler("M:Teleport:DebugLog", function(msg)
       if Config.Debug then 
        Citizen.Trace("\n" .. msg)
        --[[EVENT COPY AND PASTE, TEHE
        TriggerClientEvent("M:Teleport:DebugLog", -1, ARGS_HERE_BUDDY)
        TriggerEvent("M:Teleport:DebugLog", ARGS_HERE_BUDDY)
    ]]
        end
    end)
else 
    Citizen.Trace("\nERROR: " ..GetCurrentResourceName().. " Needs to be Named M-Teleport\n===========")
end
else 
    Citizen.Trace("\n"..GetCurrentResourceName().. " is currently disabled as Config.ScriptEnabled = " ..tostring(Config.ScriptEnabled).. "\n===========")
end
