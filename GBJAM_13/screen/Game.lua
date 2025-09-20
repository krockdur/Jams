
local map = require("objects.Map")
local player = require("objects.Player")
local wheel = require("objects.Wheel")
local enemies = require("objects.Enemies")
local background = require("objects.Background")
local ui = require("objects.Ui")

local Game = {}

DEBUG_GAME = false

local top_time
local reset_wheel_time_count = false
local timer_pop_wheel = 10
-----------------------------------------------------------------------

function Game.load()

  top_time = love.timer.getTime()

  map.load()

  background.load()
  player.load()
  wheel.load()
  enemies.load()
  ui.load()

end

-----------------------------------------------------------------------
function Game.check_col_Bullet_player_enemy(r1, r2)

  -- enemies rectangle
  local p0x = (r1.x - ENEMIES_SIZE / 2)
  local p0y = (r1.y - ENEMIES_SIZE / 2) + ENEMIES_SIZE
  local p1x = (r1.x - ENEMIES_SIZE / 2) + ENEMIES_SIZE
  local p1y = (r1.y - ENEMIES_SIZE / 2)

  -- bullet rectangle
  local p2x = r2.x
  local p2y = r2.y + BULLET_SIZE
  local p3x = r2.x + BULLET_SIZE
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
function Game.check_col_Bullet_enemy_player(r1, r2)

  -- enemies rectangle
  local p0x = r1.x
  local p0y = r1.y + ENEMIES_SIZE
  local p1x = r1.x + ENEMIES_SIZE
  local p1y = r1.y

  -- bullet rectangle
  local p2x = r2.x
  local p2y = r2.y + BULLET_SIZE
  local p3x = r2.x + BULLET_SIZE
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

function Game.update_collision(dt)
    -- check collision

    -- Joueur touche ennemi
    if #enemies.list ~= 0 and #player.tab_bullets ~= 0 then
      for j, e in pairs(enemies.list) do
        for i, b in pairs(player.tab_bullets) do
  
          --if Game.check_collision(enemies.list[j], player.tab_bullets[i]) then
          if Game.check_col_Bullet_player_enemy(e, b) then
            e.pv = e.pv - 1
            
            --sound_touch_1:stop()
            --sound_touch_1:play()
  
            -- animation si énnemie touché
            -- Game.add_anim_explosion(e.x, e.y)
  
            if e.pv <= 0 then

              --Game.calculate_score(e.points)

              table.remove(enemies.list, j)
              
            end
            table.remove(player.tab_bullets, i)
            break
          end
  
        end
  
      end
  
    end

    -- Ennemies touchent joueur
    if #enemies.tab_bullets ~= 0 then
      for i, b in pairs(enemies.tab_bullets) do
        if Game.check_col_Bullet_enemy_player(player, b) then
          print("Touché") -- todo
        end
      end
    end
end
-----------------------------------------------------------------------
-----------------------------------------------------------------------

function Game.update(dt)

  local current_time = love.timer.getTime()

  if ((current_time - top_time >= timer_pop_wheel) and (wheel.is_running == false) and wheel.is_bonus_select == false) then
    wheel.is_running = true

    -- Les énemies apparaissent et montent de niveau à chaque tour d'horloge
    enemies.pop_and_up_enemies()

  end
  
  if wheel.is_bonus_select then
    top_time = current_time
    wheel.is_bonus_select = false
  end

  Game.update_collision(dt)

  background.update(dt)
  player.update(dt)
  wheel.update(dt)
  enemies.update(dt)
  ui.update(dt)

end



-----------------------------------------------------------------------

function Game.draw()
 -- background.draw()
  love.graphics.push()

  -- position de la camera
  love.graphics.translate(-player.x - 8 + (screengame_width /2) , -player.y -8 + (screengame_height / 2))
  map.draw()
  player.draw()
  enemies.draw()



  -- Si timer out, alors on affiche la roue
  wheel.draw(player.x + 8 - (screengame_width /2), player.y + 8 - (screengame_height / 2))
  
  ui.draw()
  love.graphics.pop()
end

-----------------------------------------------------------------------





-----------------------------------------------------------------------

function Game.keypressed(key, scancode, isrepeat)
  player.keypressed(key, scancode, isrepeat)
  wheel.keypressed(key, scancode, isrepeat)
  
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