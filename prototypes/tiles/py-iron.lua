require("prototypes.tiles.py-tile")
require("prototypes.tiles.recipes")
    pyFeTile = table.deepcopy(BaseTile)
        pyFeTile.name = "py-iron"
        pyFeTile.localised_name = {"tile-name.py-iron"}
        pyFeTile.order = "a[py-iron-tile]"
        pyFeTile.layer =  72
        pyFeTile.minable =  {
            mining_time = 0.1,
            result = "py-iron" 
        }
        pyFeTile.variants = {
            main = {{
                picture = "__pyindustrygraphics__/graphics/tiles/py-iron/py-iron.png",
                count = 4,
                scale = 0.5,
                size = 1,
                y = 0,
                line_length = 8,
            }},
            empty_transitions = false,
            transition  = Refcrete.variants.transition,
        }
        pyFeTile.icon = "__pyindustrygraphics__/graphics/icons/py-iron.png"

    local feItem = table.deepcopy(BaseItem)
        feItem.name = "py-iron"
        feItem.icon = "__pyindustrygraphics__/graphics/icons/py-iron.png"
        feItem.place_as_tile_result = {
        tile = "py-iron",
        condition = { "ground-tile" }
        }

  
    local feRecipe = table.deepcopy(BaseRecipe)
        feRecipe.type = "recipe"
        feRecipe.name = "py-iron"
        feRecipe.ingredients = {
        {type = "item", name = "iron-plate", amount = 1},
        {type = "item", name = "steel-plate", amount = 1}
        }
        feRecipe.results = {{type = "item", name = "py-iron", amount = 1}}
if Active_mod_mode ~= 3 then
    data:extend{ pyFeTile, feItem, feRecipe }
end
