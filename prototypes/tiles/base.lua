require("prototypes.tiles.tiles")

local colors = {
    {name = "red",      chat_color = {r = 1.000, g = 0.266, b = 0.241}},
    {name = "green",    chat_color = {r = 0.173, g = 0.824, b = 0.250}},
    {name = "blue",     chat_color = {r = 0.343, g = 0.683, b = 1.000}},
    {name = "orange",   chat_color = {r = 1.000, g = 0.630, b = 0.259}},
    {name = "yellow",   chat_color = {r = 1.000, g = 0.828, b = 0.231}},
    {name = "pink",     chat_color = {r = 1.000, g = 0.720, b = 0.833}},
    {name = "purple",   chat_color = {r = 0.821, g = 0.440, b = 0.998}},
    {name = "black",    chat_color = {r = 0.5, g = 0.5, b = 0.5}     },
    {name = "brown",    chat_color = {r = 0.757, g = 0.522, b = 0.371}},
    {name = "cyan",     chat_color = {r = 0.335, g = 0.918, b = 0.866}},
    {name = "acid",     chat_color = {r = 0.708, g = 0.996, b = 0.134}},
}

for _, color_data in pairs(colors) do
    local name = color_data.name .. "-refined-concrete"
    local tile = data.raw["tile"][name]

    tile.order = "a[color-ref-crete]"
    tile.minable = {mining_time = 0.1, result = name}
    tile.mined_sound = {filename = "__base__/sound/deconstruct-bricks.ogg"}
    tile.collision_mask = {layers = {ground_tile = true}}


    local item = table.deepcopy(BaseItem)
    item.name = name
    item.order = "a[color-ref-crete]"
    item.subgroup = "py-tiles-2"
    item.icons = {{
        icon = data.raw.item["refined-concrete"].icon,
        tint = color_data.chat_color,
        icon_size = 64
    }}       
    item.place_as_tile = {result = name, condition_size = 1, condition = {layers = {water_tile = true}}}
  
local recipe = table.deepcopy(BaseRecipe)
    recipe.type = "recipe"
    recipe.name = name
    recipe.ingredients = {
      {type = "item", name = "refined-concrete", amount = 1},
    }
    recipe.results = {{type = "item", name = name, amount = 1}}

    data:extend{item, recipe }
end

for _, color_data in pairs(colors) do
    local name = color_data.name .. "-concrete"
    local crete = table.deepcopy(data.raw["tile"]["concrete"])
    crete.name = color_data.name .. "-concrete"
    crete.localised_name = {"tile-name."..crete.name}
    crete.hidden = false
    crete.order = "a[color-crete]"
    crete.subgroup = "py-tiles"
    crete.layer =  data.raw["tile"]["concrete"].layer
    crete.transition_merges_with_tile_line = { "concrete" }
    crete.minable = {mining_time = 0.1, result = name}
    crete.mined_sound = {filename = "__base__/sound/deconstruct-bricks.ogg"}
    crete.collision_mask = {layers = {ground_tile = true}}


    local item = table.deepcopy(BaseItem)
    item.name = name
    order = "a[color-crete]"
    item.subgroup = "py-tiles-2"
    item.icons = {{
        icon = data.raw.item["concrete"].icon,
        tint = color_data.chat_color,
        icon_size = 64
    }}       
    item.place_as_tile = {result = name, condition_size = 1, condition = {layers = {water_tile = true}}}
  
local recipe = table.deepcopy(BaseRecipe)
    recipe.type = "recipe"
    recipe.name = name
    recipe.ingredients = {
      {type = "item", name = "concrete", amount = 1},
    }
    recipe.results = {{type = "item", name = name, amount = 1}}

    data:extend{crete, item, recipe }
end

for _, color_data in pairs(colors) do
    local name = color_data.name .. "-stone-path"
    local brik = table.deepcopy(data.raw["tile"]["stone-path"])
    brik.name = name
    brik.localised_name = {"tile-name."..brik.name}
    brik.hidden = false
    brik.order = "a[color-stone-path]"
    brik.subgroup = "py-tiles"
    brik.layer =  data.raw["tile"]["stone-path"].layer
    brik.transition_merges_with_tile_line = { "stone-path" }
    brik.minable = {mining_time = 0.1, result = name}
    brik.mined_sound = {filename = "__base__/sound/deconstruct-bricks.ogg"}
    brik.collision_mask = {layers = {ground_tile = true}}


    local item = table.deepcopy(BaseItem)
    item.name = name
    item.order = "a[color-stone-path]"
    item.subgroup = "py-tiles-2"
    item.icons = {{
        icon = data.raw.item["stone-brick"].icon,
        tint = color_data.chat_color,
        icon_size = 64
    }}       
    item.place_as_tile = {result = name, condition_size = 1, condition = {layers = {water_tile = true}}}
  
local recipe = table.deepcopy(BaseRecipe)
    recipe.type = "recipe"
    recipe.name = name
    recipe.ingredients = {
      {type = "item", name = "stone-brick", amount = 1},
    }
    recipe.results = {{type = "item", name = name, amount = 1}}

    data:extend{brik, item, recipe }
end