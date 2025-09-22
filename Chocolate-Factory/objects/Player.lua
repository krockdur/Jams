local Player = {}

-- Est ce que le joeur transporte de la nourriture
Player.isLoaded = false
Player.ingredientLoaded = 0

-- Tile en cours du player
Player.tileX = 5
Player.tileY = 3

-- Position de dessin du sprite
local posX = 320-64
local posY = 192-64

-- ref vers la map
local map

local CELERITY = 0.13

local direction = "front"

local spritePlayerFront
local spritePlayerBack
local spritePlayerLeft
local spritePlayerRight

local oilTr
local eggsTr
local milkTr
local cocoaTr
local flourTr
local sugarTr
local butterTr
local hazelnutTr
local chocolateChipsTr

local soundFoot

local left_key
local right_key
local up_key
local down_key


---------------------------------------------------

function Player.setKeyboard(lang)

  if lang == "azerty" then
    left_key = 'q'
    right_key = 'd'
    up_key = 'z'
    down_key = 's'
  elseif lang == "qwerty" then
    left_key = 'a'
    right_key = 'd'
    up_key = 'w'
    down_key = 's'
  end

end

---------------------------------------------------

function Player.init()
  Player.tileX = 5
  Player.tileY = 3
  posX = 320-64
  posY = 192-64
  direction = "front"
  Player.isLoaded = false
  Player.ingredientLoaded = 0
end

---------------------------------------------------

function Player.load()
  spritePlayerFront   = love.graphics.newImage("assets/chef.png")
  spritePlayerBack    = love.graphics.newImage("assets/chef-back.png")
  spritePlayerLeft    = love.graphics.newImage("assets/chef-left.png")
  spritePlayerRight   = love.graphics.newImage("assets/chef-right.png")

  oilTr               = love.graphics.newImage("assets/ingredients/oil-tr.png")
  eggsTr              = love.graphics.newImage("assets/ingredients/eggs-tr.png")
  milkTr              = love.graphics.newImage("assets/ingredients/milk-tr.png")
  cocoaTr             = love.graphics.newImage("assets/ingredients/cocoa-tr.png")
  flourTr             = love.graphics.newImage("assets/ingredients/flour-tr.png")
  sugarTr             = love.graphics.newImage("assets/ingredients/sugar-tr.png")
  butterTr            = love.graphics.newImage("assets/ingredients/butter-tr.png")
  hazelnutTr          = love.graphics.newImage("assets/ingredients/hazelnut-tr.png")
  chocolateChipsTr    = love.graphics.newImage("assets/ingredients/chocolate-chips-tr.png")

  soundFoot           = love.audio.newSource("assets/sounds/footstep06.ogg", "static")
end

---------------------------------------------------

--debug
local font = love.graphics.newFont("assets/SnesItalic-vmAPZ.ttf", 40)
local txtDebug = love.graphics.newText(font, "DEBUG")
local txtDebugTileX = love.graphics.newText(font, tostring(Player.tileX))
local txtDebugTileY = love.graphics.newText(font, tostring(Player.tileY))
--fin debug

function Player.draw()

  --player direction
  if direction == "front" then
    love.graphics.draw(spritePlayerFront, posX, posY)
  elseif direction == "back" then
    love.graphics.draw(spritePlayerBack, posX, posY)
  elseif direction == "left" then
    love.graphics.draw(spritePlayerLeft, posX, posY)  
  elseif direction == "right" then
    love.graphics.draw(spritePlayerRight, posX, posY)         
  end


  -- affiche ce que le player transporte
  if Player.isLoaded == true then

    if Player.ingredientLoaded == 11 then
      love.graphics.draw(milkTr, posX, posY)
    elseif Player.ingredientLoaded == 12 then
      love.graphics.draw(flourTr, posX, posY)
    elseif Player.ingredientLoaded == 13 then
      love.graphics.draw(cocoaTr, posX, posY)
    elseif Player.ingredientLoaded == 14 then
      love.graphics.draw(chocolateChipsTr, posX, posY)
    elseif Player.ingredientLoaded == 15 then
      love.graphics.draw(sugarTr, posX, posY)
    elseif Player.ingredientLoaded == 16 then
      love.graphics.draw(butterTr, posX, posY)
    elseif Player.ingredientLoaded == 17 then
      love.graphics.draw(oilTr, posX, posY)
    elseif Player.ingredientLoaded == 18 then
      love.graphics.draw(hazelnutTr, posX, posY)
    elseif Player.ingredientLoaded == 19 then
      love.graphics.draw(eggsTr, posX, posY)
    end

  end


  -- Affichage debug
  --love.graphics.draw(txtDebug, 32, 10)
  --love.graphics.draw(txtDebugTileX, 128, 10)
  --love.graphics.draw(txtDebugTileY, 192, 10)
  -- Fin affichage debug

end

---------------------------------------------------

local timer = 0
local speed = 200
function Player.update(dt)

  -- debug
  -- txtDebugTileX:set(tostring(Player.tileX))
  -- txtDebugTileY:set(tostring(Player.tileY))
  -- fin debug
  
      if love.keyboard.isDown(left_key) or love.keyboard.isDown('left') then
        direction = "left"
        
        local valueTileToTest = map.lvlCollision[Player.tileY][Player.tileX - 1]
        if valueTileToTest ~= 2 and valueTileToTest ~= 3 and valueTileToTest ~= 4 then
          posX = posX - speed * dt
        end

        --soundFoot:play()
      end
      
      if love.keyboard.isDown(right_key) or love.keyboard.isDown('right') then
        direction = "right"
        
        posX = posX + speed * dt

        soundFoot:play()
      end
      
      if love.keyboard.isDown(up_key) or love.keyboard.isDown('up') then
        direction = "back"
        
        posY = posY - speed * dt

        soundFoot:play()
      end
      if love.keyboard.isDown(down_key) or love.keyboard.isDown('down') then
        direction = "front"
        
        posY = posY + speed * dt

        soundFoot:play()
      end
      
      Player.tileX = math.modf(posX / 64)
      Player.tileY = math.modf(posY / 64)
      
      print("X: "..tostring(Player.tileX))
      print("Y: "..tostring(Player.tileY))
      
  --[[
    timer = timer + dt
    local timer_limit = CELERITY
    if timer >= timer_limit then

      timer = timer - timer_limit

      if love.keyboard.isDown(left_key) or love.keyboard.isDown('left') then
        direction = "left"
        Player.moveLeft(dt)

        soundFoot:play()
      end
      if love.keyboard.isDown(right_key) or love.keyboard.isDown('right') then
        direction = "right"
        Player.moveRight(dt)

        soundFoot:play()
      end
      if love.keyboard.isDown(up_key) or love.keyboard.isDown('up') then
        direction = "back"
        Player.moveUp(dt)

        soundFoot:play()
      end
      if love.keyboard.isDown(down_key) or love.keyboard.isDown('down') then
        direction = "front"
        Player.moveDown(dt)

        soundFoot:play()
      end
    end
  ]]--

end

---------------------------------------------------

function Player.moveLeft(dt)
  local nextTileX = Player.tileX - 1

  local valueTileToTest = map.lvlCollision[Player.tileY][nextTileX]
  if valueTileToTest ~= 2 and valueTileToTest ~= 3 and valueTileToTest ~= 4 then
    posX = posX - 64
    Player.tileX = nextTileX    
  end

end

---------------------------------------------------

function Player.moveRight(dt)
  local nextTileX = Player.tileX + 1

  local valueTileToTest = map.lvlCollision[Player.tileY][nextTileX]
  if valueTileToTest ~= 2 and valueTileToTest ~= 3 and valueTileToTest ~= 4 then
    posX = (posX + 64)
    Player.tileX = Player.tileX + 1
  end
end

---------------------------------------------------

function Player.moveDown(dt)
  local nextTileY = Player.tileY + 1

  local valueTileToTest = map.lvlCollision[nextTileY][Player.tileX]
  if valueTileToTest ~= 2 and valueTileToTest ~= 3 and valueTileToTest ~= 4 then
    posY = (posY + 64)
    Player.tileY = Player.tileY + 1
  end
end

---------------------------------------------------

function Player.moveUp(dt)
  local nextTileY = Player.tileY - 1

  local valueTileToTest = map.lvlCollision[nextTileY][Player.tileX]
  if valueTileToTest ~= 2 and valueTileToTest ~= 3 and valueTileToTest ~= 4 then
    posY = (posY - 64)
    Player.tileY = Player.tileY - 1
  end
end

---------------------------------------------------

function Player.setMap(Map)
  map = Map
end

---------------------------------------------------

function Player.transport(numIngredient)
  Player.isLoaded = true
  Player.ingredientLoaded = numIngredient
end

---------------------------------------------------

return Player








---------------------------------------------------