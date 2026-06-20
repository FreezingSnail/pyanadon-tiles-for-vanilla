require("prototypes.functions.helpers")
require("prototypes.tiles.py-aluminium")

local metal_tints = {
	{ "molybdenum", "FFE3C2E6",1 },
	{ "copper", "FFEFC586",2 },
	{ "nickel", "FF697E72",3 },
	{ "zinc", "FFADE0CA",4 },
	{ "lead", "FF403C40",5 },
	{ "niobium", "FFC9DAF0",6 },
	{ "tin", "FFC6B2E2",7 },
	{ "titanium", "FFE6BED8",8 },
}
for _, t in ipairs({pyAlTile, pyFeTile}) do
  for _, pair in ipairs(metal_tints) do
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
      stack_size = 1000,
    }
      local recipe = {
      type = "recipe",
      name = t.name.."-"..name.."-recipe",
      localised_name = { "recipe-name." .. tile.name  },
      enabled = true,
      energy_required = 1, -- time to craft in seconds (at crafting speed 1)
      ingredients = {
        {type = "item", name = t.name, amount = 1},
      },
      results = {{type = "item", name = t.name.."-"..name, amount = 1}}
    }

    data:extend{ tile, recipe, item }
  end
end