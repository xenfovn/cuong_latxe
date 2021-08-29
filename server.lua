ESX = nil 

TriggerEvent(Config.ESX, function(obj) ESX = obj end)

ESX.RegisterUsableItem('flipvehitem', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('flipvehitem', 1)
    TriggerClientEvent('flipvehitem:latxe', source)
end)