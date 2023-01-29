Config = {}
Config.Locations = {
    ["weed"] = {
        ["weedcollect"] = {
        vector3(1063.46, -3193.29, -39.13),
        vector3(1063.16, -3198.25, -39.1),
        vector3(1063.45, -3203.9, -39.14),
        vector3(1057.87, -3205.58, -39.11),
        vector3(1052.26, -3206.24, -39.14),
        vector3(1051.93, -3198.88, -39.11),
        vector3(1051.72, -3195.97, -39.13),
        vector3(1051.5, -3191.96, -39.14),
        vector3(1051.99, -3189.14, -39.14),
        vector3(1056.26, -3189.76, -39.12),
        vector3(1057.73, -3199.67, -39.12)
        },
        ["weedpackage"] = {
            vector3(1039.24, -3205.39, -38.17),
            vector3(1036.42, -3203.81, -38.17),
            vector3(1033.96, -3203.81, -38.18),
            vector3(1034.65, -3205.58, -38.18),
        }
    },
    ["cocain"] = {
        ["cocaincollect"] = {
            vector3(1090.49, -3194.83, -38.99),
            vector3(1092.84, -3194.84, -38.99),
            vector3(1095.26, -3194.82, -38.99),
        },
        ["cocainpackage"] = {
            vector3(1101.98, -3193.67, -38.99),
            vector3(1099.63, -3194.4, -38.99),
            vector3(1100.63, -3198.73, -38.99),
        }
    },
    ["meth"] = {
        ["methcollect"] = {
            vector3(1006.02, -3200.44, -38.52)
                },
        ["methpackage"] = {
            vector3(1012.06, -3194.96, -38.99),
            vector3(1014.08, -3194.96, -38.99),
            vector3(1016.38, -3194.96, -38.99),
            vector3(1004.2, -3194.95, -38.99),
        }
    },
    
}
Config.Amount = {3,5}

Config.coca = {
    collectitem = "coca",
    finalproduct = "packagedcoca",
    entry = { 
        -- ENTRY COORDS WHERE THEY GO IN
        coord = vector3(62.0, -53.96, 77.02), 
        heading = 158.14,
    },
    exit = { 
        -- LAB COORDS
        coord = vector3(1088.56, -3188.12, -39.0), 
        heading =  183.55 
    }, 
    
}
Config.meth = {
    item = {"efedrin","saltsyre"},
    collectitem = "meth",
    finalproduct = "packagedmeth",
    entry = { 
        -- ENTRY COORDS WHERE THEY GO IN
        coord = vector3(2988.05, 3481.67, 72.49), 
        heading = 354.8,
        card_required = true,
        card_item = "labcard",
    },
    exit = { 
        -- LAB COORDS
        coord = vector3(997.48, -3200.8, -36.4), 
        heading = 250, 
    },
}


Config.weed = {
    collectitem = "weed",
    finalproduct = "packagedweed",
    entry = {
        -- ENTRY COORDS WHERE THEY GO IN
        coord = vector3(281.62, 6789.24, 15.86),
        intheading = 255.09,
    },
    exit = {
        -- LAB COORDS
        coord = vector3(1066.0, -3183.48, -39.16),
        heading = 85.32,
    },
}