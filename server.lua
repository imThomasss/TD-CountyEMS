NDCore = exports["ND_Core"]:GetCoreObject()

--[[
    For ND_Core
]]

RegisterNetEvent("TD:DeductMoney")
AddEventHandler("TD:DeductMoney", function()
    local player = source
    local HospitalCharge = 150 -- Amount to charge player when being discharged from medical
    NDCore.Functions.DeductMoney(HospitalCharge, player, "bank")
    TriggerClientEvent('chatMessage', -1, "[TD] [Hospital] You have been discharged from the hospital and charged $" .. HospitalCharge .. " come back soon :)")
end)