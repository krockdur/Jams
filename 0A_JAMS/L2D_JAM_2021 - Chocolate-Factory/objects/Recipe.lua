-- Recette à produire

local RecipesDictionnary = require("datas.Recipes")

local Recipe = {}

local name
local nbIngredients
local tabIngredients = {}

Recipe.zone21 = 0
Recipe.zone22 = 0
Recipe.zone23 = 0
Recipe.zone24 = 0
Recipe.zone25 = 0
Recipe.zone26 = 0


function Recipe.create(randomNumber)
  
  print(randomNumber)
--[[
  if randomNumber == 1 then
    name = "cookies"
    nbIngredients = 3
    tabIngredients[1] = "chocolate chips"           -- pépittes
    tabIngredients[2] = "flour"                     -- farine
    tabIngredients[3] = "egg"                       -- oeufs
  end
]]--

  if randomNumber == 1 then
    name = "cookies"
  elseif randomNumber == 2 then  
    name = "brownie"
  elseif randomNumber == 3 then  
    name = "cake"
  elseif randomNumber == 4 then  
    name = "chocolateMilk"
  elseif randomNumber == 5 then  
    name = "chocolateMousse"
  elseif randomNumber == 6 then  
    name = "spread"
  end

  nbIngredients = #RecipesDictionnary[name]
  tabIngredients = RecipesDictionnary[name]

end

-- test si la recette soumise est conforme
function Recipe.validateReceipe(tabSubmit)
  
  local nbIngOk = 0
  
  
  if #tabSubmit == nbIngredients then
    for idSb, ingTbSubmit in pairs(tabSubmit) do

      for id, ingTabIng in pairs(tabIngredients) do
        if ingTabIng == ingTbSubmit then
          nbIngOk = nbIngOk + 1
        end
      end

    end

    if (nbIngOk == nbIngredients) then
      return true
    else
      return false
    end

  else
    return false
  end
end



local brownie       
local cake          
local chocolateMilk 
local chocolateMouse
local cookies       
local spread        
local butter        
local chocolateChips
local cocoa         
local eggs          
local flour         
local hazelnut      
local milk          
local oil           
local sugar         

function Recipe.load()
  brownie         = love.graphics.newImage("assets/brownie.png")
  cake            = love.graphics.newImage("assets/cake.png")
  chocolateMilk   = love.graphics.newImage("assets/chocolate-milk.png")
  chocolateMouse  = love.graphics.newImage("assets/chocolate-mousse.png")
  cookies         = love.graphics.newImage("assets/cookies.png")
  spread          = love.graphics.newImage("assets/spread.png")

  butter          = love.graphics.newImage("assets/ingredients/butter.png")
  chocolateChips  = love.graphics.newImage("assets/ingredients/chocolate-chips.png")
  cocoa           = love.graphics.newImage("assets/ingredients/cocoa.png")
  eggs            = love.graphics.newImage("assets/ingredients/eggs.png")
  flour           = love.graphics.newImage("assets/ingredients/flour.png")
  hazelnut        = love.graphics.newImage("assets/ingredients/hazelnut.png")
  milk            = love.graphics.newImage("assets/ingredients/milk.png")
  oil             = love.graphics.newImage("assets/ingredients/oil.png")
  sugar           = love.graphics.newImage("assets/ingredients/sugar.png")
end

function Recipe.draw()

  -- dessiner la recette cible
  if name == "cookies" then
    love.graphics.draw(cookies, 7*64, 0)
  elseif name == "brownie" then
    love.graphics.draw(brownie, 7*64, 0)
  elseif name == "cake" then
    love.graphics.draw(cake, 7*64, 0)
  elseif name == "chocolateMilk" then
    love.graphics.draw(chocolateMilk, 7*64, 0)
  elseif name == "chocolateMousse" then
    love.graphics.draw(chocolateMouse, 7*64, 0)
  elseif name == "spread" then
    love.graphics.draw(spread, 7*64, 0)
  end


  -- dessiner les ingrédients du plateau
  love.graphics.draw(butter,          14*64, 8*64)--
  love.graphics.draw(chocolateChips,  01*64, 8*64)--
  love.graphics.draw(cocoa,           01*64, 6*64)--
  love.graphics.draw(eggs,            14*64, 2*64)--
  love.graphics.draw(flour,           01*64, 4*64)--
  love.graphics.draw(hazelnut,        14*64, 4*64)--
  love.graphics.draw(milk,            01*64, 2*64)--
  love.graphics.draw(oil,             14*64, 6*64)--
  love.graphics.draw(sugar,           04*64, 9*64)--

  if Recipe.zone21 ~= 0 then
    if Recipe.zone21 == 11 then
      love.graphics.draw(milk, 7*64, 5*64)
    elseif Recipe.zone21 == 12 then
      love.graphics.draw(flour, 7*64, 5*64)
    elseif Recipe.zone21 == 13 then
      love.graphics.draw(cocoa, 7*64, 5*64)
    elseif Recipe.zone21 == 14 then
      love.graphics.draw(chocolateChips, 7*64, 5*64)
    elseif Recipe.zone21 == 15 then
      love.graphics.draw(sugar, 7*64, 5*64)
    elseif Recipe.zone21 == 16 then
      love.graphics.draw(butter, 7*64, 5*64)
    elseif Recipe.zone21 == 17 then
      love.graphics.draw(oil, 7*64, 5*64)
    elseif Recipe.zone21 == 18 then
      love.graphics.draw(hazelnut, 7*64, 5*64)
    elseif Recipe.zone21 == 19 then
      love.graphics.draw(eggs, 7*64, 5*64)
    end
  end

  if Recipe.zone22 ~= 0 then
    if Recipe.zone22 == 11 then
      love.graphics.draw(milk, 7*64, 6*64)
    elseif Recipe.zone22 == 12 then
      love.graphics.draw(flour, 7*64, 6*64)
    elseif Recipe.zone22 == 13 then
      love.graphics.draw(cocoa, 7*64, 6*64)
    elseif Recipe.zone22 == 14 then
      love.graphics.draw(chocolateChips, 7*64, 6*64)
    elseif Recipe.zone22 == 15 then
      love.graphics.draw(sugar, 7*64, 6*64)
    elseif Recipe.zone22 == 16 then
      love.graphics.draw(butter, 7*64, 6*64)
    elseif Recipe.zone22 == 17 then
      love.graphics.draw(oil, 7*64, 6*64)
    elseif Recipe.zone22 == 18 then
      love.graphics.draw(hazelnut, 7*64, 6*64)
    elseif Recipe.zone22 == 19 then
      love.graphics.draw(eggs, 7*64, 6*64)
    end
  end

  if Recipe.zone23 ~= 0 then
    if Recipe.zone23 == 11 then
      love.graphics.draw(milk, 7*64, 7*64)
    elseif Recipe.zone23 == 12 then
      love.graphics.draw(flour, 7*64, 7*64)
    elseif Recipe.zone23 == 13 then
      love.graphics.draw(cocoa, 7*64, 7*64)
    elseif Recipe.zone23 == 14 then
      love.graphics.draw(chocolateChips, 7*64, 7*64)
    elseif Recipe.zone23 == 15 then
      love.graphics.draw(sugar, 7*64, 7*64)
    elseif Recipe.zone23 == 16 then
      love.graphics.draw(butter, 7*64, 7*64)
    elseif Recipe.zone23 == 17 then
      love.graphics.draw(oil, 7*64, 7*64)
    elseif Recipe.zone23 == 18 then
      love.graphics.draw(hazelnut, 7*64, 7*64)
    elseif Recipe.zone23 == 19 then
      love.graphics.draw(eggs, 7*64, 7*64)
    end
  end

  if Recipe.zone24 ~= 0 then
    if Recipe.zone24 == 11 then
      love.graphics.draw(milk, 8*64, 7*64)
    elseif Recipe.zone24 == 12 then
      love.graphics.draw(flour, 8*64, 7*64)
    elseif Recipe.zone24 == 13 then
      love.graphics.draw(cocoa, 8*64, 7*64)
    elseif Recipe.zone24 == 14 then
      love.graphics.draw(chocolateChips, 8*64, 7*64)
    elseif Recipe.zone24 == 15 then
      love.graphics.draw(sugar, 8*64, 7*64)
    elseif Recipe.zone24 == 16 then
      love.graphics.draw(butter, 8*64, 7*64)
    elseif Recipe.zone24 == 17 then
      love.graphics.draw(oil, 8*64, 7*64)
    elseif Recipe.zone24 == 18 then
      love.graphics.draw(hazelnut, 8*64, 7*64)
    elseif Recipe.zone24 == 19 then
      love.graphics.draw(eggs, 8*64, 7*64)
    end
  end


  if Recipe.zone25 ~= 0 then
    if Recipe.zone25 == 11 then
      love.graphics.draw(milk, 8*64, 6*64)
    elseif Recipe.zone25 == 12 then
      love.graphics.draw(flour, 8*64, 6*64)
    elseif Recipe.zone25 == 13 then
      love.graphics.draw(cocoa, 8*64, 6*64)
    elseif Recipe.zone25 == 14 then
      love.graphics.draw(chocolateChips, 8*64, 6*64)
    elseif Recipe.zone25 == 15 then
      love.graphics.draw(sugar, 8*64, 6*64)
    elseif Recipe.zone25 == 16 then
      love.graphics.draw(butter, 8*64, 6*64)
    elseif Recipe.zone25 == 17 then
      love.graphics.draw(oil, 8*64, 6*64)
    elseif Recipe.zone25 == 18 then
      love.graphics.draw(hazelnut, 8*64, 6*64)
    elseif Recipe.zone25 == 19 then
      love.graphics.draw(eggs, 8*64, 6*64)
    end
  end
  
  if Recipe.zone26 ~= 0 then
    if Recipe.zone26 == 11 then
      love.graphics.draw(milk, 8*64, 5*64)
    elseif Recipe.zone26 == 12 then
      love.graphics.draw(flour, 8*64, 5*64)
    elseif Recipe.zone26 == 13 then
      love.graphics.draw(cocoa, 8*64, 5*64)
    elseif Recipe.zone26 == 14 then
      love.graphics.draw(chocolateChips, 8*64, 5*64)
    elseif Recipe.zone26 == 15 then
      love.graphics.draw(sugar, 8*64, 5*64)
    elseif Recipe.zone26 == 16 then
      love.graphics.draw(butter, 8*64, 5*64)
    elseif Recipe.zone26 == 17 then
      love.graphics.draw(oil, 8*64, 5*64)
    elseif Recipe.zone26 == 18 then
      love.graphics.draw(hazelnut, 8*64, 5*64)
    elseif Recipe.zone26 == 19 then
      love.graphics.draw(eggs, 8*64, 5*64)
    end
  end
  
end

function Recipe.resetZones()
    Recipe.zone21 = 0
    Recipe.zone22 = 0
    Recipe.zone23 = 0
    Recipe.zone24 = 0
    Recipe.zone25 = 0
    Recipe.zone26 = 0
end


return Recipe