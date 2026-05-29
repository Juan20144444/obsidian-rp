local zones = {}
local currentZone = nil

exports('AddEZone', function(name, coords, radius, label, cb)
    zones[name] = { coords = coords, radius = radius or 2.0, label = label or 'Interactuar', cb = cb }
end)

exports('RemoveEZone', function(name)
    zones[name] = nil
end)

local function DrawText3D(coords, text)
    SetDrawOrigin(coords.x, coords.y, coords.z, 0)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 230)
    SetTextCentre(true)
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

CreateThread(function()
    while true do
        local sleep = 750
        local ped = PlayerPedId()
        local pcoords = GetEntityCoords(ped)
        currentZone = nil

        for name, z in pairs(zones) do
            local dist = #(pcoords - z.coords)
            if dist <= z.radius then
                sleep = 0
                currentZone = name
                DrawText3D(vector3(z.coords.x, z.coords.y, z.coords.z + 0.25), ('[E] %s'):format(z.label))
                if IsControlJustReleased(0, 38) then
                    if type(z.cb) == 'function' then z.cb() end
                end
                break
            end
        end
        Wait(sleep)
    end
end)

RegisterCommand('obsidianetest', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    exports['obsidian-einteract']:AddEZone('test_ob', coords, 2.0, 'Prueba Obsidian', function()
        TriggerEvent('chat:addMessage', { args = { 'Obsidian', 'Interacción con E funcionando.' } })
    end)
end, false)
