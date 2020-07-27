------------------------------------------------
--              by Ozne#4870                  --
------------------------------------------------


ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('Ozne_chasse:reward')
AddEventHandler('Ozne_chasse:reward', function(Weight)
    local xPlayer = ESX.GetPlayerFromId(source)

    if Weight >= 1 then
        xPlayer.addInventoryItem('meat_a', 1)
    elseif Weight >= 9 then
        xPlayer.addInventoryItem('meat_a', 2)
    elseif Weight >= 15 then
        xPlayer.addInventoryItem('meat_a', 3)
    end

    xPlayer.addInventoryItem('leather_a', math.random(0, 1))
        
end)

RegisterServerEvent('Ozne_chasse:sell')
AddEventHandler('Ozne_chasse:sell', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    local meat_aPrice = 125
    local leather_aPrice = 200

    local meat_aQuantity = xPlayer.getInventoryItem('meat_a').count
    local leather_aQuantity = xPlayer.getInventoryItem('leather_a').count

    if meat_aQuantity > 0 or leather_aQuantity > 0 then
        xPlayer.addMoney(meat_aQuantity * meat_aPrice)
        xPlayer.addMoney(leather_aQuantity * leather_aPrice)

        xPlayer.removeInventoryItem('meat_a', meat_aQuantity)
        xPlayer.removeInventoryItem('leather_a', leather_aQuantity)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez vendu ~b~' .. leather_aQuantity + meat_aQuantity .. '~s~ pieces animales et gagné ~b~$' .. leather_aPrice * leather_aQuantity + meat_aPrice * meat_aQuantity)
    else
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous n avez pas assez de ~b~viande~s~ ou de ~b~cuir')
    end
        
end)

function sendNotification(xsource, message, messageType, messageTimeout)
    TriggerClientEvent('notification', xsource, message)
end


------------------------------------------------
--              by Ozne#4870                  --
------------------------------------------------