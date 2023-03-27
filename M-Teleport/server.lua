--------------------------------------------
---       © Copyright FuriousFoxGG       ---
---    https://github.com/FuriousF0xGG   ---
---     https://discord.gg/cPSAuJppyr    ---
--- Date Created: 03/18/2023 Time: 21:00 ---
--------------------------------------------
local tNotify = Config.tNotify

if Config.ScriptEnabled then
if GetCurrentResourceName() == "M-Teleport" then

RegisterCommand(Config.Teleport.TPToCmd, function(source, args, raw)
    if IsPlayerAceAllowed(source, "furiousfoxgg.tpto") then 
        if args[1] and tonumber(args[1]) then -- tonumber just checks if first arg is a number lol
            local SrcPed = source 
            local target = tonumber(args[1])
            if not GetPlayerName(target) then -- Check if provided ID is valid (If someone with this ID is online)
                if tNotify then
                    TriggerClientEvent('t-notify:client:Alert', source, {style  =  'error', message  =  'You provided an invalid ID.'})
                    return
                else
                    TriggerClientEvent('chat:addMessage', source, {args = {"~r~You provided an invalid ID."}})
                    return
                end
            end
            local UserCoords = GetEntityCoords(GetPlayerPed(target))
            SetEntityCoords(GetPlayerPed(SrcPed), UserCoords.x, UserCoords.y, UserCoords.z + 0.5, 0, 0, 0, false)
            if tNotify then
                TriggerClientEvent('t-notify:client:Alert', source, {style  =  'error', message  =  'Teleported to '..GetPlayerName(target):gsub("~%a~", ""):gsub("~italic~", "")})        
            else
                TriggerClientEvent('chat:addMessage', source, {args = {"~g~Teleported to " .. GetPlayerName(target)}})
            end
            TriggerClientEvent("M:Teleport:DebugLog", -1, GetPlayerName(source).." Teleported to "..GetPlayerName(target).."")
        else
            if tNotify then
                TriggerClientEvent('t-notify:client:Alert', source, {style  =  'error', message  =  'Incorrect Usage: \'/' ..Config.Teleport.TPToCmd..' [ID]\''})        
            else
                TriggerClientEvent('chat:addMessage', source, {args = {"~r~Incorrect Usage: /" .. Config.Teleport.TPToCmd .. " [ID]"}})
            end
        end
    else
        if tNotify then
            TriggerClientEvent('t-notify:client:Alert', source, {style  =  'error', message  =  'You do not have permission to use this command.'})
        else
            TriggerClientEvent('chat:addMessage', source, {args = {"~r~You do not have permission to use this command."}})
        end
    end
end)

RegisterCommand(Config.Teleport.TPBringCmd, function(source, args, raw)
    if IsPlayerAceAllowed(source, "furiousfoxgg.tpbring") then 
        if args[1] and tonumber(args[1]) then 
            local SrcPed = tonumber(args[1])
            if not GetPlayerName(SrcPed) then
                if tNotify then
                    TriggerClientEvent('t-notify:client:Alert', source, {style  =  'error', message  =  'You provided an invalid ID.'})
                    return
                else
                    TriggerClientEvent('chat:addMessage', source, {args = {"~r~You provided an invalid ID."}})
                    return
                end
            end
            local StaffCoords = GetEntityCoords(GetPlayerPed(source))
            if tNotify then
                TriggerClientEvent('t-notify:client:Alert', source, {style  =  'error', message  =  'Teleported '..GetPlayerName(SrcPed):gsub("~%a~", ""):gsub("~italic~", "").. " To you."})  
            else
                TriggerClientEvent('chat:addMessage', source, {args = {"~g~Teleported " .. GetPlayerName(SrcPed) .. "~g~ to you."}}) -- (Changing color to green after name just incase their name was coloured)
            end
            SetEntityCoords(GetPlayerPed(SrcPed), StaffCoords.x, StaffCoords.y, StaffCoords.z + 0.5, 0, 0, 0, false)
            TriggerClientEvent("M:Teleport:DebugLog", -1, GetPlayerName(source).." Teleported User: "..GetPlayerName(SrcPed).." to Staff.")
        else
            if tNotify then
                TriggerClientEvent('t-notify:client:Alert', source, {style  =  'error', message  =  'Incorrect Usage: \'/' ..Config.Teleport.TPBringCmd..' [ID]\''})        
            else
                TriggerClientEvent('chat:addMessage', source, {args = {"~r~Incorrect Usage: /" .. Config.Teleport.TPBringCmd .. " [ID]"}})
            end
        end
    else
        if tNotify then
            TriggerClientEvent('t-notify:client:Alert', source, {style  =  'error', message  =  'You do not have permission to use this command.'})
        else
            TriggerClientEvent('chat:addMessage', source, {args = {"~r~You do not have permission to use this command."}})
        end
    end
end)

end
end
