local bluestone = "FF6081A0"
data:extend({
  {
    type = "item-subgroup",
    name = "py-tiles-2",
    group = "tiles", -- e.g., logistics, production, combat
    order = "z-a" -- dictates where this row appears in the tab
  }
})

data:extend({
  {
    type = "item-subgroup",
    name = "py-tiles",
    group = "tiles", -- e.g., logistics, production, combat
    order = "z-a" -- dictates where this row appears in the tab
  }
})

local enabled_concepts = {
  "tiles.py-aluminium",
  "tiles.py-iron",
  "tiles.py-tile",
  "tiles.recipes",
  "tiles.base",
  "tiles.py-tints",
  "tiles.py-limestone-tints"

  --"tiles.space-age"
}

for _, concept in ipairs(enabled_concepts) do
    require("prototypes." .. concept)
end
