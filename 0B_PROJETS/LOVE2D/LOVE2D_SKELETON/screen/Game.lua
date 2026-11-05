
local player = require("objects.Player")
local enemies = require("objects.Enemies")
local background = require("objects.Background")
local ui = require("objects.Ui")

local Game = {}

DEBUG_GAME = false




-----------------------------------------------------------------------

function Game.load()

  background.load()
  player.load()
  enemies.load()
  ui.load()

end

-----------------------------------------------------------------------

function Game.update(dt)

  background.update(dt)
  player.update(dt)
  enemies.update(dt)
  ui.update(dt)

end

-----------------------------------------------------------------------

function Game.draw()
  background.draw()
  player.draw()
  enemies.draw()
  ui.draw()
end

-----------------------------------------------------------------------

local function check_collision(r1, r2)

  -- enemies rectangle
  local p0x = r1.x
  local p0y = r1.y + 64
  local p1x = r1.x + 64
  local p1y = r1.y

  -- bullet rectangle
  local p2x = r2.x
  local p2y = r2.y + player.sprite_bullet_h
  local p3x = r2.x + player.sprite_bullet_w
  local p3y = r2.y

  if
  p2x > p1x or
  p3x < p0x or
  p2y < p1y or
  p3y > p0y  then
    return false
  else
    return true
  end

end

-----------------------------------------------------------------------


-----------------------------------------------------------------------



-----------------------------------------------------------------------

function Game.keypressed(key, scancode, isrepeat)
  player.keypressed(key, scancode, isrepeat)
end

-----------------------------------------------------------------------

function Game.mousepressed(x, y, button, istouch)
  
end

-----------------------------------------------------------------------
function Game.touchpressed( id, x, y, dx, dy, pressure )
  if (x < love.graphics.getWidth() / 2) then

  end
  ui.touchpressed( id, x, y, dx, dy, pressure )
end

-----------------------------------------------------------------------
function Game.touchmoved( id, x, y, dx, dy, pressure )
  player.touchmoved( id, x, y, dx, dy, pressure )
end

function Game.touchreleased( id, x, y, dx, dy, pressure )
  player.touchreleased( id, x, y, dx, dy, pressure )
  ui.touchreleased( id, x, y, dx, dy, pressure )
end
-----------------------------------------------------------------------

-- generate random number from 1 -> 6
function Game.pickUpRandRecipe()
  math.randomseed(os.time())
  return math.random(1, 6)
end

-----------------------------------------------------------------------

function Game.mousemoved(x, y, dx, dy, istouch)
  player.mousemoved(x, y, dx, dy, istouch)
end

-----------------------------------------------------------------------

return Game