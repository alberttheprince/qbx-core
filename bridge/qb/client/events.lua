-- Trigger Command
--- @deprecated
RegisterNetEvent('QBCore:Command:CallCommand', function(command)
    ExecuteCommand(command)
end)

RegisterNetEvent('QBCore:Client:VehicleInfo', function(info)
    local vehicle = NetworkGetEntityFromNetworkId(info.netId)
    local plate = GetPlate(vehicle)
    local hasKeys = true

    if GetResourceState('qb-vehiclekeys') == 'started' then
        hasKeys = exports['qb-vehiclekeys']:HasKeys()
    end

    local data = {
        vehicle = vehicle,
        seat = info.seat,
        name = info.modelName,
        plate = plate,
        driver = GetPedInVehicleSeat(vehicle, -1),
        inseat = GetPedInVehicleSeat(vehicle, info.seat),
        haskeys = hasKeys
    }

    TriggerEvent('QBCore:Client:'..info.event..'Vehicle', data)
end)