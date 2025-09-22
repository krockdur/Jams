
local Map = {}

-- 2 => Pas de déplacement
-- 1 => Déplacement possible
-- 3 => Pas de déplacement | zone spéciale pour plus tard ?
-- 4 => table du milieu pour déposer les ingrédients
-- 5 => poubelle en cas d'erreur de saisie

-- 11 => milk
-- 12 => flour
-- 13 => cocoa
-- 14 => chocolate chips
-- 15 => sugar
-- 16 => butter
-- 17 => oil
-- 18 => hazelnut
-- 19 => eggs

-- 21 => zone de déchargement 21
-- 22 => zone de déchargement 22
-- 23 => zone de déchargement 23
-- 24 => zone de déchargement 24
-- 25 => zone de déchargement 25
-- 26 => zone de déchargement 26

-- 31 => poubelle

-- 41 => zone de préparation de la recette

Map.lvlCollision = {
  {02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02},
  {02, 02, 02, 02, 02, 02, 02, 01, 01, 02, 02, 02, 02, 02, 02, 02},
  {02, 03, 11, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 19, 03, 02},
  {02, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 02},
  {02, 03, 12, 01, 01, 01, 01, 41, 41, 01, 01, 01, 01, 18, 03, 02},
  {02, 01, 01, 01, 01, 01, 21, 04, 04, 26, 01, 01, 01, 01, 01, 02},
  {02, 03, 13, 01, 01, 01, 22, 04, 04, 25, 01, 01, 01, 17, 03, 02},
  {02, 01, 01, 01, 01, 01, 23, 04, 04, 24, 01, 01, 01, 01, 01, 02},
  {02, 03, 14, 01, 15, 01, 01, 01, 01, 01, 01, 31, 01, 16, 03, 02},
  {02, 01, 01, 01, 03, 01, 01, 01, 01, 01, 01, 02, 01, 01, 01, 02},
  {02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02},
  {02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02}
}

function Map.getStrIngredient(numIngredient)
  if numIngredient == 11 then
    return "milk"
  end
  if numIngredient == 12 then
    return "flour"
  end
  if numIngredient == 13 then
    return "cocoa"
  end
  if numIngredient == 14 then
    return "chocolate chips"
  end
  if numIngredient == 15 then
    return "sugar"
  end
  if numIngredient == 16 then
    return "butter"
  end
  if numIngredient == 17 then
    return "oil"
  end
  if numIngredient == 18 then
    return "hazelnut"
  end
  if numIngredient == 19 then
    return "eggs"
  end
end

return Map