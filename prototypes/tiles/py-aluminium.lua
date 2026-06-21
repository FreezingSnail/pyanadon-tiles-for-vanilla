require("prototypes.tiles.recipes")

  local refcrete = table.deepcopy(data.raw["tile"]["refined-concrete"])
  pyAlTile = table.deepcopy(data.raw["tile"]["refined-concrete"])
    pyAlTile.name = "py-aluminium"
    pyAlTile.localised_name = {"tile-name.py-aluminium"}
    pyAlTile.hidden = false
    pyAlTile.order = "a[color-aluminium-tile]"
    pyAlTile.subgroup = "py-tiles"
    pyAlTile.layer =  78+8
    pyAlTile.minable =  {
      mining_time = 0.1,
      result = "py-aluminium" 
    }
    pyAlTile.icon = "__pyindustrygraphics__/graphics/icons/py-aluminium.png" 
    pyAlTile.variants = {
        main = {{
          picture = "__pyindustrygraphics__/graphics/tiles/py-aluminium/py-aluminium.png",
          count = 4,
          scale = 0.5,
          size = 1,
          y = 0,
          line_length = 8,
        }},
      empty_transitions = false,
      transition  = refcrete.variants.transition,
    }
    pyAlTile.transition_merges_with_tile_line = { "refined-concrete" }

    local item = {
      type = "item",
      name = "py-aluminium",
      icon = "__pyindustrygraphics__/graphics/icons/py-aluminium.png",
      subgroup = "py-tiles",
      order = "z[my-tile]",
      place_as_tile_result = {
        tile = "py-aluminium",
        condition = { "ground-tile" }
      },
      stack_size = 1000,
    }
      local recipe = {
      type = "recipe",
      name = "py-aluminium",
      category = "crafting-with-fluid",
      enabled = true,
      energy_required = 1, -- time to craft in seconds (at crafting speed 1)
      ingredients = {
        {type = "item", name = "copper-plate", amount = 1},
        {type = "item", name = "steel-plate", amount = 1}
      },
      results = {{type = "item", name = "py-aluminium", amount = 1}},
    }
if Active_mod_mode ~= 3 then
    data:extend{ pyAlTile, recipe, item }
end
