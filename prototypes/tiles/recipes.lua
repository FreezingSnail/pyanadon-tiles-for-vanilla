Active_mod_mode = 1
if mods["space-age"] then
    Active_mod_mode = 2
elseif mods["pyalternativeenergy"] then
    Active_mod_mode = 3
end
-- TODO need to add item / fluid tag
Colors_additives = {
    ["red"] = {
        {{"fluid", "heavy-oil", 50}}, -- base
        {{"item", "yumako", 2}}, -- spce
        {}, -- py

    },
    ["green"] = {
        {{"fluid", "lubricant",50}}, -- base
        {{"item","spoilage", 2}}, -- spce
        {}, -- py

    },
    ["blue"] = {
       {{"item","iron-ore", 2}}, -- base
       {{"item","iron-ore", 2}}, -- spce
       {}, -- py
    },
    ["orange"] = {
       {{"item","copper-ore", 2}}, -- base
       {{"item","copper-ore", 2}}, -- spce
       {}, -- py
    },
    ["yellow"] = {
       {{"item","sulfur", 2}}, -- base
       {{"item","sulfur", 2}}, -- spce
       {}, -- py
    },
    ["pink"] = {
       {{"fluid", "heavy-oil",50}, {"item", "plastic-bar",2}}, -- base
       {{"item","holmium-ore", 2}}, -- spce
       {}, -- py
    },
    ["purple"] = {
       {{"fluid", "petroleum-gas",50}}, -- base
       {{"item","tungsten-ore", 2}}, -- spce
       {}, -- py
    },
    ["black"] = {
       {{"item","coal", 2}}, -- base
       {{"item","carbon", 2}}, -- spce
       {}, -- py
    },
    ["brown"] = {
       {{"item","wood", 2}}, -- base
       {{"item","wood", 2}}, -- spce
       {}, -- py
    },
    ["cyan"] = {
       {{"fluid", "lubricant",50},{"item","iron-ore",2}}, -- base
       {{"item","lithium", 2}}, -- spce
       {}, -- py
    },
    ["acid"] = {
       {{"item","uranium-ore", 2}}, -- base
       {{"item","uranium-ore", 2}}, -- spce
       {}, -- py
    },
    ["molybdenum"] = {
       {{"fluid", "petroleum-gas",50}}, -- base
       {{"item","holmium-plate", 2}}, -- spce
       {   {type = "item", name = "molybdenum-plate", amount = 3},
            {type = "fluid", name = "industrial-solvent", amount = 50}}, -- py
    },
    ["copper"] = {
       {{"item","copper-plate", 2}}, -- base
       {{"item","copper-plate", 2}}, -- spce
       {{type = "item", name = "copper-plate", amount = 3},
            {type = "fluid", name = "industrial-solvent", amount = 50}}, -- py
    },
    ["nickel"] = {
       {{"item","uranium-238", 2}}, -- base
       {{"item","uranium-238", 2}}, -- spce
       {{type = "item", name = "nickel-plate", amount = 3},
            {type = "fluid", name = "industrial-solvent", amount = 50}}, -- py
    },
    ["zinc"] = {
       {{"item","uranium-ore", 2}}, -- base
       {{"item","jelly", 2 }}, -- spce
       {{type = "item", name = "zinc-plate", amount = 3},
            {type = "fluid", name = "industrial-solvent", amount = 50}}, -- py
    },
    ["lead"] = {
       {{"item","coal", 2 }}, -- base
       {{"item","carbon", 2 }}, -- spce
       {{type = "item", name = "lead-plate", amount = 3},
            {type = "fluid", name = "industrial-solvent", amount = 50}}, -- py
    },
    ["niobium"] = {
       {{"item","iron-plate", 2}}, -- base
       {{"item","lithium-plate", 2}}, -- spce
       {{type = "item", name = "niobium-plate", amount = 3},
            {type = "fluid", name = "industrial-solvent", amount = 50}}, -- py
    },
    ["tin"] = {
       {{"fluid", "petroleum-gas",50}}, -- base
       {{"item","tungsten-plate", 2}}, -- spce
       {{type = "item", name = "tin-plate", amount = 3},
            {type = "fluid", name = "industrial-solvent", amount = 50}}, -- py
    },
    ["titanium"] = {
       {{"fluid", "petroleum-gas",50}}, -- base
       {{"item","holmium-plate", 2}}, -- spce
       {{type = "item", name = "titanium-plate", amount = 3},
            {type = "fluid", name = "industrial-solvent", amount = 50}}, -- py
    },
}