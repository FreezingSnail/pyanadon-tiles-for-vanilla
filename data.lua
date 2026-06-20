local enabled_concepts = {
  "tiles.py-aluminium",
  "tiles.py-iron",
  "tiles.tints",
  "tiles.tiles",
  "tiles.base"
}

for _, concept in pairs(enabled_concepts) do
    require("prototypes." .. concept)
end
