
local Player = {}

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


local anim_idle_left = false
local anim_idle_right = false
local anim_run_left = false
local anim_run_right = false
local anim_run_up = false
local anim_run_down = false

Player.x = 472
Player.y = 344
Player.speed = 1

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
      x = Player.x + PLAYER_SIZE / 2,
      y = Player.y + PLAYER_SIZE / 2,
      speed = Player.speed_shoot,
      d = Player.target_direction,
      x_start = Player.x + PLAYER_SIZE / 2,
      y_start = Player.y + PLAYER_SIZE / 2

    })

end

---------------------------------------------------

local function get_tile_from_coord(x, y)
  local i = math.floor((x / TILE_SIZE) + 1)
  local j = math.floor((y / TILE_SIZE) + 1)
  return i, j
end

---------------------------------------------------
local function update_corner_coord()
  Player.corner.top_left.x = Player.x
  Player.corner.top_left.y = Player.y

  Player.corner.bot_left.x = Player.x
  Player.corner.bot_left.y = Player.y + PLAYER_SIZE

  Player.corner.top_right.x = Player.x + PLAYER_SIZE
  Player.corner.top_right.y = Player.y


  Player.corner.bot_right.x = Player.x + PLAYER_SIZE
  Player.corner.bot_right.y = Player.y + PLAYER_SIZE

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

  if anim_idle_down then
    if animated_frame_to_show == 1 then
      love.graphics.draw(sprite_idle_down_1, Player.x, Player.y)
    end
    if animated_frame_to_show == 2 then
      love.graphics.draw(sprite_idle_down_2, Player.x, Player.y)
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

  love.graphics.setColor(1, 0, 0)
  love.graphics.rectangle("line", Player.x, Player.y, ENEMIES_SIZE, ENEMIES_SIZE)
  love.graphics.setColor(1, 1, 1)


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
function Player.update(dt)

  local direction_x = 0
  local direction_y = 0
  local direction_animation = ""

  if love.keyboard.isDown("up") then
    direction_y = -1

    Player.target_direction = "up"

    anim_idle_left = false
    anim_idle_right = false
    anim_run_left = false
    anim_run_right = false
    anim_run_up = true
    anim_run_down = false

  end

  if love.keyboard.isDown("left") then
    direction_x = -1

    Player.target_direction = "left"

    anim_idle_left = false
    anim_idle_right = false
    anim_run_left = true
    anim_run_right = false
    anim_run_up = false
    anim_run_down = false

  end

  if love.keyboard.isDown("down") then -- DOWN
    direction_y = 1

    Player.target_direction = "down"

    anim_idle_left = false
    anim_idle_right = false
    anim_run_left = false
    anim_run_right = false
    anim_run_up = false
    anim_run_down = true

  end

  if love.keyboard.isDown("right") then -- RIGHT
    direction_x = 1

    Player.target_direction = "right"

    anim_idle_left = false
    anim_idle_right = false
    anim_run_left = false
    anim_run_right = true
    anim_run_up = false
    anim_run_down = false

  end

  if direction_x == 0 and direction_y == 0 then
    --Player.target_direction = "none"

    anim_idle_left = false
    anim_idle_right = true
    anim_run_left = false
    anim_run_right = false
    anim_run_up = false
    anim_run_down = false
  end

  if love.keyboard.isDown("z") or love.keyboard.isDown("w") then
    timerShooter = timerShooter + dt
    if timerShooter >= Player.interval_shoot then
      Player.shoot()
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

  Player.x = (Player.x + (Player.speed * direction_x ))  --% love.graphics.getWidth()
  Player.y = (Player.y + (Player.speed * direction_y ))   --% love.graphics.getHeight()

  update_corner_coord()

  Player.animate_cat(dt)

  -- debug
  local debug = false
  if ((Player.x ~= old_player_x or Player.y ~= old_player_y) and debug == true) then
    print("Move : X" .. Player.x .. "        Y" .. Player.y)
    print("top_left : I" .. tostring(Player.corner.top_left.i) .. "     J" .. tostring(Player.corner.top_left.j))
    print("bot_left : I" .. tostring(Player.corner.bot_left.i) .. "     J" .. tostring(Player.corner.bot_left.j))
    print("top_right : I" .. tostring(Player.corner.top_right.i) .. "     J" .. tostring(Player.corner.top_right.j))
    print("bot_right : I" .. tostring(Player.corner.bot_right.i) .. "     J" .. tostring(Player.corner.bot_right.j))
    print("===============")
  end

  -- ckeck collisions

  if (tab_map[Player.corner.top_left.j][Player.corner.top_left.i] == 1 or tab_map[Player.corner.top_right.j][Player.corner.top_right.i] == 1) then collision_top = true end
  if (tab_map[Player.corner.bot_left.j][Player.corner.bot_left.i] == 1 or tab_map[Player.corner.bot_right.j][Player.corner.bot_right.i] == 1) then collision_bot = true end
  if (tab_map[Player.corner.top_left.j][Player.corner.top_left.i] == 1 or tab_map[Player.corner.bot_left.j][Player.corner.bot_left.i] == 1) then collision_left = true end
  if (tab_map[Player.corner.top_right.j][Player.corner.top_right.i] == 1 or tab_map[Player.corner.bot_right.j][Player.corner.bot_right.i] == 1) then collision_right = true end

  if ( collision_bot or collision_top or collision_left or collision_right) then
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