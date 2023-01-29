local QBCore = exports['qb-core']:GetCoreObject()

function teleport(coord, heading,shouldIgnoreWait)
	DoScreenFadeOut(500)
    if shouldIgnoreWait == nil then
	    Citizen.Wait(2000)
    end
	SetEntityCoords(PlayerPedId(), coord.x, coord.y, coord.z-1.0)
	SetEntityHeading(PlayerPedId(), heading)
	DoScreenFadeIn(500)
end



Citizen.CreateThread(function()
    exports['qb-target']:AddBoxZone("goincoke", Config.coca.entry.coord, 2, 2, {
        name = "goincoke",
        debugPoly = false,
    }, {
        options = {{
            type = "client",
            event = "brp-drugs:goIn",
            icon = "fa fa-sign-in",
            spot = "coke",
            label = "Enter",
        }},
        distance = 2
    })
    exports['qb-target']:AddBoxZone("gooutcoke", Config.coca.exit.coord, 2, 2, {
        name = "gooutcoke",
        debugPoly = false,
    }, {
        options = {{
            type = "client",
            event = "brp-drugs:goOut",
            icon = "fa fa-sign-in",
            spot = "coke",
            label = "Leave",
        }},
        distance = 2
    })
    exports['qb-target']:AddBoxZone("goinmeth", Config.meth.entry.coord, 2, 2, {
        name = "goinmeth",
        debugPoly = false,
    }, {
        options = {{
            type = "client",
            event = "brp-drugs:goIn",
            icon = "fa fa-sign-in",
            spot = "meth",
            label = "Enter",
        }},
        distance = 2
    })
    exports['qb-target']:AddBoxZone("gooutmeth", Config.meth.exit.coord, 2, 2, {
        name = "gooutmeth",
        debugPoly = false,
    }, {
        options = {{
            type = "client",
            event = "brp-drugs:goOut",
            icon = "fa fa-sign-in",
            spot = "meth",
            label = "Leave",
        }},
        distance = 2
    })
    exports['qb-target']:AddBoxZone("goinweed", Config.weed.entry.coord, 2, 2, {
        name = "goinweed",
        debugPoly = false,
    }, {
        options = {{
            type = "client",
            event = "brp-drugs:goIn",
            icon = "fa fa-sign-in",
            spot = "weed",
            label = "Enter",
        }},
        distance = 2
    })
    exports['qb-target']:AddBoxZone("gooutweed",Config.weed.exit.coord, 2, 2, {
        name = "gooutweed",
        debugPoly = false,
    }, {
        options = {{
            type = "client",
            event = "brp-drugs:goOut",
            icon = "fa fa-sign-in",
            spot = "weed",
            label = "Leave",
        }},
        distance = 2
    })
end)


RegisterNetEvent("brp-drugs:goOut")
AddEventHandler("brp-drugs:goOut", function(args)
    if args.spot == "coke" then
        teleport(Config.coca.entry.coord,Config.coca.entry.heading)
    elseif args.spot == "meth" then
        teleport(Config.meth.entry.coord,Config.meth.entry.heading)
    elseif args.spot == "weed" then
        teleport(Config.weed.entry.coord,Config.weed.entry.heading)

    end
end)


RegisterNetEvent("brp-drugs:goIn")
AddEventHandler("brp-drugs:goIn", function(args)
    if args.spot == "coke" then
        teleport(Config.coca.exit.coord,Config.coca.exit.heading)
    elseif args.spot == "meth" then
        if Config.meth.entry.card_required then
            QBCore.Functions.TriggerCallback("brp-drugs:checkItem", function(output) 
                if output then
                    teleport(Config.meth.exit.coord,Config.meth.exit.heading,true)
                    used = false
                else
                    used = false
                    QBCore.Functions.Notify("You do not have the right card for this.","error")
                end
            end, Config.meth.entry.card_item, 1)
        else
            teleport(Config.meth.exit.coord,Config.meth.exit.heading)
        end
       

    elseif args.spot == "weed" then
        teleport(Config.weed.exit.coord,Config.weed.exit.heading)
    end
end)

Citizen.CreateThread(function ()
    for i=1,#Config.Locations["weed"]["weedcollect"] do
        exports['qb-target']:AddBoxZone("brp-drugs:plukkblader"..i,Config.Locations["weed"]["weedcollect"][i], 5, 5, {
            name = "brp-drugs:plukkblader"..i,
            heading = 0,
            debugPoly = false,
            minZ = Config.Locations["weed"]["weedcollect"][i].z -5,
            maxZ = Config.Locations["weed"]["weedcollect"][i].z +5,
        }, {
            options = {
                {
                    type = "Client",
                    event = "brp-drugs:client:startProsess",
                    --icon = "fas fa-wrench",
                    label = 'Pick leaves',
                    args = {
                        collect = true,
                        item = Config.weed.collectitem,
                        labeltext = "Picking leaves..",

                    },

                },
            },
            distance = 2.5,
        })
    end
    for i=1,#Config.Locations["weed"]["weedpackage"] do
        exports['qb-target']:AddBoxZone("brp-drugs:pakkweed"..i, Config.Locations["weed"]["weedpackage"][i], 2, 2, {
            name = "brp-drugs:pakkweed"..i,
            heading = 0,
            debugPoly = false,
            minZ=  Config.Locations["weed"]["weedpackage"][i].z-5,
            maxZ =  Config.Locations["weed"]["weedpackage"][i].z+5,
        }, {
            options = {
                {
                    type = "Client",
                    event = "brp-drugs:client:startProsess",
                    --icon = "fas fa-wrench",
                    label = 'Pack weed',
                    args = {
                        collect = false,
                        item = Config.weed.collectitem,
                        finalproduct = Config.weed.finalproduct,
                        labeltext = "Packs weed..",
                    }

                },
            },
            distance = 2.5,
        })
    end
    for i=1,#Config.Locations["cocain"]["cocaincollect"] do
        exports['qb-target']:AddBoxZone("brp-drugs:hentkokain"..i,Config.Locations["cocain"]["cocaincollect"][i], 5, 5, {
            name = "brp-drugs:hentkokain"..i,
            heading = 0,
            debugPoly = false,
            minZ= Config.Locations["cocain"]["cocaincollect"][i].z-5,
            maxZ = Config.Locations["cocain"]["cocaincollect"][i].z+5,
        }, {
            options = {
                {
                    type = "Client",
                    event = "brp-drugs:client:startProsess",
                    --icon = "fas fa-wrench",
                    label = 'Collect coca',
                    args = {
                        collect = true,
                        item = Config.coca.collectitem,
                        labeltext = "Collecting coca..",

                    },

                },
            },
            distance = 2.5,
        })
    end
    for i=1,#Config.Locations["cocain"]["cocainpackage"] do
        exports['qb-target']:AddBoxZone("brp-drugs:pakkkokain"..i, Config.Locations["cocain"]["cocainpackage"][i], 2, 2, {
            name = "brp-drugs:pakkkokain"..i,
            heading = 0,
            debugPoly = false,
            minZ= Config.Locations["cocain"]["cocainpackage"][i].z-5,
            maxZ = Config.Locations["cocain"]["cocainpackage"][i].z+5,
        }, {
            options = {
                {
                    type = "Client",
                    event = "brp-drugs:client:startProsess",
                    --icon = "fas fa-wrench",
                    label = 'Pack coca',
                    args = {
                        collect = false,
                        item = Config.coca.collectitem,
                        finalproduct = Config.coca.finalproduct,
                        labeltext = "Packs coca..",
                    }

                },
            },
            distance = 2.5,
        })
    end
    for i=1,#Config.Locations["meth"]["methcollect"] do
        exports['qb-target']:AddBoxZone("brp-drugs:hentmeth"..i,Config.Locations["meth"]["methcollect"][i], 2, 2, {
            name = "brp-drugs:hentmeth"..i,
            heading = 0,
            debugPoly = false,
            minZ= Config.Locations["meth"]["methcollect"][i].z-5,
            maxZ = Config.Locations["meth"]["methcollect"][i].z+5,
        }, {
            options = {
                {
                    type = "Client",
                    event = "brp-drugs:client:startProsess",
                    --icon = "fas fa-wrench",
                    label = 'Make meth',
                    args = {
                        collect = true,
                        item = Config.meth.item,
                        finalproduct = Config.meth.collectitem,
                        labeltext = "Cooks meth..",
                        meth = true,
                    },

                },
            },
            distance = 2.5,
        })
    end
    for i=1,#Config.Locations["meth"]["methpackage"] do
        exports['qb-target']:AddBoxZone("brp-drugs:pakkmeth"..i, Config.Locations["meth"]["methpackage"][i], 2, 2, {
            name = "brp-drugs:pakkmeth"..i,
            heading = 0,
            debugPoly = false,
            minZ= Config.Locations["meth"]["methpackage"][i].z-5,
            maxZ = Config.Locations["meth"]["methpackage"][i].z+5,
        }, {
            options = {
                {
                    type = "Client",
                    event = "brp-drugs:client:startProsess",
                    --icon = "fas fa-wrench",
                    label = 'Pack meth',
                    args = {
                        collect = false,
                        item = Config.meth.collectitem,
                        finalproduct = Config.meth.finalproduct,
                        labeltext = "Packs meth..",
                    }

                },
            },
            distance = 2.5,
        })
    end
end)

local function checkIfResources(args,amount)
    local howMany = 0
    if args.args.meth == nil then
            for i=1,amount do
                if QBCore.Functions.HasItem(args.args.item,i) == true then
                    howMany = i
                end
            end
    else
        for x=1,#args.args.item do
            for i=1,amount do
                if QBCore.Functions.HasItem(args.args.item[x],i) == true then
                    howMany = i
                end
            end
        end
    end
    return howMany
end

RegisterNetEvent("brp-drugs:client:startProsess",function(args,i,x)
    local i = i or 0
    local x = x or math.random(2,5)
    if args.args.meth == nil then
        local amount = math.random(Config.Amount[1],Config.Amount[2])
        local amount = checkIfResources(args,amount)
        if args.args.collect == true or QBCore.Functions.HasItem(args.args.item,amount) then
            ExecuteCommand("e mechanic")
                Wait(200)
                local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
                Skillbar.Start({
                    duration = math.random(700,2000),
                    pos = math.random(10, 30),
                    width = math.random(10, 15),
                }, function()
                i = i+1
                if i ~= x then
                    TriggerEvent("brp-drugs:client:startProsess",args, i,x)
                else
                    QBCore.Functions.Progressbar("job_progress", args.args.labeltext, math.random(5500,6000), false, true, {
                        disableMovement = true,
                    }, {}, {}, {}, function() -- Done
                        ExecuteCommand("e c")
                        TriggerServerEvent("brp-drugs:server:giveItem",args,amount)
 
                    end, function() -- cancel
                        ExecuteCommand("e c")
                    end)
                end
            end, function()
                TriggerEvent("QBCore:Notify", "You didn't make it.", "error")
                ExecuteCommand("e c")
 
            end)
 
 
        else
            TriggerEvent("QBCore:Notify", "You don't have enough.", "error")
        end
    else
        local amount = math.random(Config.Amount[1],Config.Amount[2])
        local amount = checkIfResources(args,amount)
       if amount > 0 then
        ExecuteCommand("e mechanic")
                 Wait(100)

                local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
                Skillbar.Start({
                    duration = math.random(700,2000),
                    pos = math.random(10, 30),
                    width = math.random(10, 15),
                }, function()
                i = i+1
                if i ~= x then
                    TriggerEvent("brp-drugs:client:startProsess",args, i,x)
                else
                    QBCore.Functions.Progressbar("job_progress", args.args.labeltext, math.random(5500,6000), false, true, {
                        disableMovement = true,
                    }, {}, {}, {}, function() -- Done
                        ExecuteCommand("e c")
                        TriggerServerEvent("brp-drugs:server:giveItem",args,amount)
 
                    end, function() -- cancel
                        ExecuteCommand("e c")
                    end)
                end
            end, function()
                TriggerEvent("QBCore:Notify", "You did not make it.", "error")
                ExecuteCommand("e c")
 
            end)
       else
            TriggerEvent("QBCore:Notify", "You don't have enough.", "error")
       end
    end
 
 
end)
