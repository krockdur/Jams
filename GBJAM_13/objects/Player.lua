
local Player = {}

local sprite_cat_001

Player.x = 472
Player.y = 344
Player.speed = 1

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
  update_corner_coord()
end




---------------------------------------------------

function Player.draw()

  love.graphics.draw(sprite_cat_001, Player.x, Player.y)

end

---------------------------------------------------

function Player.update(dt)

  local direction_x = 0
  local direction_y = 0
  if love.keyboard.isDown("z") or love.keyboard.isDown("w") then --UP
    direction_y = -1
  end
  if love.keyboard.isDown("q") or love.keyboard.isDown("a") then -- LEFT
    direction_x = -1
  end
  if love.keyboard.isDown("s") then -- DOWN
    direction_y = 1
  end
  if love.keyboard.isDown("d") then -- RIGHT
    direction_x = 1
  end

  local old_player_x = Player.x
  local old_player_y = Player.y

  Player.x = (Player.x + (Player.speed * direction_x ))  --% love.graphics.getWidth()
  Player.y = (Player.y + (Player.speed * direction_y ))   --% love.graphics.getHeight()

  update_corner_coord()

 

  -- debug
  if (Player.x ~= old_player_x or Player.y ~= old_player_y) then
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