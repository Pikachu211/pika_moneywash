ESX = nil
TriggerEvent('esx:getSharedObject', function(object) ESX = object end)

RegisterServerEvent('moneyWash:washMoney')
AddEventHandler('moneyWash:washMoney', function()
    local plr = ESX.GetPlayerFromId(source)
    local blackMoney = plr.getAccount('black_money').money
    if blackMoney ~= 0 then
        plr.removeAccountMoney('black_money', blackMoney)
        TriggerClientEvent('esx:showNotification', plr.source, 'Washing ~g~$'.. tostring(blackMoney) ..' Dirty Money')
        Citizen.Wait(5000)
        plr.addMoney(blackMoney)
        TriggerClientEvent('esx:showNotification', plr.source, 'Washing Completed')
    else
        TriggerClientEvent('esx:showNotification', plr.source, 'Small amount of dirty money')
    end
end)