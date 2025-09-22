
local Recipes = require("datas.Recipes")

local UI = {}



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

local mark

local recipeSelected = "none"

local soundBook

function UI.load()
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

  mark            = love.graphics.newImage("assets/mark.png")
  
  
  soundBook       = love.audio.newSource("assets/sounds/book.ogg", "static")
end

function UI.update(dt)

end

function UI.draw()

  -- recettes
  love.graphics.draw(brownie, 5*64, 10*64)
  love.graphics.draw(cake, 6*64, 10*64)
  love.graphics.draw(chocolateMilk, 7*64, 10*64)
  love.graphics.draw(chocolateMouse, 8*64, 10*64)
  love.graphics.draw(cookies, 9*64, 10*64)
  love.graphics.draw(spread, 10*64, 10*64)

  if recipeSelected == "brownie" then
    love.graphics.draw(mark, 5*64, 10*64)
    UI.drawRecipes("brownie")
  end
  if recipeSelected == "cake" then
    love.graphics.draw(mark, 6*64, 10*64)
    UI.drawRecipes("cake")
  end
  if recipeSelected == "chocolateMilk" then
    love.graphics.draw(mark, 7*64, 10*64)
    UI.drawRecipes("chocolateMilk")
  end
  if recipeSelected == "chocolateMouse" then
    love.graphics.draw(mark, 8*64, 10*64)
    UI.drawRecipes("chocolateMousse")
  end
  if recipeSelected == "cookies" then
    love.graphics.draw(mark, 9*64, 10*64)
    UI.drawRecipes("cookies")
  end
  if recipeSelected == "spread" then
    love.graphics.draw(mark, 10*64, 10*64)
    UI.drawRecipes("spread")
  end


end


function UI.drawRecipes(title)

  local nbTileShw = 0

  for i, j in pairs(Recipes[title]) do
    if j == "butter" then
      love.graphics.draw(butter, (5+nbTileShw)*64, 11*64)
    elseif j == "chocolate chips" then
      love.graphics.draw(chocolateChips, (5+nbTileShw)*64, 11*64)
    elseif j == "cocoa" then
      love.graphics.draw(cocoa, (5+nbTileShw)*64, 11*64)
    elseif j == "eggs" then
      love.graphics.draw(eggs, (5+nbTileShw)*64, 11*64)
    elseif j == "flour" then
      love.graphics.draw(flour, (5+nbTileShw)*64, 11*64)
    elseif j == "hazelnut" then
      love.graphics.draw(hazelnut, (5+nbTileShw)*64, 11*64)
    elseif j == "milk" then
      love.graphics.draw(milk, (5+nbTileShw)*64, 11*64)
    elseif j == "oil" then
      love.graphics.draw(oil, (5+nbTileShw)*64, 11*64)
    elseif j == "sugar" then
      love.graphics.draw(sugar, (5+nbTileShw)*64, 11*64)
    end
    
    nbTileShw = nbTileShw + 1
    
  end

end


function UI.mousepressed(x, y, button, istouch)
  if (x >= 5*64) and (x <= 6*64) and (y >=10*64) and (y <= 11*64) then
    recipeSelected = "brownie"
    soundBook:play()
  end
  if (x >= 6*64) and (x <= 7*64) and (y >=10*64) and (y <= 11*64) then
    recipeSelected = "cake"
    soundBook:play()
  end
  if (x >= 7*64) and (x <= 8*64) and (y >=10*64) and (y <= 11*64) then
    recipeSelected = "chocolateMilk"
    soundBook:play()
  end
  if (x >= 8*64) and (x <= 9*64) and (y >=10*64) and (y <= 11*64) then
    recipeSelected = "chocolateMouse"
    soundBook:play()
  end
  if (x >= 9*64) and (x <= 10*64) and (y >=10*64) and (y <= 11*64) then
    recipeSelected = "cookies"
    soundBook:play()
  end
  if (x >= 10*64) and (x <= 11*64) and (y >=10*64) and (y <= 11*64) then
    recipeSelected = "spread"
    soundBook:play()
  end
end


return UI