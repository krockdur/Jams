
local Player = {}

Player.status = {
  pv = 10,
  speed = 1,       
  fire = 1,
  invert_x = false, --
  invert_y = false, --
  time = 30,
  invicible = false  
}

local sprite_cat_001

local sprite_idle_left_1
local sprite_idle_left_2

local sprite_idle_right_1
local sprite_idle_right_2

local sprite_idle_top_1
local sprite_idle_top_2

local sprite_idle_down_1
local sprite_idle_down_2

local sprite_run_left_1
local sprite_run_left_2

local sprite_run_right_1
local sprite_run_right_2

local sprite_run_top_1
local sprite_run_top_2

local sprite_run_down_1
local sprite_run_down_2

local sound_shoot


local anim_idle_left = false
local anim_idle_right = false
local anim_idle_top = false
local anim_idle_down = false
local anim_run_left = false
local anim_run_right = false
local anim_run_up = false
local anim_run_down = false

Player.tile_begin_i = 5
Player.tile_begin_j = 5
Player.x = Player.tile_begin_i * 64 - TILE_SIZE/2 - PLAYER_SIZE/2
Player.y = Player.tile_begin_j * 64 - TILE_SIZE/2 - PLAYER_SIZE/2

Player.tab_bullets = {}
Player.interval_shoot = 0.1 --0.5 secondes
Player.speed_shoot = 300
Player.target_direction = "right" --
Player.fire_length = 50

Player.corner = {}
Player.corner.top_left = {}
Player.corner.top_left.x = 0
Player.corner.top_left.y = 0
Player.corner.top_left.i = 0
Player.corner.top_left.j = 0

Player.corner.bot_left = {}
Player.corner.bot_left.x = 0
Player.corner.bot_left.y = 0
Player.corner.bot_left.i = 0
Player.corner.bot_left.j = 0

Player.corner.top_right = {}
Player.corner.top_right.x = 0
Player.corner.top_right.y = 0  
Player.corner.top_right.i = 0
Player.corner.top_right.j = 0

Player.corner.bot_right = {}
Player.corner.bot_right.x = 0
Player.corner.bot_right.y = 0
Player.corner.bot_right.i = 0
Player.corner.bot_right.j = 0

---------------------------------------------------

function Player.shoot()

  table.insert(Player.tab_bullets, {

      --x = Player.x+Player.sprite_bullet_w/2,
      x = Player.x + PLAYER_SIZE / 2 - 3,
      y = Player.y + PLAYER_SIZE / 2 - 2,
      speed = Player.speed_shoot,
      d = Player.target_direction,
      x_start = Player.x + PLAYER_SIZE / 2 - 3,
      y_start = Player.y + PLAYER_SIZE / 2 - 2

    })

end

---------------------------------------------------

local function get_tile_from_coord(x, y)
  local i = math.floor((x / TILE_SIZE) + 1)
  local j = math.floor((y / TILE_SIZE) + 1)
  return i, j
end

---------------------------------------------------

local function is_player_collide_world(j, i)
  if  tab_map[j][i] ~= 7 and
      tab_map[j][i] ~= 10 and
      tab_map[j][i] ~= 5 and
      tab_map[j][i] ~= 23 then
    return true
  else
    return false
  end
end

---------------------------------------------------
local function update_corner_coord()
  local delta = 7
  Player.corner.top_left.x = Player.x + delta
  Player.corner.top_left.y = Player.y + delta

  Player.corner.bot_left.x = Player.x + delta 
  Player.corner.bot_left.y = Player.y + PLAYER_SIZE - delta

  Player.corner.top_right.x = Player.x + PLAYER_SIZE - delta
  Player.corner.top_right.y = Player.y + delta

  Player.corner.bot_right.x = Player.x + PLAYER_SIZE - delta
  Player.corner.bot_right.y = Player.y + PLAYER_SIZE - delta

  Player.corner.top_left.i, Player.corner.top_left.j = get_tile_from_coord(Player.corner.top_left.x, Player.corner.top_left.y)  
  Player.corner.bot_left.i, Player.corner.bot_left.j = get_tile_from_coord(Player.corner.bot_left.x, Player.corner.bot_left.y)
  Player.corner.top_right.i, Player.corner.top_right.j = get_tile_from_coord(Player.corner.top_right.x, Player.corner.top_right.y)
  Player.corner.bot_right.i, Player.corner.bot_right.j = get_tile_from_coord(Player.corner.bot_right.x, Player.corner.bot_right.y)

end


---------------------------------------------------

function Player.load()
  sprite_cat_001 = love.graphics.newImage("assets/cat_001.png")

  sprite_idle_left_1 = love.graphics.newImage("assets/cat_left_idle_1.png")
  sprite_idle_left_2 = love.graphics.newImage("assets/cat_left_idle_2.png")

  sprite_idle_right_1 = love.graphics.newImage("assets/cat_right_idle_1.png")
  sprite_idle_right_2 = love.graphics.newImage("assets/cat_right_idle_2.png")

  sprite_idle_top_1 = love.graphics.newImage("assets/cat_top_idle_1.png")
  sprite_idle_top_2 = love.graphics.newImage("assets/cat_top_idle_2.png")

  sprite_idle_down_1 = love.graphics.newImage("assets/cat_down_idle_1.png")
  sprite_idle_down_2 = love.graphics.newImage("assets/cat_down_idle_2.png")

  sprite_run_left_1 = love.graphics.newImage("assets/cat_left_run_1.png")
  sprite_run_left_2 = love.graphics.newImage("assets/cat_left_run_2.png")

  sprite_run_right_1 = love.graphics.newImage("assets/cat_right_run_1.png")
  sprite_run_right_2 = love.graphics.newImage("assets/cat_right_run_2.png")

  sprite_run_up_1 = love.graphics.newImage("assets/cat_up_run_1.png")
  sprite_run_up_2 = love.graphics.newImage("assets/cat_up_run_2.png")

  sprite_run_down_1 = love.graphics.newImage("assets/cat_down_run_1.png")
  sprite_run_down_2 = love.graphics.newImage("assets/cat_down_run_2.png")

  sound_shoot = love.audio.newSource("/assets/shoot.wav", "static")

  update_corner_coord()
end


---------------------------------------------------
local animated_frame_to_show = 0
function Player.draw()

  --love.graphics.draw(sprite_cat_001, Player.x, Player.y)

  if anim_idle_left then
    if animated_frame_to_show == 1 then
      love.graphics.draw(sprite_idle_left_1, Player.x, Player.y)
    end
    if animated_frame_to_show == 2 then
      love.graphics.draw(sprite_idle_left_2, Player.x, Player.y)
    end
  end

  if anim_idle_right then
    if animated_frame_to_show == 1 then
      love.graphics.draw(sprite_idle_right_1, Player.x, Player.y)
    end
    if animated_frame_to_show == 2 then
      love.graphics.draw(sprite_idle_right_2, Player.x, Player.y)
    end
  end

  if anim_idle_down then
    if animated_frame_to_show == 1 then
      love.graphics.draw(sprite_idle_down_1, Player.x, Player.y)
    end
    if animated_frame_to_show == 2 then
      love.graphics.draw(sprite_idle_down_2, Player.x, Player.y)
    end
  end

  if anim_idle_top then
    if animated_frame_to_show == 1 then
      love.graphics.draw(sprite_idle_top_1, Player.x, Player.y)
    end
    if animated_frame_to_show == 2 then
      love.graphics.draw(sprite_idle_top_2, Player.x, Player.y)
    end
  end

  if anim_run_left then
    if animated_frame_to_show == 1 then
      love.graphics.draw(sprite_run_left_1, Player.x, Player.y)
    end
    if animated_frame_to_show == 2 then
      love.graphics.draw(sprite_run_left_2, Player.x, Player.y)
    end
  end

  if anim_run_right then
    if animated_frame_to_show == 1 then
      love.graphics.draw(sprite_run_right_1, Player.x, Player.y)
    end
    if animated_frame_to_show == 2 then
      love.graphics.draw(sprite_run_right_2, Player.x, Player.y)
    end
  end

  if anim_run_down then
    if animated_frame_to_show == 1 then
      love.graphics.draw(sprite_run_down_1, Player.x, Player.y)
    end
    if animated_frame_to_show == 2 then
      love.graphics.draw(sprite_run_down_2, Player.x, Player.y)
    end
  end

  if anim_run_up then
    if animated_frame_to_show == 1 then
      love.graphics.draw(sprite_run_up_1, Player.x, Player.y)
    end
    if animated_frame_to_show == 2 then
      love.graphics.draw(sprite_run_up_2, Player.x, Player.y)
    end
  end

  --love.graphics.setColor(1, 0, 0)
  --love.graphics.rectangle("line", Player.x, Player.y, ENEMIES_SIZE, ENEMIES_SIZE)
  --love.graphics.setColor(1, 1, 1)


  for i,b in pairs(Player.tab_bullets) do
    -- love.graphics.draw(sprite_bullet_1, b.x, b.y, b.a, 1, 1, sprite_bullet_1:getWidth()/2, sprite_bullet_1:getHeight()/2)
    love.graphics.setColor(love.math.colorFromBytes(8, 24, 32))
    love.graphics.rectangle("fill", b.x, b.y, BULLET_SIZE, BULLET_SIZE)
    love.graphics.setColor(1, 1, 1)
  end

end

---------------------------------------------------
local timer_animation_cat = 0
local delay_between_2_frame = 0.15
function Player.animate_cat(dt)

  timer_animation_cat = timer_animation_cat + dt

  if timer_animation_cat >= 0 and timer_animation_cat < delay_between_2_frame then
    animated_frame_to_show = 1
  end
  if timer_animation_cat >= delay_between_2_frame and timer_animation_cat < 2 * delay_between_2_frame then
    animated_frame_to_show = 2
  end
  if timer_animation_cat >= 2 * delay_between_2_frame then
    timer_animation_cat = 0
  end

end

---------------------------------------------------

local timerShooter = 0
local last_direction = "right"
function Player.update(dt)

  -- update status
  Player.fire_length = 50 * Player.status.fire
  --

  local direction_x = 0
  local direction_y = 0
  local direction_animation = ""

  

  if love.keyboard.isDown("up") then
    if not Player.status.invert_y then
      direction_y = -1
      last_direction = "up"
      Player.target_direction = "up"

      anim_run_up = true
      anim_run_down = false
    else
      direction_y = 1
      last_direction = "down"
      Player.target_direction = "down"

      anim_run_up = false
      anim_run_down = true
    end

    anim_idle_left = false
    anim_idle_right = false
    anim_idle_top = false
    anim_idle_down = false
    anim_run_left = false
    anim_run_right = false

  end

  if love.keyboard.isDown("left") then
    if not Player.status.invert_x then
      direction_x = -1
      last_direction = "left"
      Player.target_direction = "left"
      anim_run_left = true
      anim_run_right = false
    else
      direction_x = 1
      last_direction = "right"
      Player.target_direction = "right"
      anim_run_left = false
      anim_run_right = true
    end

    anim_idle_left = false
    anim_idle_right = false
    anim_idle_top = false
    anim_idle_down = false
    anim_run_up = false
    anim_run_down = false

  end

  if love.keyboard.isDown("down") then -- DOWN

    if not Player.status.invert_y then
      direction_y = 1
      last_direction = "down"
      Player.target_direction = "down"
      anim_run_up = false
      anim_run_down = true
    else
      direction_y = -1
      last_direction = "up"
      Player.target_direction = "up"
      anim_run_up = true
      anim_run_down = false
    end

    anim_idle_left = false
    anim_idle_right = false
    anim_idle_top = false
    anim_idle_down = false
    anim_run_left = false
    anim_run_right = false

  end

  if love.keyboard.isDown("right") then -- RIGHT
    if not Player.status.invert_x then
      direction_x = 1
      last_direction = "right"
      Player.target_direction = "right"
      anim_run_left = false
      anim_run_right = true
    else
      direction_x = -1
      last_direction = "left"
      Player.target_direction = "left"
      anim_run_left = true
      anim_run_right = false
    end

    anim_idle_left = false
    anim_idle_right = false
    anim_idle_top = false
    anim_idle_down = false
    anim_run_up = false
    anim_run_down = false

  end

  if direction_x == 0 and direction_y == 0 then
    --Player.target_direction = "none"

    if last_direction == "up" then
      anim_idle_left = false
      anim_idle_right = false
      anim_idle_top = true
      anim_idle_down = false
    end
    if last_direction == "left" then
      anim_idle_left = true
      anim_idle_right = false
      anim_idle_top = false
      anim_idle_down = false
    end
    if last_direction == "right" then
      anim_idle_left = false
      anim_idle_right = true
      anim_idle_top = false
      anim_idle_down = false
    end
    if last_direction == "down" then
      anim_idle_left = false
      anim_idle_right = false
      anim_idle_top = false
      anim_idle_down = true
    end

    anim_run_left = false
    anim_run_right = false
    anim_run_up = false
    anim_run_down = false
  end

  if love.keyboard.isDown("z") or love.keyboard.isDown("w") then

    timerShooter = timerShooter + dt
    if timerShooter >= Player.interval_shoot then
      Player.shoot()
          sound_shoot:stop()
    sound_shoot:play()
      timerShooter = 0
    end

  end

    -- bullets
  for i,b in pairs(Player.tab_bullets) do

    -- si la bullet va trop loin
    if  b.x > b.x_start + Player.fire_length or 
        b.x < b.x_start - Player.fire_length or
        b.y > b.y_start + Player.fire_length or
        b.y < b.y_start - Player.fire_length then
      table.remove(Player.tab_bullets, i)
    end
    

    if b.d == "left" then
        b.x = b.x - b.speed * dt
    end
    if b.d == "right" then
        b.x = b.x + b.speed * dt
    end
    if b.d == "up" then
        b.y = b.y - b.speed * dt
    end
    if b.d == "down" then
        b.y = b.y + b.speed * dt
    end

  end

  local old_player_x = Player.x
  local old_player_y = Player.y

  Player.x = (Player.x + (Player.status.speed * direction_x ))  --% love.graphics.getWidth()
  Player.y = (Player.y + (Player.status.speed * direction_y ))   --% love.graphics.getHeight()

  update_corner_coord()

  Player.animate_cat(dt)

  -- ckeck collisions

  if is_player_collide_world( Player.corner.top_left.j, Player.corner.top_left.i) or is_player_collide_world( Player.corner.top_right.j, Player.corner.top_right.i) then
    collision_top = true 
  end
  if is_player_collide_world( Player.corner.bot_left.j, Player.corner.bot_left.i) or is_player_collide_world( Player.corner.bot_right.j, Player.corner.bot_right.i) then
    collision_bot = true 
  end
  if is_player_collide_world( Player.corner.top_left.j, Player.corner.top_left.i) or is_player_collide_world( Player.corner.bot_left.j, Player.corner.bot_left.i) then
    collision_left = true 
  end
  if is_player_collide_world( Player.corner.top_right.j, Player.corner.top_right.i) or is_player_collide_world( Player.corner.bot_right.j, Player.corner.bot_right.i) then
    collision_right = true 
  end

  if collision_bot or collision_top or collision_left or collision_right then
    Player.x = old_player_x
    Player.y = old_player_y
  end


  collision_bot = false
  collision_top = false
  collision_left = false 
  collision_right = false

end


---------------------------------------------------

function Player.keypressed(key, scancode, isrepeat)


end


---------------------------------------------------

function Player.mousemoved(x, y, dx, dy, istouch)
end

---------------------------------------------------

function Player.mousepressed(x, y, button, istouch)

end

---------------------------------------------------
function Player.touchmoved( id, x, y, dx, dy, pressure )

  
end

---------------------------------------------------

function Player.touchreleased( id, x, y, dx, dy, pressure )

end

---------------------------------------------------
return Player

---------------------------------------------------