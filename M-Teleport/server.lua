--------------------------------------------
---       © Copyright FuriousFoxGG       ---
---    https://github.com/FuriousF0xGG   ---
---     https://discord.gg/cPSAuJppyr    ---
--- Date Created: 03/18/2023 Time: 21:00 ---
--------------------------------------------

if Config.ScriptEnabled then
if GetCurrentResourceName() == "M-Teleport" then

RegisterCommand(Config.Teleport.TPToCmd, function(source, args, raw)
    if IsPlayerAceAllowed(source, "furiousfoxgg.tpto") then 
    if args[1] then 
        local SrcPed = source 
        local UserCoords = GetEntityCoords(GetPlayerPed(args[1]))
        SetEntityCoords(GetPlayerPed(SrcPed), UserCoords.x, UserCoords.y, UserCoords.z + 0.5, 0, 0, 0, false)
        TriggerClientEvent('t-notify:client:Alert', source, {style  =  'error', message  =  'Teleported to '..GetPlayerName(SrcPed):gsub("~%a~", ""):gsub("~italic~", "")})        
        TriggerClientEvent("M:Teleport:DebugLog", -1, GetPlayerName(source).." Teleported to "..GetPlayerName(SrcPed).."")
    else
        TriggerClientEvent('t-notify:client:Alert', source, {style  =  'error', message  =  'Incorrect Usage: \'/' ..Config.Teleport.TPToCmd..' [ID]\''})        
        end
    else
        TriggerClientEvent('t-notify:client:Alert', source, {style  =  'error', message  =  'You do not have permission to use this command.'})
    end
end)

RegisterCommand(Config.Teleport.TPBringCmd, function(source, args, raw)
    if IsPlayerAceAllowed(source, "furiousfoxgg.tpbring") then 
    if args[1] then 
        local SrcPed = args[1]
        local StaffCoords = GetEntityCoords(GetPlayerPed(source))
        TriggerClientEvent('t-notify:client:Alert', source, {style  =  'error', message  =  'Teleported '..GetPlayerName(SrcPed):gsub("~%a~", ""):gsub("~italic~", "").. " To you."})  
        SetEntityCoords(GetPlayerPed(SrcPed), StaffCoords.x, StaffCoords.y, StaffCoords.z + 0.5, 0, 0, 0, false)
        TriggerClientEvent("M:Teleport:DebugLog", -1, GetPlayerName(source).." Teleported User: "..GetPlayerName(SrcPed).." to Staff.")
    else
        TriggerClientEvent('t-notify:client:Alert', source, {style  =  'error', message  =  'Incorrect Usage: \'/' ..Config.Teleport.TPBringCmd..' [ID]\''})        
        end
    else
        TriggerClientEvent('t-notify:client:Alert', source, {style  =  'error', message  =  'You do not have permission to use this command.'})        
    end
end)

end 
end
