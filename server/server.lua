local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("brp-drugs:server:giveItem",function(args,amount)
    local finalproduct = args.args.finalproduct
    local amount = amount
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if args.args.meth == nil then
        local item = args.args.item

        if args.args.collect == false then
            Player.Functions.AddItem(finalproduct, amount)
            Player.Functions.RemoveItem(item, amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[finalproduct], "add", amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", amount)
        else
            Player.Functions.AddItem(item, amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount)
        end
    else
        for i=1,#args.args.item do
            Player.Functions.RemoveItem(args.args.item[i], amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[args.args.item[i]], "remove", 1)
        end
        Player.Functions.AddItem(finalproduct, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[finalproduct], "add", 1)

    end



end)

QBCore.Functions.CreateCallback("brp-drugs:checkItem", function(source, cb, itemname, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = xPlayer.Functions.GetItemByName(itemname)
    if item and item.amount >= count then
        cb(true)
    else
        cb(false)
    end
end)

