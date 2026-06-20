Refcrete = table.deepcopy(data.raw["tile"]["refined-concrete"])
BaseTile = table.deepcopy(data.raw["tile"]["refined-concrete"])
BaseTile.name = "py-"
BaseTile.localised_name = {"tile-name.py-"}
BaseTile.hidden = false
BaseTile.order = "a[py-tyle]"
BaseTile.subgroup = "py-tiles"
BaseTile.layer =  Refcrete.layer
BaseTile.transition_merges_with_tile_line = { "refined-concrete" }

BaseItem = {
    type = "item",
    name = "py-",
    icon = "__pyindustrygraphics__/graphics/icons/py-.png",
    subgroup = "py-tiles",
    order = "z[py-tile]",
    place_as_tile_result = {
      tile = "py-",
      condition = { "ground-tile" }
    },
    stack_size = 1000,
  }

BaseRecipe = {
    type = "recipe",
    name = "py--recipe",
    enabled = true,
    energy_required = 8, -- time to craft in seconds (at crafting speed 1)
    ingredients = {
    --  {type = "item", name = "iron-plate", amount = 1},
     -- {type = "item", name = "steel-plate", amount = 1}
    },
    results = {{type = "item", name = "py-", amount = 1}}
  }



local tileNames = {
    {"iron-oxide", "iron-oxide",false,"",76+8},
    {"limestone", "limestone-icon",false,"",77+8},
    {"steel","steel",false,"", 7},
    {"nexelit","nexelit",false,"", 75+8},
    {"asphalt","__base__/graphics/terrain/lab-tiles/lab-dark-2.png", true,"", 9},
    {"coal-tile","__base__/graphics/terrain/lab-tiles/lab-dark-1.png", true, "", 10},
    {"quartz", "__base__/graphics/terrain/lab-tiles/lab-white.png",false, "__base__/graphics/terrain/lab-tiles/lab-white.png", 99}
}



for k, tile in ipairs(tileNames) do
    local tileName = tile[1]
    local icon = "__pyindustrygraphics__/graphics/icons/py-"..tile[2]..".png"
    local iconSize = BaseItem.icon_size
    if tile[2]:sub(1,1) == "_" then
        icon = tile[2]
        iconSize = 1
    end
    local sprite = "__pyindustrygraphics__/graphics/tiles/py-"..tileName.."/py-"..tileName..".png"
    local sCount = 4
    local sScale = 0.5
    if tile[4] ~= "" then
        sprite = tile[4]
        sCount = 1
        sScale = 1
    end

    local sTransistions = false
    local sTransistion = Refcrete.variants.transition
    if tile[3] then
        sTransistions = true
        sTransistion = {
            mask_layout = {
                inner_corner = {
                    spritesheet = "__pyindustrygraphics__/graphics/tiles/py-"..tileName.."-tile/py-"..tileName.."-tile-inner-corner-mask.png",
                    count = 8,
                    scale = 0.5
                },
                outer_corner = {
                    spritesheet = "__pyindustrygraphics__/graphics/tiles/py-"..tileName.."-tile/py-"..tileName.."-tile-outer-corner-mask.png",
                    count = 8,
                    scale = 0.5
                },
                side = {
                    spritesheet = "__pyindustrygraphics__/graphics/tiles/py-"..tileName.."-tile/py-"..tileName.."-tile-side-mask.png",
                    count = 8,
                    scale = 0.5
                },
                u_transition = {
                    spritesheet = "__pyindustrygraphics__/graphics/tiles/py-"..tileName.."-tile/py-"..tileName.."-tile-u-mask.png",
                    count = 8,
                    scale = 0.5
                },
                o_transition = {
                    spritesheet = "__pyindustrygraphics__/graphics/tiles/py-"..tileName.."-tile/py-"..tileName.."-tile-o-mask.png",
                    count = 4,
                    scale = 0.5
                }
            }
        }
    end

    local pyTile = table.deepcopy(BaseTile)
    pyTile.name = "py-"..tileName
    pyTile.localised_name = {"tile-name.py-"..tileName}
    pyTile.order = "a[py-"..tileName.."-tile]"
    pyTile.layer =  tile[5]
    pyTile.minable =  {
        mining_time = 0.1,
        result = "py-"..tileName.."" 
    }
    pyTile.variants = {
        main = {{
            picture = sprite,
            count = sCount,
            scale = sScale,
            size = 1,
            y = 0,
            line_length = 8,
        }},
        empty_transitions = sTransistions,
        transition  = sTransistion,
    }
    pyTile.icon_size = iconSize
    pyTile.icon = icon

    local pyItem = table.deepcopy(BaseItem)
        pyItem.name = "py-"..tileName..""
        pyItem.icon_size = iconSize
        pyItem.icon = icon
        pyItem.place_as_tile = {
            result = "py-"..tileName,
            condition_size = 1,
            condition = {layers={water_tile=true}}
        }
    
    local pyRecipe = table.deepcopy(BaseRecipe)
        pyRecipe.type = "recipe"
        pyRecipe.name = "py-"..tileName
        pyRecipe.ingredients = {
        {type = "item", name = "iron-plate", amount = 1},
        {type = "item", name = "steel-plate", amount = 1}
        }
        pyRecipe.results = {{type = "item", name = "py-"..tileName.."", amount = 1}}

    data:extend{ pyTile, pyItem, pyRecipe }
end