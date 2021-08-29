ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent(Config.ESX, function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('flipvehitem:latxe')
AddEventHandler('flipvehitem:latxe', function()
    local playerPed = GetPlayerPed(-1)
    local playerVeh = GetVehiclePedIsIn(playerPed, true)
    local coords = GetEntityCoords(playerPed)
    local cars = ESX.Game.GetVehiclesInArea(coords, Config.khoangcach)

    if #cars == 0 then
        exports['mythic_notify']:DoHudText('inform', "There are no cars nearby")
        return
    end

    if Config.incar then
        if IsPedInAnyVehicle(playerPed, false) then
            exports['mythic_notify']:DoHudText('inform', "You have to get out of the car")
            return
        end
    end

    TriggerEvent('mythic_progbar:client:progress', {
        name = 'flipvehitem',
        duration = Config.duration,
        label = Config.label,
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = false,
        },
        animation = {
            animDict = "rcmfanatic3",
            anim = "kneel_idle_a",
        },
        prop = {
            --model = "prop_bodyarmour_02",
        }
    }, function(status)
        if not status then
            SetVehicleOnGroundProperly(playerVeh)
            ClearPedTasks(playerPed)
            exports['mythic_notify']:DoHudText('inform', "You have successfully flipped the car")
        end
    end)
end)