RegisterCommand('countyems', function(source)
	local player = GetPlayerPed(-1)
	local veh = GetVehiclePedIsUsing(player)
    local Health = GetEntityHealth(player)
    if IsEntityDead(player) or Health <= 139  then
        exports['an_progBar']:run(6,'Calling County EMS','#23bd7a')
        Citizen.Wait(7000)
        exports['an_progBar']:run(6,'County EMS Dispatched','#23bd7a')
        Citizen.Wait(7000)
        exports['an_progBar']:run(3,'County EMS Arrival','#23bd7a')
        Citizen.Wait(4000)
        exports['an_progBar']:run(8,'Receiving Treatment','#23bd7a')
        Citizen.Wait(9000)
        exports['an_progBar']:run(6,'Being Prepared for transport','#23bd7a')
        Citizen.Wait(7000)
        exports['an_progBar']:run(6,'Being Transported','#23bd7a')
        Citizen.Wait(7000)
        if Config.DeletePlayerVehicle then
            if IsPedInAnyVehicle(player, true) then
                DeleteEntity(veh)
            end
        end
        if Config.RemoveWeapons then
            RemoveAllPedWeapons(player, true)
        end
        NetworkResurrectLocalPlayer(GetEntityCoords(player, true), true, true, false)
        SetPlayerInvincible(player, false)
        ClearPedBloodDamage(player);
        SetEntityCoords(player, Config.HospitalCoords.x, Config.HospitalCoords.y, Config.HospitalCoords.z, false, false, false, false)
        SetEntityHeading(player, Config.HospitalCoords.h)
        TriggerEvent('chatMessage', "[TD] You have been discharged from the hospital.")
         --[[exports['t-notify']:Alert({
             style = 'Success', 
            message = 'You have been discharged from the hospital'
        })     -- Example of using a notification resource instead of a chat message.
        ]]
    else
        TriggerEvent('chatMessage', "[TD] You are not Injured or dead.")
    end
end)

Citizen.CreateThread(function()

    TriggerEvent('chat:addSuggestion', '/countyems', 'Get County Medical Help', {
      { name="County EMS", help="Receive medical attention if there are no active EMS"}
    })
end)





