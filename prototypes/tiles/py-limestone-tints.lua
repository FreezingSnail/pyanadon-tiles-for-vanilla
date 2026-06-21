require("prototypes.functions.helpers")
require("prototypes.tiles.recipes")

  local refcrete = table.deepcopy(data.raw["tile"]["refined-concrete"])
local category = "chemistry"
if Active_mod_mode == 3 then 
  category="electrolyzer"
end

local ingredients = {
 ["molybdenum"] = {
       {{"fluid", "petroleum-gas",50}}, -- base
       {{"item","holmium-plate", 2}}, -- spce
       {{"item", "molybdenum-ore", 3},
        {"fluid", "creosote", 50}}, -- py
    },
    ["copper"] = {
       {{"item","copper-plate", 2}}, -- base
       {{"item","copper-plate", 2}}, -- spce
       {{"item", "copper-ore", 3},
        {"fluid", "creosote", 50}}, -- py
    },
    ["nickel"] = {
       {{"item","uranium-238", 2}}, -- base
       {{"item","uranium-238", 2}}, -- spce
       {{"item", "ore-nickel", 3},
        {"fluid", "creosote", 50}}, -- py
    },
    ["zinc"] = {
       {{"item","uranium-ore", 2}}, -- base
       {{"item","jelly", 2 }}, -- spce
       {{"item", "ore-zinc", 3},
        {"fluid", "creosote", 50}}, -- py
    },
    ["lead"] = {
       {{"item","coal", 2 }}, -- base
       {{"item","carbon", 2 }}, -- spce
       {{"item", "ore-lead", 3},
        {"fluid", "creosote", 50}}, -- py
    },
    ["niobium"] = {
       {{"item","iron-plate", 2}}, -- base
       {{"item","lithium-plate", 2}}, -- spce
       {{"item", "niobium-ore", 3},
        {"fluid", "creosote", 50}}, -- py
    },
    ["tin"] = {
       {{"fluid", "petroleum-gas",50}}, -- base
       {{"item","tungsten-plate", 2}}, -- spce
       {{"item", "ore-tin", 3},
        {"fluid", "creosote", 50}}, -- py
    },
    ["titanium"] = {
       {{"fluid", "petroleum-gas",50}}, -- base
       {{"item","holmium-plate", 2}}, -- spce
       {{"item", "ore-titanium", 3},
        {"fluid", "creosote", 50}}, -- py
    },
}

local metal_tints = {
	{ "molybdenum", "FFE3C2E6",1  },
	{ "copper", "FFEFC586",2  },
	{ "nickel", "FF697E72",3  },
	{ "zinc", "FFADE0CA",4 },
	{ "lead", "FF403C40",5 },
	{ "niobium", "FFC9DAF0",6 },
	{ "tin", "FFC6B2E2",7 },
	{ "titanium", "FFE6BED8",8  },
}
local t = table.deepcopy(data.raw["tile"]["refined-concrete"])
t.name = "py-limestone"
t.localised_name = {"tile-name.py-limestone"}
t.hidden = false
t.order = "a[color-limestone-tile]"
t.subgroup = "py-tiles"
t.icon = "__pyindustrygraphics__/graphics/icons/py-limestone-icon.png"
t.variants = {
        main = {{
          picture = "__pyindustrygraphics__/graphics/tiles/py-limestone/py-limestone.png",
          count = 4,
          scale = 0.5,
          size = 1,
          y = 0,
          line_length = 8,
        }},
      empty_transitions = false,
      transition  = refcrete.variants.transition,
    }
t.transition_merges_with_tile_line = { "refined-concrete" }

for _, pair in pairs(metal_tints) do
    local tint = pair[2]
    local name = pair[1]
    local tile = table.deepcopy(t)
    tile.name = t.name .. "-" .. name
    tile.localised_name = { "tile-name." .. tile.name  }
    tile.order = "a[py-"..t.name.."]-" .. name
    tile.subgroup = "py-tiles"
    tile.layer = t.layer + pair[3]
    tile.tint = hex2rgb(tint)
    tile.minable =  {
      mining_time = 0.1,
      result = t.name .. "-".. name
    }
    tile.icons = {
              {icon = t.icon, tint=hex2rgb(tint) },
          }

    local item = {
      type = "item",
      name = tile.name,
      localised_name = { "item-name." .. tile.name  },
      icons = {
              {icon = t.icon, tint=hex2rgb(tint) },
          },
      subgroup = "py-tiles",
      order = "z[py-tile]",
      place_as_tile = {
            result = t.name.."-"..name,
            condition_size = 1,
            condition = {layers={water_tile=true}}
        },
      stack_size = 10000,
    }
    local recipe_items = ingredients[name][Active_mod_mode]
    local ingredient_list = {{type = "item", name = t.name, amount = 1}}
    for _, item in ipairs(recipe_items) do
      table.insert(ingredient_list, {type = item[1], name = item[2], amount = item[3]})
    end
    
    local recipe = {
      type = "recipe",
      name = t.name.."-"..name.."-recipe",
      category = category,
      localised_name = { "recipe-name." .. tile.name  },
      enabled = true,
      energy_required = 1, -- time to craft in seconds (at crafting speed 1)
      ingredients = ingredient_list,
      results = {{type = "item", name = t.name.."-"..name, amount = 2}},
      auto_recycle = false 
    }

    data:extend{ tile, recipe, item }
  end